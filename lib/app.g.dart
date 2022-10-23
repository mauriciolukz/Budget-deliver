// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Menu extends _Menu with RealmEntity, RealmObject {
  Menu(
    int id,
    String name,
    String caption,
    String icon,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'caption', caption);
    RealmObject.set(this, 'icon', icon);
  }

  Menu._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObject.set(this, 'name', value);

  @override
  String get caption => RealmObject.get<String>(this, 'caption') as String;
  @override
  set caption(String value) => RealmObject.set(this, 'caption', value);

  @override
  String get icon => RealmObject.get<String>(this, 'icon') as String;
  @override
  set icon(String value) => RealmObject.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<Menu>> get changes =>
      RealmObject.getChanges<Menu>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Menu._);
    return const SchemaObject(Menu, 'Menu', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('caption', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
    ]);
  }
}

class AppWindows extends _AppWindows with RealmEntity, RealmObject {
  AppWindows(
    int id,
    String name,
    String caption,
    String icon,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'caption', caption);
    RealmObject.set(this, 'icon', icon);
  }

  AppWindows._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObject.set(this, 'name', value);

  @override
  String get caption => RealmObject.get<String>(this, 'caption') as String;
  @override
  set caption(String value) => RealmObject.set(this, 'caption', value);

  @override
  String get icon => RealmObject.get<String>(this, 'icon') as String;
  @override
  set icon(String value) => RealmObject.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<AppWindows>> get changes =>
      RealmObject.getChanges<AppWindows>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(AppWindows._);
    return const SchemaObject(AppWindows, 'AppWindows', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('caption', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
    ]);
  }
}

