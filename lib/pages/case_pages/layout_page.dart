import 'dart:async';
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
  String bpm = "72";
  String spo2 = "98";
  String nibp = "120/80";
  String etco2 = "35";

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
                  color: Color(0xFFB3B3B3),
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
                      if (_hasStats)
                        Container(
                          height: 95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildMetricContainer(
                                  "BPM", bpm, Colors.green, true),
                              _buildMetricContainer(
                                  "SPO2", spo2, Colors.blue, true),
                              _buildMetricContainer(
                                  "NIBP", nibp, Colors.red, false),
                              _buildMetricContainer(
                                  "ETCO2", etco2, Colors.black54, true),
                              _buildMetricContainer(
                                  "SPO2", spo2, Colors.blue, true),
                            ],
                          ),
                        ),

                      // Action bar
                      Container(
                        height: 50,
                        color: const Color.fromARGB(255, 8, 103, 236),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Add event details functionality here
                                  },
                                  child: Text(
                                    "Event Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {
                                    // Add patient data functionality here
                                  },
                                  child: Text(
                                    "Patient Data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

Widget _buildMetricContainer(
    String title, String value, Color color, bool hasMinMax) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
                height: 1),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    color: color,
                    height: 1),
              ),
              if (hasMinMax)
                Column(
                  children: [
                    Text(
                      "45",
                      style: TextStyle(
                          fontSize: 24,
                          color: color,
                          fontWeight: FontWeight.w500,
                          height: 1),
                    ),
                    Text("45",
                        style: TextStyle(
                            fontSize: 24,
                            color: color,
                            fontWeight: FontWeight.w500,
                            height: 1))
                  ],
                ),
            ],
          ),
        ],
      ),
    ),
  );
}
