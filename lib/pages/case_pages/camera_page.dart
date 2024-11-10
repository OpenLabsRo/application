// camera_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isParsed = false;
  MRZController? controller;

  @override
  void dispose() {
    controller?.stopPreview();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan ID'),
      ),
      body: MRZScanner(
        withOverlay: true,
        onControllerCreated: onControllerCreated,
      ),
    );
  }

  void onControllerCreated(MRZController controller) {
    this.controller = controller;
    controller.onParsed = (result) async {
      if (isParsed) return;
      isParsed = true;

      // Stop the camera preview
      controller.stopPreview();

      // Display the scanned data in an AlertDialog
      final dialogResult = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Scanned ID Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Document type: ${result.documentType}'),
                Text('Country: ${result.countryCode}'),
                Text('Surnames: ${result.surnames}'),
                Text('Given names: ${result.givenNames}'),
                Text('Document number: ${result.documentNumber}'),
                Text('Nationality code: ${result.nationalityCountryCode}'),
                Text('Birthdate: ${result.birthDate}'),
                Text('Sex: ${result.sex}'),
                Text('Expiry date: ${result.expiryDate}'),
                Text('Personal number: ${result.personalNumber}'),
                Text('Personal number 2: ${result.personalNumber2}'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to indicate OK
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false to indicate Cancel
              },
            ),
          ],
        ),
      );

      if (dialogResult == true) {
        // User pressed OK, return result to previous page
        Navigator.of(context).pop(result);
      } else {
        // User cancelled, restart the preview
        isParsed = false;
        if (mounted) {
          controller.startPreview();
        }
      }
    };

    controller.onError = (error) => print('MRZ Scanner Error: $error');

    controller.startPreview();
  }
}
