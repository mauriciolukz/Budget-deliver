import 'package:budgetdeliver/utils/database_util.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import '../app.dart';
import '../utils/global.color.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  final int showBarItem;
  const BNavigator({Key? key,required this.currentIndex,required this.showBarItem}) : super(key: key);

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {

  int index = 0;
  final _databaseUtil = GetIt.instance<DatabaseUtil>();
  late RealmResults<Menu> menu;

  final List<BottomNavigationBarItem> navigationItems = <BottomNavigationBarItem>[const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home')];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMenu();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: index,
      onTap: widget.showBarItem == -1 ? (int i){
        setState((){
          index = i;
          widget.currentIndex(i);
        });
      } : null,
      type:BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      selectedFontSize: 15,
      unselectedItemColor: Colors.white,
      backgroundColor: GlobalColors.backgroudColor,
      iconSize: 25.0,
      items: navigationItems

    );

  }

  loadMenu()  {

    menu =  _databaseUtil.getMenu();
    navigationItems.removeRange(0, 1);

    for (var item in menu) {
      if(widget.showBarItem == -1 || widget.showBarItem == item.id){
        navigationItems.add(BottomNavigationBarItem(icon: getIcon(item.name),label: item.caption));
        if(widget.showBarItem == item.id){
          navigationItems.add(BottomNavigationBarItem(icon: Icon(Icons.add,color:GlobalColors.backgroudColor),label: ""));
        }
      }
    }

  }

  getIcon(String moduleName) {

    Icon icon = const Icon(Icons.home);

    switch(moduleName) {
      case 'transferring':
        icon = const Icon(Icons.location_city);
        break;
      case 'non_productive_use':
        icon = const Icon(Icons.money_off);
        break;
      case 'renting':
        icon = const Icon(Icons.car_rental);
        break;
      case 'modify':
        icon = const Icon(Icons.car_repair);
        break;
      default:
        icon = const Icon(Icons.not_accessible);
    }

    return icon;

  }

}

