import 'package:application/helpers/mrzresult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'camera_page.dart';
import 'package:application/components/case_comp/case_textfield.dart';
import 'package:application/components/case_comp/case_textfield_age.dart';
import 'package:application/components/case_comp/case_textfield_weight.dart';
import 'package:application/components/case_comp/checkmark_button.dart';
import 'package:application/components/case_comp/toggle_button.dart';

class PatientData extends StatefulWidget {
  const PatientData({Key? key}) : super(key: key);

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  final double _interFieldsSpace = 20;
  bool _isDOBUnknown = false;

  // Controllers for text fields to allow programmatic updates
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _selectedSex = 'Male';
  DateTime? _dateOfBirth;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _diseasesController = TextEditingController();

  void _toggleDOBUnknown(bool isUnknown) {
    setState(() {
      _isDOBUnknown = isUnknown;
    });
  }

  // Function to navigate to CameraPage and handle the result
  Future<void> _scanID() async {
    final MRZResult? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraPage()),
    );

    if (result != null) {
      // Ensure UI updates are done on the main thread
      setState(() {
        _nationalIdController.text = result.documentNumber ?? '';
        _lastNameController.text = result.surnames ?? '';
        _firstNameController.text = result.givenNames ?? '';
        _selectedSex = (result.sex == 'M') ? 'Male' : 'Female';

        // Parse birth date
        if (result.birthDate != null) {
          _dateOfBirth = result.birthDate;
          _isDOBUnknown = false;
        } else {
          _dateOfBirth = null;
          _isDOBUnknown = true;
        }
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _nationalIdController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _weightController.dispose();
    _addressController.dispose();
    _allergiesController.dispose();
    _diseasesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Added SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CaseTextfield(
                    title: "National Identity Number",
                    controller: _nationalIdController,
                  ),
                ),
                SizedBox(
                  width: _interFieldsSpace,
                ),
                GestureDetector(
                  onTap: _scanID,
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
                Expanded(
                  child: CaseTextfield(
                    title: "Last Name",
                    controller: _lastNameController,
                  ),
                ),
                SizedBox(width: _interFieldsSpace),
                Expanded(
                  child: CaseTextfield(
                    title: "First Name",
                    controller: _firstNameController,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 300,
                  child: CaseTextfieldWeight(
                    title: "Weight",
                    controller: _weightController,
                  ),
                ),
                SizedBox(width: _interFieldsSpace),
                Expanded(
                  child: ToggleButton(
                    title: "Sex",
                    option1: "Male",
                    option2: "Female",
                    initialSelected: _selectedSex,
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CaseDOBField(
                    title: "Date Of Birth",
                    unknown: _isDOBUnknown,
                    initialDate: _dateOfBirth,
                    onDateChanged: (date) {
                      setState(() {
                        _dateOfBirth = date;
                      });
                    },
                  ),
                ),
                SizedBox(width: _interFieldsSpace),
                Container(
                  width: 300,
                  child: CheckmarkButton(
                    label: "Unknown",
                    initialValue: _isDOBUnknown,
                    onChanged: _toggleDOBUnknown,
                  ),
                ),
              ],
            ),
            CaseTextfield(
              title: "Patient Address",
              controller: _addressController,
            ),
            CaseTextfield(
              title: "Known Allergies",
              controller: _allergiesController,
            ),
            CaseTextfield(
              title: "Known Diseases",
              controller: _diseasesController,
            ),
          ],
        ),
      ),
    );
  }
}
