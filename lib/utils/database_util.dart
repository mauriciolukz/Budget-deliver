import 'package:get_it/get_it.dart';
import 'package:realm/src/realm_class.dart';
import '../app.dart';

class DatabaseUtil{

  Realm _realm;

  DatabaseUtil(Realm this._realm);

  cleanDatase(){
    _realm.write(() {
      _realm.deleteAll<Menu>();
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



}