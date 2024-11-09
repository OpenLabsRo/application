import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsualSymptomsPage extends StatefulWidget {
  const UsualSymptomsPage({super.key});

  @override
  State<UsualSymptomsPage> createState() => _UsualSymptomsPageState();
}

class _UsualSymptomsPageState extends State<UsualSymptomsPage> {
  String? selectedSymptom; // Nausea, Vomiting, Sweating, Dizziness, Pain
  TextEditingController painZoneController = TextEditingController();

  void _onSymptomChanged(String value) {
    setState(() {
      selectedSymptom = value;
      if (value != "Pain") {
        painZoneController.clear(); // Clear text field if not "Pain"
      }
    });
  }

  void _showDropdown(
      BuildContext context, List<String> options, Function(String) onSelected) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          itemExtent: 40,
          onSelectedItemChanged: (index) {
            onSelected(options[index]);
          },
          children: options.map((e) => Text(e)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Symptoms Dropdown
          GestureDetector(
            onTap: () => _showDropdown(
                context,
                ["Nausea", "Vomiting", "Sweating", "Dizziness", "Pain"],
                _onSymptomChanged),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                selectedSymptom ?? "Select Symptom",
                style: TextStyle(
                  color: selectedSymptom == null ? Colors.grey : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Pain Zone TextField (if Pain is selected)
          if (selectedSymptom == "Pain")
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pain Location",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: painZoneController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(style: BorderStyle.none, width: 0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      filled: true,
                      fillColor: const Color(0xFFEAEAEA),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
