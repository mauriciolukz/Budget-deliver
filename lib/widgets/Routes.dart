import 'package:budgetdeliver/view/info_vehicle.dart';
import 'package:flutter/material.dart';


class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
       InfoVehicle(index: index),
       InfoVehicle(index: index),
       InfoVehicle(index: index),
       InfoVehicle(index: index),
       InfoVehicle(index: index),
    ];
    return myList[index];
  }
}
