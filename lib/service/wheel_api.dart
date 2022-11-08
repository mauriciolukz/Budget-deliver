import 'package:budgetdeliver/service/xmlhttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createTrxWheelDto(bool spare,trx,int tyrePressureLevel,int tyreUsefulLife,String tyreUsfLifeRemark,String tyreMarkCondition,String rimType,String rimPainting, String rimMarkCondition,BuildContext context, bool loadDialog) async {

  var request = XmlHttpRequest();
  final response = await request.post("/transactions/${trx}/wheels",
      <String, dynamic>{
        'spare': spare,
        'tyrePressureLevel': tyrePressureLevel,
        "tyreUsefulLife":tyreUsefulLife,
        'tyreUsfLifeRemark': tyreUsfLifeRemark,
        'tyreMarkCondition': tyreMarkCondition,
        "rimType":rimType,
        'rimPainting': rimPainting,
        'rimMarkCondition': rimMarkCondition
      }
      ,context,loadDialog,true);
  return response;

}
