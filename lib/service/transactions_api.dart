import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createTransaction(int vehicleId,int trxType,String check,BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.post("/transactions", <String, dynamic>{'vehicleId': vehicleId,'trxType': trxType,"check":check},context,loadDialog,true);
  return response;

}

Future<http.Response> updateTransaction(String transactionId,int km,String fuelLevel,BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.put("/transactions", <String, dynamic>{'id': transactionId,'km': km,'fuelLevel': fuelLevel},"/$transactionId",context,loadDialog,true);
  print(response);
  return response;

}