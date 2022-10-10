import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/session.dart';
import '../models/user.dart';

class AuthenticationClient{

  final FlutterSecureStorage _secureStorage;
  AuthenticationClient(this._secureStorage);

  Future<String?> get accessToken async {
    final data  = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.token;
    }
    return null;
  }

  Future<String> get username async {
    final data  = await _secureStorage.read(key: 'SESSION');
    if(data != null){
      final session = Session.fromJson(jsonDecode(data));
      return session.username;
    }
    return "";
  }

  Future<void> saveSession(U_User user) async {
    final Session session = Session(
        id: user.id,
        username: user.username,
        role: user.role,
        token: user.token
    );

    final data = jsonEncode(session.toJson());
    await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> signOut() async {
    await _secureStorage.deleteAll();
  }


}