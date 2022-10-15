import 'dart:convert';

import 'package:realm/src/realm_class.dart';
import '../app.dart';
import '../service/vehicle_api.dart';

class DatabaseUtil{

  Realm _realm;

  DatabaseUtil(Realm this._realm);

  cleanDatase(){
    _realm.write(() {
      _realm.deleteAll<Menu>();
      _realm.deleteAll<Vehicle>();
    });
  }

  RealmResults<Menu> getMenu() {
    return _realm.all<Menu>();
  }

  addMenu(appWindows) {
    for (var windowApp in appWindows) {
      _realm.write(() {
        _realm.add(Menu(windowApp['id'] , windowApp['name'] ,windowApp['caption'] ,"Icon.home"));
      });
    }
  }

  String getNameMenuItemByIndex(int index) {
    var menu = _realm.all<Menu>();
    return menu[index].name;
  }

  addVehicles(vehicle) {
    String lastOilChangeDate = vehicle['lastOilChangeDate'] == null ? "" : vehicle['lastOilChangeDate'];
    String nextOilChangeDate = vehicle['nextOilChangeDate'] == null ? "" : vehicle['nextOilChangeDate'];
    String nextOilChangeKm = vehicle['nextOilChangeKm'] == null ? "" : vehicle['nextOilChangeKm'];

    _realm.write(() {
      _realm.add(Vehicle(vehicle['id'], vehicle['MVA'], vehicle['make'], vehicle['model'], vehicle['color'], vehicle['plateNum'], vehicle['keyNum'], vehicle['currentKm'], vehicle['fuelLevel'], vehicle['remark'], lastOilChangeDate, nextOilChangeDate, nextOilChangeKm, vehicle['location'], vehicle['isAvailable']));
    });
  }

  Future<void> PullData(context) async {
    var response = await getVehicles(context,false);

    if (response.statusCode == 200) {

      var vehicles = json.decode(response.body);

      for (var vehicle in vehicles['vehicles']) {
        addVehicles(vehicle);
      }
    }

  }

  RealmResults<Vehicle> getAllVehicles() {
    return _realm.all<Vehicle>();
  }

  Vehicle findVehicleByMVA(String mva) {
    Vehicle vehicle = new Vehicle(0, "", "", "", "", "", "", 0, "", "", "", "", "", "", false);
    var result = _realm.all<Vehicle>().query("mva == '$mva'");

    if(result.length > 0){
      vehicle = result[0];
    }

    return vehicle;
  }







}