import 'package:realm/realm.dart';  // import realm package

part 'app.g.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class _Menu {

  late int id;

  late String name;

  late String caption;

  late String icon;

}

@RealmModel() // define a data model class named `_Car`.
class _AppWindows {
  @PrimaryKey()
  late int id;
  late String name;
  late String caption;
  late String icon;

}

@RealmModel() // define a data model class named `_Car`.
class _Vehicles {

  late int id;
  @PrimaryKey()
  late String mva;
  late String make;
  late String model;
  late String color;
  late String plateNum;
  late String keyNum;
  late int currentKm;
  late String fuelLevel;
  late String remark;
  late String lastOilChangeDate;
  late String nextOilChangeDate;
  late String nextOilChangeKm;
  late String location;
  late bool isAvailable;

}

@RealmModel() // define a data model class named `_Car`.
class _Drivers {
  late int id;
  late String firstName;
  late String middleName;
  late String lastName;
  late String phone1;
  late String phone2;
  @PrimaryKey()
  late String fullName;
}

@RealmModel() // define a data model class named `_Car`.
class _FuelLevels {
  @PrimaryKey()
  late String fuelLevel;
}

@RealmModel() // define a data model class named `_Car`.
class _Locations {
  late int id;
  late String locationCode;
  late String address;
  late String phone1;
  late String phone2;
  late String createdAt;
  late String updatedAt;
}

