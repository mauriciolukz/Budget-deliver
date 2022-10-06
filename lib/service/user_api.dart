import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

 Future<http.Response> login(String user,String password,BuildContext context, bool loadDialog) async {

   var request = XmlHttpRequest();
   final response = await request.post("/Auth/login", <String, String>{'username': user,'password': password},context,loadDialog);
   return response;

}




