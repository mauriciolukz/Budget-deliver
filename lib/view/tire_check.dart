import 'package:flutter/material.dart';

import '../utils/global.color.dart';

class TireCheck extends StatefulWidget {
  const TireCheck({Key? key}) : super(key: key);

  @override
  State<TireCheck> createState() => _TireCheckState();
}

class _TireCheckState extends State<TireCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revision de llantas'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )
          )
        ],
        backgroundColor: GlobalColors.backgroudColor,
      ),
      body: Text('hola'),
    );
  }
}
