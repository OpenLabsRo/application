import 'package:flutter/material.dart';

class CaseTextfieldWeight extends StatefulWidget {
  final String title;
  final TextEditingController? controller; // Add controller as a parameter

  const CaseTextfieldWeight({
    required this.title,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _CaseTextfieldWeightState createState() => _CaseTextfieldWeightState();
}

class _CaseTextfieldWeightState extends State<CaseTextfieldWeight> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();

    // Use the provided controller or create an internal one
    _internalController = widget.controller ?? TextEditingController();

    // Add the "kg" suffix behavior
    _internalController.addListener(() {
      if (!_internalController.text.endsWith(" kg")) {
        final textWithoutSuffix =
            _internalController.text.replaceAll(" kg", "");
        _internalController.value = _internalController.value.copyWith(
          text: "$textWithoutSuffix kg",
          selection: TextSelection.collapsed(offset: textWithoutSuffix.length),
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose the internal controller only if it's not provided from outside
    if (widget.controller == null) {
      _internalController.dispose();
    }
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
              controller: _internalController,
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
