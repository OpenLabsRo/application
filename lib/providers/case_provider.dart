import 'package:flutter/material.dart';
import 'package:application/models/case.dart';
import 'package:application/models/primary_evaluation.dart';
import 'package:application/providers/primary_evaluation.dart';

class CaseProvider with ChangeNotifier {
  Case caseFile = Case();
  String token = "";

  String errorMessage = "";

  setError(String message) {
    errorMessage = message;
    notifyListeners();
  }

  Future<void> sendMentalStatus(MentalStatus mental) async {
    final body = await patchPrimaryMental("1", mental);

    if (body["statusCode"] == 200) {
      caseFile.primaryEvaluation?.mentalStatus = mental;
      print("STATES");
      print(mental.conscious?.altered);
      print(mental.conscious?.normal);
      print(mental.unconscious);
      print("WORKING");

      await setError('');
    } else {
      await setError(body["message"]);
    }
  }
}
