import 'package:flutter/material.dart';

class CaseTextfieldWeight extends StatefulWidget {
  final String title;
  const CaseTextfieldWeight({required this.title, super.key});

  @override
  _CaseTextfieldWeightState createState() => _CaseTextfieldWeightState();
}

class _CaseTextfieldWeightState extends State<CaseTextfieldWeight> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      if (!_controller.text.endsWith(" kg")) {
        final textWithoutSuffix = _controller.text.replaceAll(" kg", "");
        _controller.value = _controller.value.copyWith(
          text: "$textWithoutSuffix kg",
          selection: TextSelection.collapsed(offset: textWithoutSuffix.length),
        );
      }
    });
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
