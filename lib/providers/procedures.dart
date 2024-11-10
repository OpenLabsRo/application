import 'package:application/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:application/models/procedures.dart';

Future<dynamic> patchPrimaryMental(
    String token, String id, Intubation intubation) async {
  var response = await http.patch(
      Uri.parse('$apiURL/paramedics/primary/mental?id=$id'),
      headers: basicHeader,
      body: jsonEncode(mental.toJson()));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}
