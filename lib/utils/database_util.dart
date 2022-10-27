import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:realm/src/realm_class.dart';
import '../app.dart';
import '../service/driver_api.dart';
import '../service/fuel_levels.dart';
import '../service/items_master.dart';
import '../service/location_api.dart';
import '../service/vehicle_api.dart';

class DatabaseUtil{

  Realm _realm;

  DatabaseUtil(Realm this._realm);

  cleanDatase(bool skip){
    _realm.write(() {
      if(!skip){
        _realm.deleteAll<Menu>();
      }
      _realm.deleteAll<Vehicles>();
      _realm.deleteAll<Drivers>();
      _realm.deleteAll<FuelLevels>();
      _realm.deleteAll<Locations>();
      _realm.deleteAll<Transactions>();
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

  int getIdMenuItemByIndex(int index) {
    var menu = _realm.all<Menu>();
    return menu[index].id;
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

    response = await getItemsMaster(context,false);

    if (response.statusCode == 200) {
      var itemsMaster = json.decode(response.body);
      for (var item in itemsMaster['items']) {
        addItemsMaster(item);
      }
    }

  }

  Vehicles findVehicleByMVA(String mva) {
    try{
      return _realm.all<Vehicles>().query("mva == '$mva'").first;
    }
    catch(e){
      return new Vehicles(0, "", "", "", "", "", "", 0, "", "", "", "", "", "", false);
    }
  }

  void addDrivers(driver) {
    _realm.write(() {
      _realm.add(Drivers(driver['id'], driver['firstName'], driver['middleName'], driver['lastName'], driver['phone1'], driver['phone2'], driver['fullName']));
    });
  }

  int addTransactions(transaction) {
    var id;
    _realm.write(() {
      id = _realm.add(Transactions(transaction['id'], transaction['trxType'], transaction['abrev'], transaction['trxNumber'], transaction['vehicleId'],transaction['make'], transaction['model'], transaction['color'], transaction['km'], transaction['fuelLevel'], transaction['locationName'], "", "")).id;
    });
    return id;
  }

  RealmResults<Drivers> getAllDrivers() {
    return _realm.all<Drivers>();
  }

  RealmResults<Transactions> getAllTransactions() {
    return _realm.all<Transactions>();
  }

  Transactions? getTransactionByIdVehicle(int vehicleId) {
      try{
        return _realm.all<Transactions>().query("vehicleId == $vehicleId").first;
      }
      catch(e){
        return null;
      }
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

  void addItemsMaster(item) {
    _realm.write(() {
      _realm.add(ItemsMaster(item['id'], item['description'], item['itemType'], item['useQty'], item['itemTypeDesc']));
    });
  }

  RealmResults<ItemsMaster> getAllItemsMaster() {
    return _realm.all<ItemsMaster>();
  }

  updateTransactions(res) {

    Transactions transactions = Transactions(res['id'], res['trxType'], res['abrev'], res['trxNumber'], res['vehicleId'], res['make'], res['model'], res['color'], res['km'], res['fuelLevel'], res['locationName'], "", "");
    _realm.write(() {
      _realm.add<Transactions>(transactions, update: true);
    });

  }

}