class Vehicles extends _Vehicles with RealmEntity, RealmObject {
  Vehicles(
    int id,
    String mva,
    String make,
    String model,
    String color,
    String plateNum,
    String keyNum,
    int currentKm,
    String fuelLevel,
    String remark,
    String lastOilChangeDate,
    String nextOilChangeDate,
    String nextOilChangeKm,
    String location,
    bool isAvailable,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'mva', mva);
    RealmObject.set(this, 'make', make);
    RealmObject.set(this, 'model', model);
    RealmObject.set(this, 'color', color);
    RealmObject.set(this, 'plateNum', plateNum);
    RealmObject.set(this, 'keyNum', keyNum);
    RealmObject.set(this, 'currentKm', currentKm);
    RealmObject.set(this, 'fuelLevel', fuelLevel);
    RealmObject.set(this, 'remark', remark);
    RealmObject.set(this, 'lastOilChangeDate', lastOilChangeDate);
    RealmObject.set(this, 'nextOilChangeDate', nextOilChangeDate);
    RealmObject.set(this, 'nextOilChangeKm', nextOilChangeKm);
    RealmObject.set(this, 'location', location);
    RealmObject.set(this, 'isAvailable', isAvailable);
  }

  Vehicles._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get mva => RealmObject.get<String>(this, 'mva') as String;
  @override
  set mva(String value) => throw RealmUnsupportedSetError();

  @override
  String get make => RealmObject.get<String>(this, 'make') as String;
  @override
  set make(String value) => RealmObject.set(this, 'make', value);

  @override
  String get model => RealmObject.get<String>(this, 'model') as String;
  @override
  set model(String value) => RealmObject.set(this, 'model', value);

  @override
  String get color => RealmObject.get<String>(this, 'color') as String;
  @override
  set color(String value) => RealmObject.set(this, 'color', value);

  @override
  String get plateNum => RealmObject.get<String>(this, 'plateNum') as String;
  @override
  set plateNum(String value) => RealmObject.set(this, 'plateNum', value);

  @override
  String get keyNum => RealmObject.get<String>(this, 'keyNum') as String;
  @override
  set keyNum(String value) => RealmObject.set(this, 'keyNum', value);

  @override
  int get currentKm => RealmObject.get<int>(this, 'currentKm') as int;
  @override
  set currentKm(int value) => RealmObject.set(this, 'currentKm', value);

  @override
  String get fuelLevel => RealmObject.get<String>(this, 'fuelLevel') as String;
  @override
  set fuelLevel(String value) => RealmObject.set(this, 'fuelLevel', value);

  @override
  String get remark => RealmObject.get<String>(this, 'remark') as String;
  @override
  set remark(String value) => RealmObject.set(this, 'remark', value);

  @override
  String get lastOilChangeDate =>
      RealmObject.get<String>(this, 'lastOilChangeDate') as String;
  @override
  set lastOilChangeDate(String value) =>
      RealmObject.set(this, 'lastOilChangeDate', value);

  @override
  String get nextOilChangeDate =>
      RealmObject.get<String>(this, 'nextOilChangeDate') as String;
  @override
  set nextOilChangeDate(String value) =>
      RealmObject.set(this, 'nextOilChangeDate', value);

  @override
  String get nextOilChangeKm =>
      RealmObject.get<String>(this, 'nextOilChangeKm') as String;
  @override
  set nextOilChangeKm(String value) =>
      RealmObject.set(this, 'nextOilChangeKm', value);

  @override
  String get location => RealmObject.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObject.set(this, 'location', value);

  @override
  bool get isAvailable => RealmObject.get<bool>(this, 'isAvailable') as bool;
  @override
  set isAvailable(bool value) => RealmObject.set(this, 'isAvailable', value);

  @override
  Stream<RealmObjectChanges<Vehicles>> get changes =>
      RealmObject.getChanges<Vehicles>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Vehicles._);
    return const SchemaObject(Vehicles, 'Vehicles', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('mva', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('make', RealmPropertyType.string),
      SchemaProperty('model', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.string),
      SchemaProperty('plateNum', RealmPropertyType.string),
      SchemaProperty('keyNum', RealmPropertyType.string),
      SchemaProperty('currentKm', RealmPropertyType.int),
      SchemaProperty('fuelLevel', RealmPropertyType.string),
      SchemaProperty('remark', RealmPropertyType.string),
      SchemaProperty('lastOilChangeDate', RealmPropertyType.string),
      SchemaProperty('nextOilChangeDate', RealmPropertyType.string),
      SchemaProperty('nextOilChangeKm', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('isAvailable', RealmPropertyType.bool),
    ]);
  }
}

class Drivers extends _Drivers with RealmEntity, RealmObject {
  Drivers(
    int id,
    String firstName,
    String middleName,
    String lastName,
    String phone1,
    String phone2,
    String fullName,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'firstName', firstName);
    RealmObject.set(this, 'middleName', middleName);
    RealmObject.set(this, 'lastName', lastName);
    RealmObject.set(this, 'phone1', phone1);
    RealmObject.set(this, 'phone2', phone2);
    RealmObject.set(this, 'fullName', fullName);
  }

  Drivers._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get firstName => RealmObject.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObject.set(this, 'firstName', value);

  @override
  String get middleName =>
      RealmObject.get<String>(this, 'middleName') as String;
  @override
  set middleName(String value) => RealmObject.set(this, 'middleName', value);

  @override
  String get lastName => RealmObject.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObject.set(this, 'lastName', value);

  @override
  String get phone1 => RealmObject.get<String>(this, 'phone1') as String;
  @override
  set phone1(String value) => RealmObject.set(this, 'phone1', value);

  @override
  String get phone2 => RealmObject.get<String>(this, 'phone2') as String;
  @override
  set phone2(String value) => RealmObject.set(this, 'phone2', value);

  @override
  String get fullName => RealmObject.get<String>(this, 'fullName') as String;
  @override
  set fullName(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Drivers>> get changes =>
      RealmObject.getChanges<Drivers>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Drivers._);
    return const SchemaObject(Drivers, 'Drivers', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('middleName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('phone1', RealmPropertyType.string),
      SchemaProperty('phone2', RealmPropertyType.string),
      SchemaProperty('fullName', RealmPropertyType.string, primaryKey: true),
    ]);
  }
}

