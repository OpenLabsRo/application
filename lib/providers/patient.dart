import 'package:application/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> patchPatientName(String token, String id, String name) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/patient/name?id=$id&name=$name'),
      headers: basicHeader,
      body: jsonEncode(<String, dynamic>{}));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPatientAge(
    String token, String id, int age, String birthdate) async {
  var response = await http.patch(
      Uri.parse(
          '$apiURL/paramedics/patient/age?id=$id&age=$age&birthdate=$birthdate'),
      headers: basicHeader,
      body: jsonEncode(<String, dynamic>{}));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPatientSex(String token, String id, String sex) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/patient/sex?id=$id&sex=$sex'),
      headers: basicHeader,
      body: jsonEncode(<String, dynamic>{}));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPatientWeight(String token, String id, int weight) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/patient/weight?id=$id&weight=$weight'),
      headers: basicHeader,
      body: jsonEncode(<String, dynamic>{}));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}

Future<dynamic> patchPatientCNP(String token, String id, String cnp) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/patient/cnp?id=$id&cnp=$cnp'),
      headers: basicHeader,
      body: jsonEncode(<String, dynamic>{}));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}
