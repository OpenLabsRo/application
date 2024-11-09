import 'package:flutter/material.dart';

class SubTabBar extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final ValueChanged<String> onTabSelected;

  const SubTabBar({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color.fromARGB(255, 8, 103, 236),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tabs.map((tab) {
          bool isSelected = tab == selectedTab;
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () => onTabSelected(tab),
              style: TextButton.styleFrom(
                backgroundColor: isSelected
                    ? const Color.fromARGB(255, 3, 46, 111)
                    : Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                tab,
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
