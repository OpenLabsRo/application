import 'package:flutter/material.dart';

class SubTabBar extends StatefulWidget {
  final Map<String, VoidCallback> tabs;

  const SubTabBar({super.key, required this.tabs});

  @override
  State<SubTabBar> createState() => _SubTabBarState();
}

class _SubTabBarState extends State<SubTabBar> {
  String? selectedTab;

  @override
  void initState() {
    super.initState();
    // Initialize the first tab as selected by default (optional)
    if (widget.tabs.isNotEmpty) {
      selectedTab = widget.tabs.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color.fromARGB(255, 8, 103, 236),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.tabs.entries.map((entry) {
          bool isSelected = entry.key == selectedTab;
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedTab = entry.key;
                });
                entry.value();
              },
              style: TextButton.styleFrom(
                backgroundColor: isSelected
                    ? const Color.fromARGB(
                        255, 3, 46, 111) // Darker background for selected tab
                    : Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                entry.key,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
