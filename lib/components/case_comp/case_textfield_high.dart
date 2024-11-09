import 'package:flutter/material.dart';

class CaseTextfieldHigh extends StatelessWidget {
  final String title;
  final TextEditingController? controller; // Add controller

  const CaseTextfieldHigh({
    required this.title,
    this.controller, // Optional controller
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Fixed height to accommodate three lines of text
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TextField(
              controller: controller, // Use the controller
              maxLines: 3, // Allow up to three lines
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                filled: true,
                fillColor: Color(0xFFEAEAEA),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              autofocus: false,
            ),
          ),
        ],
      ),
    );
  }
}
