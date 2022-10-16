import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getVehicles(BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.get("/vehicles", <String, dynamic>{'limit': '999999','offset':'0'},context,loadDialog,false);
  return response;

}