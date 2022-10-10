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

  late int id;
  late String name;
  late String caption;
  late String icon;

}