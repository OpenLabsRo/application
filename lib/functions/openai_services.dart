import 'dart:convert';
import 'package:application/functions/ai_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  static Future<AIResponse> sendMessage(
      List<Map<String, String>> messages) async {
    // Build the conversation with the new system prompt
    List<Map<String, String>> conversation = [
      {
        'role': 'system',
        'content': '''
You are an EMS paramedic assistant providing real-time recommendations to paramedics based on incoming patient vitals and case updates.

Your response should be accurate, clear, and actionable. Double-check all recommendations, do not provide uncertain or invented information. Provide guidance under specified categories to assist paramedics effectively.

# Steps

1. **Evaluate Incoming Information**: Assess the provided updates on patient vitals and case specifics.
   - Look for trends in vitals that may indicate stability or deterioration.
   - Review the context of the case, such as specific symptoms or ongoing interventions.

2. **Provide Recommendations**:
   - Categorize information appropriately.
   - Offer **Procedures** based on current circumstances.
   - Suggest **Medication** with accurate dosages if the patient's condition matches the requirement.
   - Issue **Alerts** if the situation involves risk factors or symptoms requiring urgent attention.

3. **Suggest Follow-up Questions**:
   - Provide two suggested questions that the paramedics could ask chatgpt to gain more information or clarify the situation.

4. **Stay Within Scope**:
    - Recommendations must follow standard emergency medicine protocols and guidelines.
    - If there is insufficient data, do not infer recommendations.

# Output Format

Provide your response in **valid JSON format** with the following structure:

```json
{
  "Procedures": ["List of specific recommended procedures"],
  "Medication": ["List of medication recommendations with dosage if appropriate"],
  "Alerts": ["List of key concerns or risks for immediate attention"],
  "SuggestedQuestions": ["First suggested question", "Second suggested question"]
}
Provide your response in **valid JSON format** with the following structure, and ensure that you do not include any text before or after the JSON object:

Examples

Example 1 (simplified for illustration):

Input:
Patient is a 55-year-old male, unresponsive, BP is 80/50 mmHg, HR is 115 bpm, suspected cardiac event.
Response:
{
  "Procedures": ["Start oxygen at 15 LPM via mask", "Start IV line with normal saline", "Prepare for defibrillation"],
  "Medication": ["Administer 300 mg Aspirin (if not allergic)", "Administer Epinephrine 1 mg IV if cardiac arrest"],
  "Alerts": ["Hypotension and elevated heart rate", "Possible cardiogenic shock", "Monitor airway and prepare for CPR"],
  "SuggestedQuestions": ["When should I take action on the cardiac event?", "Should I administer Adrenaline?"]
}
Notes

Always prioritize airway, breathing, and circulation in critical updates.
Alert paramedics to any change in patient conditions requiring immediate response.
Use clinical judgment and official EMS protocols based on the provided information. '''
      },
      ...messages
    ];
    var data = {
      'model': 'gpt-4',
      'messages': conversation,
      'temperature': 0.5,
    };

    var apiKey = dotenv.env['OPENAI_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception(
          'API key is missing. Please set OPENAI_API_KEY in your .env file.');
    }

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var aiMessageContent = jsonResponse['choices'][0]['message']['content'];

      // Debug: Print the AI's raw response
      debugPrint('AI Raw Response: $aiMessageContent');

      // Trim the AI's response
      aiMessageContent = aiMessageContent.trim();

      // Remove code fences if present
      aiMessageContent = _removeCodeFences(aiMessageContent);

      // Extract the JSON object from the response
      String? jsonString = _extractJsonString(aiMessageContent);

      if (jsonString != null) {
        try {
          Map<String, dynamic> aiResponseJson = jsonDecode(jsonString);
          AIResponse aiResponse = AIResponse.fromJson(aiResponseJson);
          return aiResponse;
        } catch (e) {
          throw Exception(
              'Failed to parse AI response: $e\nAI Response: $jsonString');
        }
      } else {
        throw Exception(
            'AI response does not contain a valid JSON object.\nAI Response: $aiMessageContent');
      }
    } else {
      var errorResponse = jsonDecode(response.body);
      var errorMessage = errorResponse['error']['message'];
      throw Exception('OpenAI API Error: $errorMessage');
    }
  }
}

// Helper method to remove code fences
String _removeCodeFences(String input) {
  // Remove any code fences or language identifiers
  return input.replaceAllMapped(RegExp(r'```[a-zA-Z]*\n([\s\S]*?)\n```'),
      (match) {
    return match.group(1) ?? '';
  }).trim();
}

// Helper method to extract JSON string
String? _extractJsonString(String input) {
  int startIndex = input.indexOf('{');
  int endIndex = input.lastIndexOf('}');

  if (startIndex != -1 && endIndex != -1 && endIndex > startIndex) {
    return input.substring(startIndex, endIndex + 1);
  }
  return null;
}
