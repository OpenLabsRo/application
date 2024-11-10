import 'package:application/components/case_comp/checkmark_button.dart';
import 'package:application/components/case_comp/checkmark_buttonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Ensure you include your CheckmarkButton component
// import 'path_to_your_component/checkmark_button.dart';

class TraumaPage extends StatefulWidget {
  const TraumaPage({Key? key}) : super(key: key);

  @override
  _TraumaPageState createState() => _TraumaPageState();
}

class _TraumaPageState extends State<TraumaPage> {
  String? _selectedTrauma;

  // For 'Fracture' sub-options
  String? _selectedFractureType;

  // For 'Burn' sub-options (multiple choice)
  Map<String, bool> _burnOptions = {
    'Airways Affected': false,
    'Flame': false,
    'Solid': false,
    'Liquid': false,
    'Vapors': false,
    'Gas': false,
    'Chemical': false,
  };

  // Method to show custom dropdown using CupertinoPicker
  void _showDropdown(
      BuildContext context, List<String> options, Function(String) onSelected) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40,
          onSelectedItemChanged: (index) {
            onSelected(options[index]);
          },
          children: options.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
    );
  }

  void _onTraumaTypeSelected(String value) {
    setState(() {
      _selectedTrauma = value;
      _selectedFractureType = null; // Reset fracture sub-option
      _burnOptions.updateAll((key, value) => false); // Reset burn options
    });
  }

  void _onFractureTypeSelected(String value) {
    setState(() {
      _selectedFractureType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of trauma types
    List<String> traumaTypes = [
      '',
      'Wound',
      'Contusion',
      'Fracture',
      'Burn',
      'Hypothermia',
      'Drowning'
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Custom dropdown for selecting trauma type
            GestureDetector(
              onTap: () =>
                  _showDropdown(context, traumaTypes, _onTraumaTypeSelected),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  _selectedTrauma ?? "Select Trauma Type",
                  style: TextStyle(
                    color: _selectedTrauma == null ? Colors.grey : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Show sub-options based on selected trauma type
            if (_selectedTrauma == 'Fracture') ...[
              // Fracture Type Dropdown
              GestureDetector(
                onTap: () => _showDropdown(
                    context, ['', 'Open', 'Closed'], _onFractureTypeSelected),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEAEA),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _selectedFractureType ?? "Select Fracture Type",
                    style: TextStyle(
                      color: _selectedFractureType == null
                          ? Colors.grey
                          : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ] else if (_selectedTrauma == 'Burn') ...[
              Text(
                'Burn Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: _burnOptions.keys.map((option) {
                    return CheckmarkButtonFire(
                      label: option,
                      initialValue: _burnOptions[option]!,
                      onChanged: (value) {
                        setState(() {
                          _burnOptions[option] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ] else if (_selectedTrauma != null)
              ...[],
          ],
        ),
      ),
    );
  }
}
