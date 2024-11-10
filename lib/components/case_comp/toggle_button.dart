import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String title;
  final String option1;
  final String option2;
  final String? initialSelected; // Allow null for no initial selection
  final ValueChanged<String>? onChanged; // Callback when the selection changes

  const ToggleButton({
    Key? key,
    required this.title,
    required this.option1,
    required this.option2,
    this.initialSelected,
    this.onChanged,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    // Set the initial selected value if provided
    _selectedValue = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA), // Same background color as text field
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: widget.option1,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value; // Update selected value
                        });
                        if (widget.onChanged != null && value != null) {
                          widget.onChanged!(value); // Call the callback
                        }
                      },
                      activeColor:
                          Colors.black, // Color of the radio when selected
                    ),
                    Text(
                      widget.option1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: widget.option2,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value; // Update selected value
                        });
                        if (widget.onChanged != null && value != null) {
                          widget.onChanged!(value); // Call the callback
                        }
                      },
                      activeColor:
                          Colors.black, // Color of the radio when selected
                    ),
                    Text(
                      widget.option2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
