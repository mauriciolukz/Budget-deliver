import 'package:budgetdeliver/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


String baseUrl = "https://powerful-caverns-97080.herokuapp.com/Auth/login";

Future<User> login(String user,String password) async {
  final response = await http.post(
    Uri.parse('https://powerful-caverns-97080.herokuapp.com/Auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //"Authorization": "Bearer ${user.jwt}"
    },
    body: jsonEncode(<String, String>{'username': user,'password': password}),
  );

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return  User.fromJson(res);
  } else {
    throw Exception('Failed to create album.');
  }

}

