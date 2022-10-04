import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:http/http.dart' as http;

 Future<http.Response> login(String user,String password) async {

   var request = XmlHttpRequest();
   final response = await request.post("/Auth/login", <String, String>{'username': user,'password': password});
   return response;

}




