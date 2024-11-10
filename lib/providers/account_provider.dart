import 'package:flutter/material.dart';
import 'package:application/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:application/url.dart';
import 'dart:convert';

class AccountProvider with ChangeNotifier {
  Account account = Account(
    id: "",
    firstName: "",
    lastName: "",
    phone: "",
  );
  String token = "";

  String errorMessage = "";

  setError(String message) {
    errorMessage = message;
    notifyListeners();
  }

  login() async {
    var response = await http.post(Uri.parse('$apiURL/accounts/login'),
        headers: basicHeader,
        body: jsonEncode(<String, dynamic>{
          'phone': "+40723010405",
          'passcode': '123456',
        }));

    var body = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      account = Account.fromJson(body["account"]);
      token = body["token"];

      notifyListeners();
    } else {
      await setError(body["message"]);
    }

    response = await http.post(Uri.parse('$apiURL/accounts/login'),
        headers: basicHeader,
        body: jsonEncode(<String, dynamic>{
          'phone': "+40723010405",
          'passcode': '123456',
        }));

    body = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      account = Account.fromJson(body["account"]);
      token = body["token"];

      notifyListeners();
    } else {
      await setError(body["message"]);
    }
  }
}
