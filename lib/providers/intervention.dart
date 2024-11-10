import 'package:application/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> patchInterventionTimeFrames(String token) async {
  var response = await http.post(Uri.parse('$apiURL/paramedics/login'),
      headers: basicHeader, body: jsonEncode(Map<String, dynamic>));

  var body = json.decode(utf8.decode(response.bodyBytes));
  body['statusCode'] = response.statusCode;

  return body;
}
