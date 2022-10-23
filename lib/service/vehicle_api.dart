import 'dart:convert';

import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getVehicles(BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.get("/vehicles", <String, dynamic>{'limit': '999999','offset':'0'},context,loadDialog,true);
  return response;

}

Future<http.Response> getVehiclesByMVA(BuildContext context, bool loadDialog,String mva) async {

  var request = XmlHttpRequest();
  final response = await request.post("/vehicles/getByMVA", <String, dynamic>{'MVA': mva},context,loadDialog,true);
  return response;

}