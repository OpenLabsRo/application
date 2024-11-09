import 'dart:async';
import 'package:application/components/stat_bar.dart';
import 'package:application/components/sub_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  bool _isSidebarOpen = false;
  bool _hasStats = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  String _currentTime = '';
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _updateTime();

    // Update the time every second
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEE MMM d');
    setState(() {
      _currentTime =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
      _currentDate = dateFormat.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 45,
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: _toggleSidebar,
                      child: Icon(
                        color: Colors.white,
                        CupertinoIcons.sidebar_left,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        // Add support functionality here
                      },
                      child: Text(
                        "Support",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        // Add police functionality here
                      },
                      child: Text(
                        "Police",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        // Add request hospital functionality here
                      },
                      child: Text(
                        "Request a Hospital",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "On Scene | $_currentDate, $_currentTime",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Sidebar
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isSidebarOpen ? 250.0 : 0.0,
                  color: Color(0xFFEAEAEA),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      if (_isSidebarOpen)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "MAI 42564",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.home, color: Colors.black),
                                title: Text("Event Details",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {},
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text("Primary Evaluation",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {},
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text("Secondary Evaluation",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {},
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text("Procedures",
                                    style: TextStyle(color: Colors.black)),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                // Main content area
                Expanded(
                  child: Column(
                    children: [
                      // Top bar

                      // Statistics bar
                      if (_hasStats) StatBar(),

                      // Action bar
                      SubTabBar(
                        tabs: {'Event Details': () {}, 'Patient Data': () {}},
                      ),

                      // Main content
                      Expanded(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          child:
                              Container(), // Load PatientDataPage or other content here
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
