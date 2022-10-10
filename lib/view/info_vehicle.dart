import 'package:flutter/material.dart';

class InfoVehicle extends StatefulWidget {
  final int index;
  const InfoVehicle({Key? key,required this.index}) : super(key: key);

  @override
  State<InfoVehicle> createState() => _InfoVehicleState(index);
}

class _InfoVehicleState extends State<InfoVehicle> {
  final int index;
  _InfoVehicleState(int this.index);


  @override
  Widget build(BuildContext context) {
    print(index);
    setState((){
      index;
    });
    return Container(child: Text("Pagina $index"),);
  }
}
