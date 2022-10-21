import 'dart:convert';

import 'package:realm/src/realm_class.dart';
import '../app.dart';
import '../service/driver_api.dart';
import '../service/fuel_levels.dart';
import '../service/location_api.dart';
import '../service/vehicle_api.dart';

class DatabaseUtil{

  Realm _realm;

  DatabaseUtil(Realm this._realm);

  cleanDatase(){
    _realm.write(() {
      _realm.deleteAll<Menu>();
      _realm.deleteAll<Vehicles>();
      _realm.deleteAll<Drivers>();
      _realm.deleteAll<FuelLevels>();
      _realm.deleteAll<Locations>();
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
      _realm.add(Vehicles(vehicle['id'], vehicle['MVA'], vehicle['make'], vehicle['model'], vehicle['color'], vehicle['plateNum'], vehicle['keyNum'], vehicle['currentKm'], vehicle['fuelLevel'], vehicle['remark'], lastOilChangeDate, nextOilChangeDate, nextOilChangeKm, vehicle['location'], vehicle['isAvailable']));
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

    response = await getDrivers(context,false);

    if (response.statusCode == 200) {
      var drivers = json.decode(response.body);
      for (var driver in drivers) {
        addDrivers(driver);
      }
    }

    response = await getFuellevels(context,false);

    if (response.statusCode == 200) {
      var fuellevels = json.decode(response.body);
      for (var fuellevel in fuellevels) {
        addFuellevels(fuellevel);
      }
    }

    response = await getLocations(context,false);

    if (response.statusCode == 200) {
      var locations = json.decode(response.body);
      for (var location in locations) {
        addLocations(location);
      }
    }

  }

  Vehicles findVehicleByMVA(String mva) {
    Vehicles vehicle = new Vehicles(0, "", "", "", "", "", "", 0, "", "", "", "", "", "", false);
    var result = _realm.all<Vehicles>().query("mva == '$mva'");

    if(result.length > 0){
      vehicle = result[0];
    }

    return vehicle;
  }

  void addDrivers(driver) {
    _realm.write(() {
      _realm.add(Drivers(driver['id'], driver['firstName'], driver['middleName'], driver['lastName'], driver['phone1'], driver['phone2'], driver['fullName']));
    });
  }

  RealmResults<Drivers> getAllDrivers() {
    return _realm.all<Drivers>();
  }

  void addFuellevels(fuellevel) {
    _realm.write(() {
      _realm.add(FuelLevels(fuellevel));
    });
  }

  void addLocations(location) {
    _realm.write(() {
      _realm.add(Locations(location['id'], location['locationName'], location['address'], location['phone1'], location['phone2']));
    });
  }

  RealmResults<FuelLevels> getAllFuelLevels() {
    return _realm.all<FuelLevels>();
  }

  RealmResults<Locations> getAllLocations() {
    return _realm.all<Locations>();
  }

}