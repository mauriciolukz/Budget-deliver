

import 'package:budgetdeliver/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:budgetdeliver/utils/global.constants.dart';
import 'package:http/http.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../data/authentication_client.dart';
import '../models/error.dart';

class XmlHttpRequest{

  String path = GlobalConstants.url;
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  late final token_jwt;
  final client = Client();

   Future<http.Response> post(String api, Map<String, dynamic> map,BuildContext context, bool loadDialog,bool token) async {
     map["platform"] = 'app';
    String baseUrl = "$path$api";

    if(token){
      token_jwt = await _authenticationClient.accessToken;
      header["Authorization"] = "Bearer ${token_jwt}";
    }

    final response = await client.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode(map),
    ).timeout(Duration(seconds: 30)).then((value) => verifResponse(value,context,loadDialog));

    return response;

  }

  Future<http.Response> verifResponse(http.Response response,BuildContext context, bool loadDialog) async {

    if(loadDialog == true){
      await ProgressDialog.dissmiss(context);
    }

    try {

      if (response.statusCode >= 400) {
        var res = json.decode(response.body);
        Error error = Error.fromJson(res);
        QuickAlert.show(context: context,type: QuickAlertType.error,text: error.message);
      }

    } on Exception catch (er) {
      QuickAlert.show(context: context,type: QuickAlertType.error,text: "throwing new error $er");
    }catch (er) {
      QuickAlert.show(context: context,type: QuickAlertType.error,text: "throwing new error $er");
  }

    return response;

  }

  Future<http.Response> get(String api, Map<String, dynamic> map,BuildContext context, bool loadDialog,bool token) async {
    map["platform"] = 'app';

    var url = Uri.http(path.replaceAll('http://', '').replaceAll('/api', ''), "/api${api}");

    if(token){
      token_jwt = await _authenticationClient.accessToken;
      header["Authorization"] = "Bearer ${token_jwt}";
    }

    final response = await client.get(url,headers: header).timeout(Duration(seconds: 30)).then((value) => verifResponse(value,context,loadDialog));
    return response;

  }


}