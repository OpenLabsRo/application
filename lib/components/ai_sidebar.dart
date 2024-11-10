// ai_chat_sidebar.dart

import 'dart:async';
import 'package:application/functions/ai_response.dart';
import 'package:application/functions/openai_services.dart';
import 'package:flutter/material.dart';

class AiChatSidebar extends StatefulWidget {
  const AiChatSidebar({Key? key}) : super(key: key);

  @override
  _AiChatSidebarState createState() => _AiChatSidebarState();
}

class _AiChatSidebarState extends State<AiChatSidebar> {
  List<Map<String, String>> _messages = [];
  TextEditingController _messageController = TextEditingController();
  bool _isLoading = false;
  String _typingIndicatorText = '';
  Timer? _typingIndicatorTimer;

  // List to store suggested questions
  List<String> _suggestedQuestions = [];

  @override
  void dispose() {
    _messageController.dispose();
    _typingIndicatorTimer?.cancel();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      // Add user's message to the list
      _messages.add({'role': 'user', 'content': message});
      _isLoading = true;
      _suggestedQuestions = []; // Clear previous suggested questions
    });

    // Start typing indicator animation
    _startTypingIndicator();

    try {
      // Send message to OpenAI API
      AIResponse aiResponse = await OpenAIService.sendMessage(_messages);

      // Stop typing indicator
      _stopTypingIndicator();

      setState(() {
        // Add AI's response to the list
        // Format the AI response for display
        String aiResponseText = _formatAIResponse(aiResponse);
        _messages.add({'role': 'assistant', 'content': aiResponseText});

        // Update suggested questions
        _suggestedQuestions = aiResponse.suggestedQuestions;

        _isLoading = false;
      });
    } catch (e) {
      // Handle errors
      _stopTypingIndicator();
      setState(() {
        _messages
            .add({'role': 'assistant', 'content': 'Error: ${e.toString()}'});
        _isLoading = false;
      });
    }

    // Clear the message input
    _messageController.clear();
  }

  String _formatAIResponse(AIResponse response) {
    String procedures = response.procedures.isNotEmpty
        ? '-Procedures:\n  - ' + response.procedures.join('\n  - ')
        : '';
    String medication = response.medication.isNotEmpty
        ? '-Medication:\n  - ' + response.medication.join('\n  - ')
        : '';
    String alerts = response.alerts.isNotEmpty
        ? '-Alerts:\n  - ' + response.alerts.join('\n  - ')
        : '';

    return [procedures, medication, alerts]
        .where((s) => s.isNotEmpty)
        .join('\n\n');
  }

  void _startTypingIndicator() {
    _typingIndicatorText = '';
    _typingIndicatorTimer =
        Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (_typingIndicatorText.length >= 3) {
          _typingIndicatorText = '';
        } else {
          _typingIndicatorText += '.';
        }
      });
    });
  }

  void _stopTypingIndicator() {
    _typingIndicatorTimer?.cancel();
    _typingIndicatorText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title at the top
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text(
              'LifelineAI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Expanded widget for messages and input area
        Expanded(
          child: Column(
            children: [
              // Messages ListView
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: _messages.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _messages.length && _isLoading) {
                      // Show typing indicator
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            'AI is typing$_typingIndicatorText',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    } else {
                      var message = _messages[index];
                      bool isUser = message['role'] == 'user';

                      return Container(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue[300] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            message['content'] ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              // Suggested Questions
              if (_suggestedQuestions.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Suggested Questions:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ..._suggestedQuestions.map((question) => GestureDetector(
                            onTap: () {
                              if (!_isLoading) {
                                // Send the suggested question directly
                                _sendMessage(question);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              margin: EdgeInsets.only(bottom: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                              ),
                              child: Text(
                                question,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[700],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              // TextField and Send button at the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                        ),
                        onSubmitted: (value) {
                          String message = _messageController.text.trim();
                          if (message.isNotEmpty && !_isLoading) {
                            _sendMessage(message);
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          String message = _messageController.text.trim();
                          if (message.isNotEmpty && !_isLoading) {
                            _sendMessage(message);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
