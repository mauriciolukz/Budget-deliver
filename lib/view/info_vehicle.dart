import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../utils/database_util.dart';

class InfoVehicle extends StatefulWidget {
  final String moduleName;
  const InfoVehicle({Key? key, required String this.moduleName}) : super(key: key);

  @override
  State<InfoVehicle> createState() => _InfoVehicleState();
}

class _InfoVehicleState extends State<InfoVehicle> {

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Pagina ${widget.moduleName}"),);
  }

}
