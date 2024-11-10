import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntubationPage extends StatefulWidget {
  const IntubationPage({Key? key}) : super(key: key);

  @override
  _IntubationPageState createState() => _IntubationPageState();
}

class _IntubationPageState extends State<IntubationPage> {
  String? _selectedIntubationType;

  // Method to show custom dropdown using CupertinoPicker
  void _showIntubationOptions(BuildContext context) {
    List<String> options = [
      '',
      'Supraglottic',
      'Orotracheal Tube',
      'Nasal Cannula',
    ];

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40,
          scrollController: FixedExtentScrollController(
            initialItem: _selectedIntubationType != null
                ? options.indexOf(_selectedIntubationType!)
                : 0,
          ),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedIntubationType = options[index];
            });
          },
          children: options.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
    );
  }

  void _onAddIntubation() {
    _showIntubationOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Button to add intubation
            GestureDetector(
              onTap: _onAddIntubation,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  _selectedIntubationType ?? 'Click to add intubation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display selected intubation type
            if (_selectedIntubationType != null)
              Text(
                'Selected Intubation: $_selectedIntubationType',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
