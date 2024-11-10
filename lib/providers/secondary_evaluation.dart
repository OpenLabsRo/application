import 'package:application/url.dart';
import 'package:http/http.dart' as http;
import 'package:application/models/secondary_evaluation.dart';
import 'dart:convert';

Future<dynamic> patchSecondaryUsualSymptoms(
    String token, String id, UsualSymptoms usualSymptoms) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/secondary/usual-symptoms?id=$id'),
      headers: basicHeader,
      body: jsonEncode(usualSymptoms.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchSecondaryTrauma(
    String token, String id, Trauma trauma) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/secondary/trauma?id=$id'),
      headers: basicHeader,
      body: jsonEncode(trauma.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}
