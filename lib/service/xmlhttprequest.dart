import 'package:budgetdeliver/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:budgetdeliver/utils/global.constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:budgetdeliver/widgets/dialogs.dart';
import '../models/error.dart';

class XmlHttpRequest{

  String path = GlobalConstants.url;

  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    //"Authorization": "Bearer ${user.jwt}"
  };

   Future<http.Response> post(String api, Map<String, String> map,BuildContext context, bool modal) async {

    String baseUrl = "$path$api";

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode(map),
    ).then((value) => verifResponse(value,context,modal));

    return response;

  }

  Future<http.Response> verifResponse(http.Response response,BuildContext context, bool modal) async {

     await ProgressDialog.dissmiss(context);

    if (response.statusCode == 404 || response.statusCode == 401) {
      var res = json.decode(response.body);
      Error error = Error.fromJson(res);
      QuickAlert.show(context: context,type: QuickAlertType.error,text: error.message);
    }

    return response;

  }


}