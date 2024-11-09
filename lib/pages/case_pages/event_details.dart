import 'dart:async';
import 'package:flutter/material.dart';
import 'package:application/components/case_comp/case_textfield.dart';
import 'package:application/components/case_comp/case_textfield_high.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final double _interFieldsSpace = 20;

  // Mock data for the fields
  final Map<String, String> _mockData = {
    "Caller Phone Number": "123-456-7890",
    "Case Code": "CASE1234",
    "Activation Protocol": "Standard",
    "Solicitant": "John Doe",
    "Case Address": "123 Main Street",
    "Address Details": "Apt 4B, near the park",
    "Hazards": "Slippery surface",
    "Assets On Scene": "Ambulance, Fire Truck",
    "Description": "A fire broke out in the apartment, possible injuries."
  };

  // Controllers for each field
  late final Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    // Initialize controllers for all fields
    _controllers = {
      for (var key in _mockData.keys) key: TextEditingController()
    };
  }

  @override
  void dispose() {
    // Dispose all controllers
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _startFillingFields() {
    int index = 0;

    Timer.periodic(const Duration(milliseconds: 600), (timer) {
      if (index >= _mockData.keys.length) {
        timer.cancel(); // Stop the timer when all fields are filled
        return;
      }

      final field = _mockData.keys.elementAt(index);

      setState(() {
        _controllers[field]!.text = _mockData[field]!; // Update the controller
      });

      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CaseTextfield(
                  title: "Caller Phone Number",
                  controller: _controllers["Caller Phone Number"]!,
                ),
              ),
              SizedBox(width: _interFieldsSpace),
              Container(
                width: 300,
                child: CaseTextfield(
                  title: "Case Code",
                  controller: _controllers["Case Code"]!,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CaseTextfield(
                  title: "Activation Protocol",
                  controller: _controllers["Activation Protocol"]!,
                ),
              ),
              SizedBox(width: _interFieldsSpace),
              Expanded(
                child: CaseTextfield(
                  title: "Solicitant",
                  controller: _controllers["Solicitant"]!,
                ),
              ),
            ],
          ),
          CaseTextfield(
            title: "Case Address",
            controller: _controllers["Case Address"]!,
          ),
          CaseTextfield(
            title: "Address Details",
            controller: _controllers["Address Details"]!,
          ),
          Row(
            children: [
              Expanded(
                child: CaseTextfield(
                  title: "Hazards",
                  controller: _controllers["Hazards"]!,
                ),
              ),
              SizedBox(width: _interFieldsSpace),
              Expanded(
                child: CaseTextfield(
                  title: "Assets On Scene",
                  controller: _controllers["Assets On Scene"]!,
                ),
              ),
            ],
          ),
          CaseTextfieldHigh(
            title: "Description",
            controller: _controllers["Description"]!,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onLongPress: () {
                  _startFillingFields;
                },
                child: Container(
                  height: 50,
                  width: 200,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
