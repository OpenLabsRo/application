import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseDOBField extends StatefulWidget {
  final String title;
  final bool unknown;
  final DateTime? initialDate; // New: Initial date
  final ValueChanged<DateTime?>?
      onDateChanged; // New: Callback for date changes

  const CaseDOBField({
    required this.title,
    required this.unknown,
    this.initialDate,
    this.onDateChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CaseDOBFieldState createState() => _CaseDOBFieldState();
}

class _CaseDOBFieldState extends State<CaseDOBField> {
  late DateTime? _selectedDate;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate; // Set initial date
    _controller = TextEditingController();
    _updateTextField();
  }

  void _updateTextField() {
    if (_selectedDate != null) {
      _controller.text =
          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
    } else {
      _controller.clear();
    }
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoDatePicker(
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.date,
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime date) {
            setState(() {
              _selectedDate = date;
              _updateTextField();
              if (widget.onDateChanged != null) {
                widget.onDateChanged!(date); // Notify parent
              }
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          SizedBox(height: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              readOnly:
                  !widget.unknown, // Make it read-only when unknown is false
              keyboardType:
                  widget.unknown ? TextInputType.number : TextInputType.none,
              onTap: widget.unknown
                  ? null
                  : () => _showDatePicker(
                      context), // Open date picker if not in unknown mode
              decoration: InputDecoration(
                hintText: widget.unknown ? 'Enter age' : 'Select DOB',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                filled: true,
                fillColor: Color(0xFFEAEAEA),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
