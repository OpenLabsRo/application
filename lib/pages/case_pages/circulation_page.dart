import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirculationPage extends StatefulWidget {
  const CirculationPage({super.key});

  @override
  State<CirculationPage> createState() => _CirculationPageState();
}

class _CirculationPageState extends State<CirculationPage> {
  String? selectedCirculationState; // Present, Absent
  String?
      selectedPulseType; // Full, Filiform, Rhythmic, Arrhythmic, Bradycardia, Tachycardia

  void _onCirculationChanged(String value) {
    setState(() {
      selectedCirculationState = value;
      if (value != "Present") {
        selectedPulseType = null; // Reset nested options if not "Present"
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
          // Main circulation options
          GestureDetector(
            onTap: () => _showDropdown(
                context, ["", "Present", "Absent"], _onCirculationChanged),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                selectedCirculationState ?? "Select Circulation State",
                style: TextStyle(
                  color: selectedCirculationState == null
                      ? Colors.grey
                      : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Pulse type options (if Present is selected)
          if (selectedCirculationState == "Present")
            GestureDetector(
              onTap: () => _showDropdown(context, [
                "Full",
                "Filiform",
                "Rhythmic",
                "Arrhythmic",
                "Bradycardia",
                "Tachycardia"
              ], (value) {
                setState(() {
                  selectedPulseType = value;
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
                  selectedPulseType ?? "Select Pulse Type",
                  style: TextStyle(
                    color:
                        selectedPulseType == null ? Colors.grey : Colors.black,
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
