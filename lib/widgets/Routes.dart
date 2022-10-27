import 'package:budgetdeliver/app.dart';
import 'package:budgetdeliver/view/vehicle_information.dart';
import 'package:flutter/material.dart';


class Routes extends StatelessWidget {
  final String moduleName;
  final int index;
  final Vehicles vehicle;
  const Routes({Key? key, required String this.moduleName, required this.index,required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle),
      VehicleInformation(idMenu:index,moduleName:moduleName,vehicle:this.vehicle)
    ];
    return myList[index];
  }
}
