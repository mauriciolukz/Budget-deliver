import 'package:flutter/material.dart';
import '../utils/global.color.dart';

class BNavigator extends StatefulWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {

  int index = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState((){
          index = i;
        });
      },
      type:BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: GlobalColors.backgroudColor,
        iconSize: 25.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Alquiler'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: 'Traslados'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Uso no productivo'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Modificar'
          )
        ]
    );
  }
}

