
import 'package:budgetdeliver/data/authentication_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection{
  
  static void initialize(){



    final secureStorage = FlutterSecureStorage();
    final  authenticationClient = AuthenticationClient(secureStorage);

    GetIt.instance.registerSingleton<AuthenticationClient>(authenticationClient);

  }

}