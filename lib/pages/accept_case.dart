import 'package:action_slider/action_slider.dart';
import 'package:application/pages/case_pages/layout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcceptCase extends StatefulWidget {
  @override
  _AcceptCaseState createState() => _AcceptCaseState();
}

class _AcceptCaseState extends State<AcceptCase>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Color(0xFFF42D2D),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Big, bold, white case title with pulsing background
            Container(
              width: 700,
              child: Text(
                "Severe Heart Attack",
                style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Str. Splaiul Independentei 313B",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),

            ActionSlider.standard(
              toggleColor: Color(0xFFF42D2D),
              icon: Icon(
                CupertinoIcons.arrow_right,
                color: Colors.white,
                size: 60,
              ),
              width: 500,
              height: 120,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  const Text(
                    'Slide to confirm',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(milliseconds: 500));
                controller.success(); //starts success animation
                await Future.delayed(const Duration(milliseconds: 200));
                _launchUrl();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LayoutPage()),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}

final Uri _url = Uri.parse("shortcuts://run-shortcut?name=Orbis");

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
