import 'package:flutter/material.dart';

import '../utils/global.color.dart';

class VehiculeDeliverDetail extends StatefulWidget {
  const VehiculeDeliverDetail({Key? key}) : super(key: key);

  @override
  State<VehiculeDeliverDetail> createState() => _VehiculeDeliverDetailState();
}

class _VehiculeDeliverDetailState extends State<VehiculeDeliverDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrega de vehiculo'),
          backgroundColor: GlobalColors.backgroudColor,
        ),
        backgroundColor: Colors.white,
        body:Text('aaaa')
    );
  }
}
