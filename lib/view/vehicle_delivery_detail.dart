import 'package:flutter/material.dart';

import '../app.dart';
import '../utils/global.color.dart';
import '../widgets/button_stand.dart';
import '../widgets/card_item.dart';

class VehicleDeliveryDetail extends StatefulWidget {
  final String moduleName;
  final Vehicles vehicle;
  const VehicleDeliveryDetail({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<VehicleDeliveryDetail> createState() => _VehicleDeliveryDetailState();
}

class _VehicleDeliveryDetailState extends State<VehicleDeliveryDetail> {

  late List branchOfficesList = ['Aero puerto','7 sur','Masaya','Juigalpa'];
  Object? valueBranchOffices = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrega de vehiculo'),
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
        body:SingleChildScrollView(
          child: Container(
                child:Column(
                  children: [
                    filterCard(Icons.front_hand_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Detalles de la entrega',textAlign: TextAlign.center,),Text('')),
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Entrega'),_dropdownButtonFormField(0,null)),
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Ingreso'),_dropdownButtonFormField(0,null)),
                    filterCard(Icons.car_repair_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Kilometraje'),Text("dddddd")),
                    filterCard(Icons.local_gas_station_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Gasolina'),_dropdownButtonFormField(0,null)),
                    filterCard(Icons.water_drop,Text(style: TextStyle(fontWeight: FontWeight.bold),'Aceite'),Text("dddddd")),
                    filterCard(Icons.feed_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Numero de movimiento'),Text("UNP-TA-1526")),
                    ButtonStand(text:'Continuar',onPressed: (){
                    },width: 300,height: 50),
                  ]
                )
          )
        )
    );
  }

  filterCard(IconData? icon, description, element){

    if(widget.moduleName == 'renting' && (description.data == 'Sucursal Ingreso' || description.data == 'Numero de movimiento' )){return Card();}
    return CardItem(icon:icon,description:description,element:element);

  }

  DropdownButtonFormField _dropdownButtonFormField(int i,list) {
    //if(i > 1) return DropdownButton;
    return DropdownButtonFormField(
        dropdownColor: GlobalColors.backgroudColor,
        value: valueBranchOffices,
        elevation: 2,
        //validator: (value) => value == null ? 'Por favor elegir conductor' : null,
        onChanged: (newValue) {
          setState(() {
            valueBranchOffices = newValue;
          });
        },
        items: branchOfficesList.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
