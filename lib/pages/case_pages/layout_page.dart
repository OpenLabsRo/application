import 'dart:async';
import 'package:application/components/stat_bar.dart';
import 'package:application/components/sub_tab_bar.dart';
import 'package:application/pages/case_pages/airway_page.dart';
import 'package:application/pages/case_pages/breathing_page.dart';
import 'package:application/pages/case_pages/circulation_page.dart';
import 'package:application/pages/case_pages/event_details.dart';
import 'package:application/pages/case_pages/mental_status_page.dart';
import 'package:application/pages/case_pages/patient_data.dart';
import 'package:application/pages/case_pages/usual_symtoms_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  bool _isSidebarOpen = true;
  bool _isAISidebarOpen = true; // Added variable to track AI sidebar visibility
  bool _hasStats = true;

  // Track current selected tab and sub-tab
  String _selectedSidebarTab = 'Event Details';
  String _selectedSubTab = 'Event Details';

  // Define sub-tabs for each main sidebar item
  final Map<String, Map<String, Widget>> sidebarTabs = {
    'Event Details': {
      'Event Details': EventDetails(),
      'Patient Data': PatientData(),
    },
    'Primary Evaluation': {
      'Mental Status': MentalStatusPage(),
      'Airway': AirwayPage(),
      'Breathing': BreathingPage(),
      'Circulation': CirculationPage(),
    },
    'Secondary Evaluation': {
      "Usual Symptoms": UsualSymptomsPage(),
    },
    // Add other sidebar items and their sub-tabs here
  };

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  // Added method to toggle AI sidebar
  void _toggleAISidebar() {
    setState(() {
      _isAISidebarOpen = !_isAISidebarOpen;
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

  void _onSidebarItemTapped(String tab) {
    setState(() {
      _selectedSidebarTab = tab;
      _selectedSubTab = sidebarTabs[tab]!.keys.first; // Select first sub-tab
    });
  }

  void _onSubTabTapped(String subTab) {
    setState(() {
      _selectedSubTab = subTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 45,
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Sidebar toggle button
                    GestureDetector(
                      onTap: _toggleSidebar,
                      child: Icon(
                        CupertinoIcons.sidebar_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Support",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Police",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Request a Hospital",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // AI Sidebar toggle button
                    GestureDetector(
                      onTap: _toggleAISidebar,
                      child: Icon(
                        CupertinoIcons.sparkles,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    // Other buttons can be added here
                  ],
                ),
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _hasStats = !_hasStats;
                    });
                  },
                  child: Text(
                    "On Scene | $_currentDate, $_currentTime",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Existing Sidebar
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isSidebarOpen ? 250.0 : 0.0,
                  color: Color(0xFFEAEAEA),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      if (_isSidebarOpen)
                        Expanded(
                          child: Column(
                            children: [
                              // Sidebar items
                              ListTile(
                                leading: Icon(Icons.home, color: Colors.black),
                                title: Text("Event Details"),
                                onTap: () =>
                                    _onSidebarItemTapped('Event Details'),
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text("Primary Evaluation"),
                                onTap: () =>
                                    _onSidebarItemTapped('Primary Evaluation'),
                              ),
                              ListTile(
                                leading:
                                    Icon(Icons.person, color: Colors.black),
                                title: Text("Secondary Evaluation"),
                                onTap: () => _onSidebarItemTapped(
                                    'Secondary Evaluation'),
                              ),
                              // Add other sidebar items here
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
                      if (_hasStats) StatBar(),

                      // SubTabBar updates based on selected sidebar item
                      SubTabBar(
                        tabs: sidebarTabs[_selectedSidebarTab]!.keys.toList(),
                        onTabSelected: _onSubTabTapped,
                        selectedTab: _selectedSubTab,
                      ),

                      // Main content based on selected sub-tab
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: sidebarTabs[_selectedSidebarTab]![
                              _selectedSubTab],
                        ),
                      ),
                    ],
                  ),
                ),

                // AI Sidebar (LifelineAI)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isAISidebarOpen ? 400.0 : 0.0,
                  color: Colors.white,
                  child: _isAISidebarOpen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title at the top
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'LifelineAI',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Expanded widget for messages and input area
                            Expanded(
                              child: Column(
                                children: [
                                  // Grey containers with sentences
                                  Expanded(
                                    child: ListView(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16.0),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[300],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Text(
                                            'Sent vitals update',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16.0),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Text(
                                            'Assess the patient’s airway immediately to ensure it is clear and patent. Begin administering high-flow oxygen using a non-rebreather mask or bag-valve mask. Monitor the patient’s breathing and oxygen saturation closely. If the patient exhibits inadequate or absent respirations, assist with ventilations using a bag-valve mask. Be prepared to initiate advanced airway management if necessary. Continually monitor vital signs and be ready to provide further support as needed.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            "Suggested Questions",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16.0),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                          ),
                                          child: Text(
                                            'Should I consider administering any medications or conducting specific assessments?',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16.0),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Text(
                                            'When should I initiate advanced airway management if there’s no improvement?',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // TextField and Send button at the bottom
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Type a message',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey[300],
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.send,
                                                color: Colors.white),
                                            onPressed: () {
                                              // Send button action
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox
                          .shrink(), // Empty widget when AI sidebar is closed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
