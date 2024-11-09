import 'package:application/components/case_comp/case_textfield.dart';
import 'package:application/components/case_comp/case_textfield_age.dart';
import 'package:application/components/case_comp/case_textfield_weight.dart';
import 'package:application/components/case_comp/checkmark_button.dart'; // Import CheckmarkButton here
import 'package:application/components/case_comp/toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientData extends StatefulWidget {
  const PatientData({Key? key}) : super(key: key);

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  final double _interFieldsSpace = 20;
  bool _isDOBUnknown = false; // State to track if DOB is unknown

  void _toggleDOBUnknown(bool isUnknown) {
    setState(() {
      _isDOBUnknown = isUnknown; // Update DOB unknown state
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
                child: CaseTextfield(title: "National Identity Number"),
              ),
              SizedBox(
                width: _interFieldsSpace,
              ),
              GestureDetector(
                // onTap: () async {
                //   // Navigate to CameraPage to scan ID
                //   final result = await Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => CameraPage()),
                //   );
                //   if (result != null) {
                //     print('Scanned MRZ Result: $result');
                //   }
                // },
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Container(
                    height: 49,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFEAEAEA)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Scan ID",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: .8),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(CupertinoIcons.camera_fill),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: CaseTextfield(title: "Last Name")),
              SizedBox(width: _interFieldsSpace),
              Expanded(child: CaseTextfield(title: "First Name")),
            ],
          ),
          Row(
            children: [
              Container(
                width: 300,
                child: CaseTextfieldWeight(title: "Weight"),
              ),
              SizedBox(width: _interFieldsSpace),
              Expanded(
                child: ToggleButton(
                  title: "Sex",
                  option1: "Male",
                  option2: "Female",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CaseDOBField(
                  title: "Date Of Birth",
                  unknown: _isDOBUnknown, // Pass DOB unknown state
                ),
              ),
              SizedBox(width: _interFieldsSpace),
              Container(
                width: 300,
                child: CheckmarkButton(
                  label: "Unknown",
                  initialValue: _isDOBUnknown,
                  onChanged:
                      _toggleDOBUnknown, // Callback to update unknown state
                ),
              ),
            ],
          ),
          CaseTextfield(title: "Patient Address"),
          CaseTextfield(title: "Known Allergies"),
          CaseTextfield(title: "Known Diseases"),
        ],
      ),
    );
  }
}
