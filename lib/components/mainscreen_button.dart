import 'package:flutter/material.dart';

class MainscreenButton extends StatelessWidget {
  final String text;
  final Color color;
  const MainscreenButton({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFFD8D8D8)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
