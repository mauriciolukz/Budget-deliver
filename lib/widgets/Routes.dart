import 'package:budgetdeliver/view/info_vehicle.dart';
import 'package:flutter/material.dart';


class Routes extends StatelessWidget {
  final String moduleName;
  final int index;
  const Routes({Key? key, required String this.moduleName, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
       InfoVehicle(moduleName:moduleName),
       InfoVehicle(moduleName:moduleName),
       InfoVehicle(moduleName:moduleName),
       InfoVehicle(moduleName:moduleName),
       InfoVehicle(moduleName:moduleName),
    ];
    return myList[index];
  }
}
