import 'dart:convert';

import 'package:budgetdeliver/service/vehicle_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:realm/realm.dart';
import '../app.dart';
import '../utils/database_util.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/card_item.dart';
import '../widgets/dropdown_button_form_field_stand.dart';

class CartParts extends StatefulWidget {
  final String moduleName;
  final Vehicles vehicle;
  const CartParts({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<CartParts> createState() => _CartPartsState();
}

class _CartPartsState extends State<CartParts> {

  final _databaseUtil = GetIt.instance<DatabaseUtil>();
  late List itemsMaster = [];
  late List categories = [];
  late List iconCategories = [Icons.directions_car,Icons.feed_outlined,Icons.settings];
  late List iconCategoriesPage = [Icons.settings,Icons.directions_car,Icons.feed_outlined];
  List n = ["0","1","2","3","4","5","6","7","8","9"];
  late final List<Tab> tabs = <Tab>[const Tab(icon: Icon(Icons.home))];
  var selector;
  late RealmResults<ItemsMaster> allItemsMaster;
  late var confItemsMaster = [];

  @override
  void initState() {

    allItemsMaster = _databaseUtil.getAllItemsMaster();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getVehiclesByMVA(context, false, widget.vehicle.mva).then((response) {
        confItemsMaster = json.decode(response.body)["_items"];
        confItemsMaster.forEach((confItem) {

          for (var i = 0; i < selector.length; i++) {
            if(selector[i][1] == confItem["itemType"] && selector[i][0] == confItem["description"]){
              setState(() {
                selector[i][2] = confItem["useQty"] ? confItem["quantity"].toString() : true;
              });
            }
          }

        });

      });
    });

    selector = List.generate(allItemsMaster.length, (i) => List<dynamic>.generate(3, (j) => allItemsMaster[i].description));
    for (var i = 0; i < selector.length; i++) {
      selector[i][1] = allItemsMaster[i].itemTypeDesc;
      selector[i][2] = allItemsMaster[i].useQty ? "0" : false;
    }

    allItemsMaster.forEach((category_item) { categories.add(category_item.itemTypeDesc);});
    categories = categories.toSet().toList();

    loadTabs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroudColor,
      floatingActionButton: _floatingActionButton() ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: GlobalColors.backgroudColor,
            bottom:  TabBar(
              indicatorColor: Colors.white,
              tabs: tabs,
            ),
            title: const Text('Partes del auto'),
          ),
          body:  TabBarView(
            children: loadPageTabs(),
          ),
        ),
      ),
    );
  }

  loadTabs() {
    tabs.removeRange(0, 1);
    for (var i = 0; i < categories.length; i++) {
      tabs.add(Tab(text: categories[i],icon: Icon(iconCategories[i])));
    }
  }

  List<Widget> loadPageTabs() {
    List<Widget> pages = <Widget>[];
    categories.forEach((element) {
      pages.add(
        Container(
            child: SingleChildScrollView(
              child: Column(
                children: loadItemPageTabs(element),
              ),
            )
        )
      );
    });
    return pages;
  }

  List<Widget> loadItemPageTabs(cat) {
    List<Widget> item = <Widget>[];
    allItemsMaster.query("itemTypeDesc == '$cat'").forEach((element) {
      item.add(
          CardItem(
              icon:iconCategoriesPage[element.itemType - 1],
              description: Row(children: [Expanded(child: Text(style: TextStyle(fontWeight: FontWeight.bold),element.description,textAlign: TextAlign.left)),Container(width: 120,child:_widgetControl(element.description,element.itemTypeDesc,element.useQty))],),
          )
      );
    });

    return item;
  }

  _widgetControl(String description,String itemTypeDesc,bool useQty) {

    var idx = _getIndex(description,itemTypeDesc);

    if(useQty == true){
      return DropDownButtonFormFieldStand(
        listParam: n,
        textValidator :GlobalConstants.requiredField,
        onChanged: (value) {
          selector[idx][2] = value;
          setState(() {
            selector;
          });
        },
        setValueDrop:selector[idx][2]
      );
    }else{
        return LiteRollingSwitch(
            value: selector[idx][2],
            textOn: 'Si',
            textOff: 'No',
            colorOn: Colors.green,
            colorOff: Colors.red,
            iconOn: Icons.done,
            iconOff: Icons.phonelink_erase_rounded,
            textSize: 16.0,
            onChanged: (bool state) {
              selector[idx][2] = state;
              setState(() {
                selector;
              });
            }, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},
          );
        /*Switch(
          value: selector[idx][2],
          onChanged: (bool value) {
            selector[idx][2] = value;
            setState(() {
              selector;
            });
          },
        );*/
    }

  }

  int _getIndex(String description, String itemTypeDesc) {

    for (var i = 0; i < allItemsMaster.length; i++) {
      if(allItemsMaster[i].description == description && allItemsMaster[i].itemTypeDesc == itemTypeDesc){
        return i;
      }
    }
    return 0;

  }

  _floatingActionButton() {

    return FloatingActionButton.extended(
      elevation: 20,
      onPressed: ()  {

      },
      label: Text("Continuar"),
      icon: Icon(Icons.navigate_next),
      backgroundColor: GlobalColors.backgroudColor,
    );
  }

}

