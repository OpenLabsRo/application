import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/components/case_comp/toggle_button.dart';

class AirwayPage extends StatefulWidget {
  const AirwayPage({super.key});

  @override
  State<AirwayPage> createState() => _AirwayPageState();
}

class _AirwayPageState extends State<AirwayPage> {
  String? selectedAirwayState;
  String? selectedObstructionState; // For dropdown options "Partial" or "Fully"

  void _onAirwayChanged(String value) {
    setState(() {
      selectedAirwayState = value;
      if (value != "Obstructed") {
        selectedObstructionState =
            null; // Reset obstruction state if not "Obstructed"
      }
    });
  }

  void _showDropdown(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          itemExtent: 40,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedObstructionState =
                  index == 0 ? "Partial Obstruction" : "Full Obstruction";
            });
          },
          children: const [
            Text(""),
            Text("Partial Obstruction"),
            Text("Full Obstruction"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          ToggleButton(
            title: "Airway",
            option1: "Open",
            option2: "Obstructed",
            onChanged: _onAirwayChanged,
          ),
          if (selectedAirwayState == "Obstructed")
            GestureDetector(
              onTap: () => _showDropdown(context),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  selectedObstructionState ?? "Select Obstruction Level",
                  style: TextStyle(
                    color: selectedObstructionState == null
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
