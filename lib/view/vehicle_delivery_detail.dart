import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import '../utils/database_util.dart';
import '../app.dart';
import '../utils/global.color.dart';
import '../widgets/button_stand.dart';
import '../widgets/card_item.dart';
import '../widgets/input_text.dart';

class VehicleDeliveryDetail extends StatefulWidget {
  final String moduleName;
  final Vehicles vehicle;
  const VehicleDeliveryDetail({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<VehicleDeliveryDetail> createState() => _VehicleDeliveryDetailState();
}

class _VehicleDeliveryDetailState extends State<VehicleDeliveryDetail> {

  final _databaseUtil = GetIt.instance<DatabaseUtil>();
  late List branchOfficesList = []/*['Aero puerto','7 sur','Masaya','Juigalpa']*/;
  late List branchOfficesList2 = ['','','',''];
  late List fuelLevels = [];
  late List fuelLevels2 = ['','','',''];
  Object? valueBranchOffices = null;
  Object? valuefuelLevel = null;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    RealmResults<FuelLevels> allFuelLevels = _databaseUtil.getAllFuelLevels();
    allFuelLevels.forEach((level) {
      setState(() {fuelLevels.add(level.fuelLevel);});
    });

    RealmResults<Locations> allLocations = _databaseUtil.getAllLocations();
    allLocations.forEach((location) {
      setState(() {branchOfficesList.add(location.address);});
    });

    // TODO: implement initState
    super.initState();
  }

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
                child:Form(
                    key: _formKey,
                    child: Column(
                  children: [
                    filterCard(Icons.front_hand_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Detalles de la entrega',textAlign: TextAlign.center,),Text('')),
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Entrega'),_dropdownButtonFormField(valueBranchOffices,branchOfficesList)),
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Ingreso'),_dropdownButtonFormField(0,branchOfficesList)),
                    filterCard(Icons.car_repair_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Kilometraje'),
                      InputText(
                          validator: (value) => value.isEmpty || value == null ? "registrar kilometraje": null,
                          //onChanged: (text) => _password = text,
                          obscureText:true
                          , onChanged: (String text) {  },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    filterCard(Icons.local_gas_station_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Gasolina'),_dropdownButtonFormField2(valuefuelLevel,fuelLevels)),
                    filterCard(Icons.water_drop,Text(style: TextStyle(fontWeight: FontWeight.bold),'Aceite'),
                      InputText(
                        validator: (value) => value.isEmpty || value == null ? "registrar aceite": null,
                        //onChanged: (text) => _password = text,
                        obscureText:true
                        , onChanged: (String text) {  },
                      ),
                    ),
                    filterCard(Icons.feed_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Numero de movimiento'),Text("UNP-TA-1526")),
                    ButtonStand(text:'Continuar',onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleDeliveryDetail(moduleName:widget.moduleName,vehicle:widget.vehicle)));
                      }
                    },width: 300,height: 50),
                  ]
                )
                )
          )
        )
    );
  }

  filterCard(IconData? icon, description, element){

    if(widget.moduleName == 'renting' && (description.data == 'Sucursal Ingreso' || description.data == 'Numero de movimiento' )){return Card();}
    return CardItem(icon:icon,description:description,element:element);

  }

  DropdownButtonFormField _dropdownButtonFormField(i,listtt) {
    //if(i > 1) return DropdownButton;
    return DropdownButtonFormField(
        dropdownColor: GlobalColors.backgroudColor,
        value: valueBranchOffices,
        elevation: 2,
        validator: (value) => value == null ? 'Por favor elegir sucursal' : null,
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

  DropdownButtonFormField _dropdownButtonFormField2(i,listtt) {
    //if(i > 1) return DropdownButton;
    return DropdownButtonFormField(
      dropdownColor: GlobalColors.backgroudColor,
      value: valuefuelLevel,
      elevation: 2,
      validator: (value) => value == null ? 'Por favor elegir gasolina' : null,
      onChanged: (newValue) {
        setState(() {
          valuefuelLevel = newValue;
        });
      },
      items: fuelLevels.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
