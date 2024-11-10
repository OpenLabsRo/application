import 'package:application/components/case_comp/checkmark_buttonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Ensure you include your CheckmarkButton component
// If you don't have it, I've provided the code below

class IVIOAccessPage extends StatefulWidget {
  const IVIOAccessPage({Key? key}) : super(key: key);

  @override
  _IVIOAccessPageState createState() => _IVIOAccessPageState();
}

class _IVIOAccessPageState extends State<IVIOAccessPage> {
  bool _ivSelected = false;
  bool _ioSelected = false;

  String? _selectedIVType; // 'Peripheral' or 'Central'
  String? _selectedIOType; // 'Humeral' or 'Tibial'

  // Method to show dropdown for IV type selection
  void _showIVTypeOptions(BuildContext context) {
    List<String> options = [
      '',
      'Peripheral',
      'Central',
    ];

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40,
          scrollController: FixedExtentScrollController(
            initialItem:
                _selectedIVType != null ? options.indexOf(_selectedIVType!) : 0,
          ),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedIVType = options[index];
            });
          },
          children: options.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
    );
  }

  // Method to show dropdown for IO type selection
  void _showIOTypeOptions(BuildContext context) {
    List<String> options = [
      '',
      'Humeral',
      'Tibial',
    ];

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 40,
          scrollController: FixedExtentScrollController(
            initialItem:
                _selectedIOType != null ? options.indexOf(_selectedIOType!) : 0,
          ),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedIOType = options[index];
            });
          },
          children: options.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
    );
  }

  void _onIVChanged(bool value) {
    setState(() {
      _ivSelected = value;
      if (!value) {
        _selectedIVType = null; // Reset IV type if IV is deselected
      }
    });
  }

  void _onIOChanged(bool value) {
    setState(() {
      _ioSelected = value;
      if (!value) {
        _selectedIOType = null; // Reset IO type if IO is deselected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Text(
                'Select Access Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // IV Checkbox
              CheckmarkButtonFire(
                label: 'Intravenous Access',
                initialValue: _ivSelected,
                onChanged: _onIVChanged,
              ),
              // If IV is selected, show Peripheral or Central options
              if (_ivSelected)
                GestureDetector(
                  onTap: () => _showIVTypeOptions(context),
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEAEA),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _selectedIVType ?? "Select IV Access Type",
                      style: TextStyle(
                        color: _selectedIVType == null
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              // IO Checkbox
              CheckmarkButtonFire(
                label: 'Intraosseous Access',
                initialValue: _ioSelected,
                onChanged: _onIOChanged,
              ),
              // If IO is selected, show Humeral or Tibial options
              if (_ioSelected)
                GestureDetector(
                  onTap: () => _showIOTypeOptions(context),
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEAEA),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _selectedIOType ?? "Select IO Access Site",
                      style: TextStyle(
                        color: _selectedIOType == null
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ])));
  }
}
