import 'dart:convert';

import 'package:hexcolor/hexcolor.dart';

import '../models/user.dart';

  List<User> postFromJson (String strJson){
    final str = json.decode(strJson);
    return List<User>.from(str.map((item){
      return User.fromJson(item);
    }));
  }

