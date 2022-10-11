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
