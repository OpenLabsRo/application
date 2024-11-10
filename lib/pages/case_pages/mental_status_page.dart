import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/components/case_comp/toggle_button.dart';
import 'package:application/models/primary_evaluation.dart';
import 'package:application/providers/case_provider.dart';
import 'package:provider/provider.dart';

class MentalStatusPage extends StatefulWidget {
  const MentalStatusPage({super.key});

  @override
  State<MentalStatusPage> createState() => _MentalStatusPageState();
}

class _MentalStatusPageState extends State<MentalStatusPage> {
  String? selectedConsciousState;
  String? selectedMentalState; // For dropdown options "Normal" or "Altered"

  void _SendMentalStatus(String? consciousState, String? mentalState) async {
    MentalStatus mental = MentalStatus(
        conscious: MentalConscious(normal: false, altered: false),
        unconscious: false);
    if (mentalState == "Unconscious") {
      mental.unconscious = true;
    } else {
      if (consciousState == "Normal") {
        mental.conscious?.normal = true;
      } else {
        mental.conscious?.altered = true;
      }
    }

    final caseProvider = Provider.of<CaseProvider>(context, listen: false);
    await caseProvider.sendMentalStatus(mental);
  }

  void _onConsciousnessChanged(String value) {
    setState(() {
      selectedConsciousState = value;
      if (value != "Conscious") {
        selectedMentalState = null; // Reset mental state if not "Conscious"
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
              selectedMentalState = index == 0 ? "Normal" : "Altered";
            });
          },
          children: const [
            Text("Normal"),
            Text("Altered"),
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
            title: "Consciousness",
            option1: "Conscious",
            option2: "Unconscious",
            onChanged: _onConsciousnessChanged,
          ),
          if (selectedConsciousState == "Conscious")
            GestureDetector(
              onTap: () => _showDropdown(context),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  selectedMentalState ?? "Select Mental State",
                  style: TextStyle(
                    color: selectedMentalState == null
                        ? Colors.grey
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<CaseProvider>(builder: (context, caseProvider, _) {
                return GestureDetector(
                  onTap: () async {
                    print("hello world");
                    _SendMentalStatus(
                        selectedConsciousState, selectedMentalState);
                    // await caseProvider.sendMentalStatus(mental);
                  },
                  child: Container(
                    color: Colors.black.withOpacity(1),
                    height: 200,
                    width: 200,
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
