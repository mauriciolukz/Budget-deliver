import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getFuellevels(BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.get("/fuel-levels", {},context,loadDialog,true);
  return response;

}