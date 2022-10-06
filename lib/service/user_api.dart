import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:budgetdeliver/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

 Future<http.Response> login(String user,String password,BuildContext context, bool modal) async {

   var request = XmlHttpRequest();
   final response = await request.post("/Auth/login", <String, String>{'username': user,'password': password},context,modal);
   return response;

}




