import 'package:flutter/material.dart';

class CaseTextfield extends StatelessWidget {
  final String title;
  final TextEditingController? controller; // Add controller

  const CaseTextfield({
    required this.title,
    this.controller, // Optional controller
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Set a fixed height for the text field container
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
            // Ensure the TextField takes up available height
            child: TextField(
              controller: controller, // Use the controller
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
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
              autofocus: false,
            ),
          ),
        ],
      ),
    );
  }
}
