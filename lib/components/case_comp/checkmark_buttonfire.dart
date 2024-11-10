import 'package:flutter/material.dart';

class CheckmarkButtonFire extends StatefulWidget {
  final String label;
  final bool initialValue; // Initial checked state
  final ValueChanged<bool>?
      onChanged; // Callback when the checkbox state changes

  const CheckmarkButtonFire({
    Key? key,
    required this.label,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _CheckmarkButtonFireState createState() => _CheckmarkButtonFireState();
}

class _CheckmarkButtonFireState extends State<CheckmarkButtonFire> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue; // Set initial checked state
  }

  void _toggleCheck() {
    setState(() {
      _isChecked = !_isChecked; // Toggle checked state
      widget.onChanged?.call(_isChecked); // Trigger callback
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheck,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                      widget.onChanged?.call(_isChecked);
                    });
                  },
                  activeColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}