import 'package:budgetdeliver/utils/database_util.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import '../app.dart';
import '../utils/global.color.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({Key? key,required this.currentIndex}) : super(key: key);

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
      onTap: (int i){
        setState((){
          index = i;
          navigationItems;
          widget.currentIndex(i);
        });
      },
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
      navigationItems.add(BottomNavigationBarItem(icon: getIcon(item.name),label: item.caption,backgroundColor: getColor(item.name)));
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

  getColor(String moduleName) {

    Color color = Colors.pink;

    switch(moduleName) {
      case 'transferring':
        color =  Colors.pink;
        break;
      case 'non_productive_use':
        color =  Colors.green;
        break;
      case 'renting':
        color =  Colors.blue;
        break;
      case 'modify':
        color =  Colors.grey;
        break;
      default:
        color =  Colors.orange;
    }

    return color;

  }

}

