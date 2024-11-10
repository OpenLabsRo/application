import 'package:application/components/case_comp/checkmark_buttonfire.dart';
import 'package:flutter/material.dart';

// Ensure you include your CheckmarkButton component
// If you don't have it, I've provided the code below

class TraumaProcedurePage extends StatefulWidget {
  const TraumaProcedurePage({Key? key}) : super(key: key);

  @override
  _TraumaProcedurePageState createState() => _TraumaProcedurePageState();
}

class _TraumaProcedurePageState extends State<TraumaProcedurePage> {
  // Map to keep track of selected procedures
  Map<String, bool> _procedureOptions = {
    'Extricated': false,
    'Cervical Collar': false,
    'Vacuum Splints': false,
    'Kendrick Extrication Device': false,
    'Shovel Stretcher': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Select Procedures Applied:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _procedureOptions.keys.map((procedure) {
                  return CheckmarkButtonFire(
                    label: procedure,
                    initialValue: _procedureOptions[procedure]!,
                    onChanged: (value) {
                      setState(() {
                        _procedureOptions[procedure] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            // You can add a button here to proceed or save the selected procedures
          ],
        ),
      ),
    );
  }
}
