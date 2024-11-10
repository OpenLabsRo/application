import 'package:application/url.dart';
import 'package:http/http.dart' as http;
import 'package:application/models/primary_evaluation.dart';
import 'dart:convert';

Future<dynamic> patchPrimaryMental(String id, MentalStatus mental) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/primary/mental?id=$id'),
      headers: basicHeader,
      body: jsonEncode(mental.toJson()));
  print("RESPONSE");
  print(response);

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPrimaryAirways(String id, Airways airways) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/primary/airways?id=$id'),
      headers: basicHeader,
      body: jsonEncode(airways.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPrimaryBreathing(
    String token, String id, Breathing breathing) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/primary/breathing?id=$id'),
      headers: basicHeader,
      body: jsonEncode(breathing.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPrimaryCirculation(
    String token, String id, Circulation circulation) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/primary/circulation?id=$id'),
      headers: basicHeader,
      body: jsonEncode(circulation.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}