class FuelLevels extends _FuelLevels with RealmEntity, RealmObject {
  FuelLevels(
    String fuelLevel,
  ) {
    RealmObject.set(this, 'fuelLevel', fuelLevel);
  }

  FuelLevels._();

  @override
  String get fuelLevel => RealmObject.get<String>(this, 'fuelLevel') as String;
  @override
  set fuelLevel(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<FuelLevels>> get changes =>
      RealmObject.getChanges<FuelLevels>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(FuelLevels._);
    return const SchemaObject(FuelLevels, 'FuelLevels', [
      SchemaProperty('fuelLevel', RealmPropertyType.string, primaryKey: true),
    ]);
  }
}

class Locations extends _Locations with RealmEntity, RealmObject {
  Locations(
    int id,
    String locationName,
    String address,
    String phone1,
    String phone2,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'locationName', locationName);
    RealmObject.set(this, 'address', address);
    RealmObject.set(this, 'phone1', phone1);
    RealmObject.set(this, 'phone2', phone2);
  }

  Locations._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get locationName =>
      RealmObject.get<String>(this, 'locationName') as String;
  @override
  set locationName(String value) =>
      RealmObject.set(this, 'locationName', value);

  @override
  String get address => RealmObject.get<String>(this, 'address') as String;
  @override
  set address(String value) => RealmObject.set(this, 'address', value);

  @override
  String get phone1 => RealmObject.get<String>(this, 'phone1') as String;
  @override
  set phone1(String value) => RealmObject.set(this, 'phone1', value);

  @override
  String get phone2 => RealmObject.get<String>(this, 'phone2') as String;
  @override
  set phone2(String value) => RealmObject.set(this, 'phone2', value);

  @override
  Stream<RealmObjectChanges<Locations>> get changes =>
      RealmObject.getChanges<Locations>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Locations._);
    return const SchemaObject(Locations, 'Locations', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('locationName', RealmPropertyType.string),
      SchemaProperty('address', RealmPropertyType.string),
      SchemaProperty('phone1', RealmPropertyType.string),
      SchemaProperty('phone2', RealmPropertyType.string),
    ]);
  }
}

class ItemsMaster extends _ItemsMaster with RealmEntity, RealmObject {
  ItemsMaster(
    int id,
    String description,
    int itemType,
    bool useQty,
    String itemTypeDesc,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'description', description);
    RealmObject.set(this, 'itemType', itemType);
    RealmObject.set(this, 'useQty', useQty);
    RealmObject.set(this, 'itemTypeDesc', itemTypeDesc);
  }

  ItemsMaster._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get description =>
      RealmObject.get<String>(this, 'description') as String;
  @override
  set description(String value) => RealmObject.set(this, 'description', value);

  @override
  int get itemType => RealmObject.get<int>(this, 'itemType') as int;
  @override
  set itemType(int value) => RealmObject.set(this, 'itemType', value);

  @override
  bool get useQty => RealmObject.get<bool>(this, 'useQty') as bool;
  @override
  set useQty(bool value) => RealmObject.set(this, 'useQty', value);

  @override
  String get itemTypeDesc =>
      RealmObject.get<String>(this, 'itemTypeDesc') as String;
  @override
  set itemTypeDesc(String value) =>
      RealmObject.set(this, 'itemTypeDesc', value);

  @override
  Stream<RealmObjectChanges<ItemsMaster>> get changes =>
      RealmObject.getChanges<ItemsMaster>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(ItemsMaster._);
    return const SchemaObject(ItemsMaster, 'ItemsMaster', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('itemType', RealmPropertyType.int),
      SchemaProperty('useQty', RealmPropertyType.bool),
      SchemaProperty('itemTypeDesc', RealmPropertyType.string),
    ]);
  }
}
