
import 'package:budgetdeliver/data/authentication_client.dart';
import 'package:budgetdeliver/utils/database_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import '../app.dart';


abstract class DependencyInjection{
  
  static void initialize(){

    final config = Configuration.local([Menu.schema,Vehicles.schema,Drivers.schema,FuelLevels.schema,Locations.schema,ItemsMaster.schema,Transactions.schema]);
    
    const secureStorage = FlutterSecureStorage();
    final realm = Realm(config);

    final  authenticationClient = AuthenticationClient(secureStorage);
    final databaseUtil =  DatabaseUtil(realm);

    GetIt.instance.registerSingleton<AuthenticationClient>(authenticationClient);
    GetIt.instance.registerSingleton<DatabaseUtil>(databaseUtil);

  }

}