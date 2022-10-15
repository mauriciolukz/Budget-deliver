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
  Stream<RealmObjectChanges<AppWindows>> get changes =>
      RealmObject.getChanges<AppWindows>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(AppWindows._);
    return const SchemaObject(AppWindows, 'AppWindows', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('caption', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
    ]);
  }
}

class Vehicle extends _Vehicle with RealmEntity, RealmObject {
  Vehicle(
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

  Vehicle._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObject.set(this, 'id', value);

  @override
  String get mva => RealmObject.get<String>(this, 'mva') as String;
  @override
  set mva(String value) => RealmObject.set(this, 'mva', value);

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
  Stream<RealmObjectChanges<Vehicle>> get changes =>
      RealmObject.getChanges<Vehicle>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Vehicle._);
    return const SchemaObject(Vehicle, 'Vehicle', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('mva', RealmPropertyType.string),
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