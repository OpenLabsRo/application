import 'package:flutter/material.dart';
import 'package:application/models/case.dart';
import 'package:http/http.dart' as http;
import 'package:application/url.dart';
import 'dart:convert';

class CaseProvider with ChangeNotifier {
  Case caseFile = Case();
  String token = "";

  String errorMessage = "";

  setError(String message) {
    errorMessage = message;
    notifyListeners();
  }
}
