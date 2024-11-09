import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreathingPage extends StatefulWidget {
  const BreathingPage({super.key});

  @override
  State<BreathingPage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage> {
  String? selectedBreathingState; // Normal, Absent, Dyspnea, Intubated
  String? selectedIntubationType; // Guedel Airway, Endotracheal Tube
  String? selectedVentilationType; // Mechanically Vented, Balloon

  void _onBreathingChanged(String value) {
    setState(() {
      selectedBreathingState = value;
      if (value != "Intubated") {
        selectedIntubationType = null;
        selectedVentilationType = null; // Reset nested options
      }
    });
  }

  void _onIntubationTypeChanged(String value) {
    setState(() {
      selectedIntubationType = value;
      if (value != "Endotracheal Tube") {
        selectedVentilationType = null; // Reset deeper nested options
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
          // Main breathing options
          GestureDetector(
            onTap: () => _showDropdown(
                context,
                ["", "Normal", "Absent", "Dyspnea", "Intubated"],
                _onBreathingChanged),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                selectedBreathingState ?? "Select Breathing State",
                style: TextStyle(
                  color: selectedBreathingState == null
                      ? Colors.grey
                      : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Intubation options (if Intubated is selected)
          if (selectedBreathingState == "Intubated")
            GestureDetector(
              onTap: () => _showDropdown(
                  context,
                  ["Guedel Airway", "Endotracheal Tube"],
                  _onIntubationTypeChanged),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedIntubationType ?? "Select Intubation Type",
                  style: TextStyle(
                    color: selectedIntubationType == null
                        ? Colors.grey
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),

          // Ventilation options (if Endotracheal Tube is selected)
          if (selectedIntubationType == "Endotracheal Tube")
            GestureDetector(
              onTap: () => _showDropdown(
                  context, ["", "Mechanically Vented", "Balloon"], (value) {
                setState(() {
                  selectedVentilationType = value;
                });
              }),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedVentilationType ?? "Select Ventilation Type",
                  style: TextStyle(
                    color: selectedVentilationType == null
                        ? Colors.grey
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
