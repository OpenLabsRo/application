import 'package:application/components/case_comp/case_textfield.dart';
import 'package:application/components/case_comp/checkmark_buttonfire.dart';
import 'package:flutter/material.dart';

// Ensure you include your CheckmarkButton component
// If you don't have it, I've provided the code below

class HemostasisPage extends StatefulWidget {
  const HemostasisPage({Key? key}) : super(key: key);

  @override
  _HemostasisPageState createState() => _HemostasisPageState();
}

class _HemostasisPageState extends State<HemostasisPage> {
  // Map to keep track of selected hemostasis methods
  Map<String, bool> _hemostasisOptions = {
    'Gauze': false,
    'Compress': false,
    'Tourniquet': false,
    'Other': false,
  };

  // Controller for the 'Altele' text field
  TextEditingController _othersController = TextEditingController();

  @override
  void dispose() {
    _othersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Select the used hemostasis procedures:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // List of hemostasis options
            Expanded(
              child: ListView(
                children: _hemostasisOptions.keys.map((method) {
                  return Column(
                    children: [
                      CheckmarkButtonFire(
                        label: method,
                        initialValue: _hemostasisOptions[method]!,
                        onChanged: (value) {
                          setState(() {
                            _hemostasisOptions[method] = value;
                            // If 'Altele' is unchecked, clear the text field
                            if (method == 'Altele' && !value) {
                              _othersController.clear();
                            }
                          });
                        },
                      ),
                      // If 'Altele' is selected, show the text field
                      if (method == 'Other' && _hemostasisOptions[method]!)
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CaseTextfield(title: "Specify other"),
                          ],
                        )
                    ],
                  );
                }).toList(),
              ),
            ),
            // You can add a button here to proceed or save the selected methods
          ],
        ),
      ),
    );
  }
}
