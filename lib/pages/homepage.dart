import 'dart:async';

import 'package:application/components/mainscreen_button.dart';
import 'package:application/pages/accept_case.dart';
import 'package:application/pages/case_pages/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _currentTime = '';
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _updateTime();

    // Update the time every second
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, MMMM d');
    setState(() {
      _currentTime =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
      _currentDate = dateFormat.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0XFFF42D2D)),
            width: MediaQuery.of(context).size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    _currentDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _currentTime,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  Text(
                    'Ambulance: MAI 245356',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset(
                    'assets/logos/lifeline.svg',
                    height: 42,
                  )
                ],
              ),
            ),
          ),
          Container(
              child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AcceptCase()),
                        );
                      });
                    },
                    child: MainscreenButton(
                      color: Colors.blue,
                      text: "Current Case",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MainscreenButton(
                    color: Colors.deepOrange,
                    text: "Past Cases",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CameraPage()),
                      // );
                    },
                    child: MainscreenButton(
                      color: Colors.grey,
                      text: "Settings",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LayoutPage()),
                      );
                    },
                    child: MainscreenButton(
                      color: Colors.red,
                      text: "Log-Out",
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
