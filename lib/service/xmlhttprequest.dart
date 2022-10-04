import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:budgetdeliver/utils/global.constants.dart';

class XmlHttpRequest{

  String path = GlobalConstants.url;

  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    //"Authorization": "Bearer ${user.jwt}"
  };

   Future<http.Response> post(String api, Map<String, String> map) async {
    String baseUrl = "$path$api";
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode(map),
    );
    return response;
  }

}