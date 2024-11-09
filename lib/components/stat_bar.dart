import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class StatBar extends StatefulWidget {
  const StatBar({super.key});

  @override
  State<StatBar> createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {
  String bpm = "72";
  String spo2 = "98";
  String nibp = "120/80";
  String etco2 = "--";

  // Minimum and maximum values for each metric
  int bpmMin = 72, bpmMax = 72;
  int spo2Min = 98, spo2Max = 98;
  String nibpMin = "120/80", nibpMax = "120/80";
  bool showEtco2 = true; // For blinking effect

  final Random random = Random();

  @override
  void initState() {
    super.initState();

    // Start the independent update timers
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _updateBpm();
      });
    });
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _updateSpo2();
      });
    });
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _updateNibp();
      });
    });
    // Start blinking for ETCO2
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        showEtco2 = !showEtco2;
      });
    });
  }

  void _updateBpm() {
    int newBpm = 70 + random.nextInt(15); // BPM range: 70-80
    bpm = newBpm.toString();
    bpmMin = min(bpmMin, newBpm);
    bpmMax = max(bpmMax, newBpm);
  }

  void _updateSpo2() {
    int newSpo2 = 96 + random.nextInt(4); // SPO2 range: 94-99
    spo2 = newSpo2.toString();
    spo2Min = min(spo2Min, newSpo2);
    spo2Max = max(spo2Max, newSpo2);
  }

  void _updateNibp() {
    int sys = 110 + random.nextInt(20); // Systolic range: 110-130
    int dia = 70 + random.nextInt(20); // Diastolic range: 70-80
    nibp = "$sys/$dia";
    nibpMin = min(int.parse(nibpMin.split('/')[0]), sys).toString() +
        "/" +
        min(int.parse(nibpMin.split('/')[1]), dia).toString();
    nibpMax = max(int.parse(nibpMax.split('/')[0]), sys).toString() +
        "/" +
        max(int.parse(nibpMax.split('/')[1]), dia).toString();
  }

  void _updateEtco2() {
    // No action needed as ETCO2 remains "--" and only blinks
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMetricContainer("BPM", bpm, Colors.green, bpmMin, bpmMax),
          _buildMetricContainer("SPO2", spo2, Colors.blue, spo2Min, spo2Max),
          _buildMetricContainer("NIBP", nibp, Colors.red, null, null),
          _buildMetricContainer("ETCO2", etco2, Colors.black54, null, null,
              isBlinking: true),
        ],
      ),
    );
  }

  Widget _buildMetricContainer(
      String title, String value, Color color, dynamic min, dynamic max,
      {bool isBlinking = false}) {
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
                // Blink effect for value if isBlinking is true and value is "--"
                Text(
                  value == "--" && isBlinking && !showEtco2 ? "" : value,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: color,
                      height: 1),
                ),
                if (min != null && max != null)
                  Column(
                    children: [
                      Text(
                        min.toString(),
                        style: TextStyle(
                            fontSize: 24,
                            color: color,
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                      Text(max.toString(),
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
}
