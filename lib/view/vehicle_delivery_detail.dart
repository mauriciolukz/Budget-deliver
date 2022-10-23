
import 'package:budgetdeliver/utils/global.constants.dart';
import 'package:budgetdeliver/view/car_parts.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import '../utils/database_util.dart';
import '../app.dart';
import '../utils/global.color.dart';
import '../widgets/button_stand.dart';
import '../widgets/card_item.dart';
import '../widgets/dropdown_button_form_field_stand.dart';
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
  late List locations = [];
  late List fuelLevels = [];
  Object? valueFuelLevel = null;
  final _formKey = GlobalKey<FormState>();
  late String locationOut = "CUALQUIER COSA"/*widget.vehicle.location*/;
  late Object? locationIn = null;
  late int km;
  late int oil;
  late String docMov = "UNP-TA-1526";

  @override
  void initState() {

    RealmResults<FuelLevels> allFuelLevels = _databaseUtil.getAllFuelLevels();
    allFuelLevels.forEach((fuelLevel) {
      setState(() {fuelLevels.add(fuelLevel.fuelLevel);});
    });

    RealmResults<Locations> allLocations = _databaseUtil.getAllLocations();
    allLocations.forEach((location) {
      setState(() {locations.add(location.locationName);});
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
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Entrega'),Text(locationOut)),
                    filterCard(Icons.emoji_transportation,Text(style: TextStyle(fontWeight: FontWeight.bold),'Sucursal Ingreso'),
                        DropDownButtonFormFieldStand(
                           listParam: locations,
                           textValidator :GlobalConstants.requiredField,
                           onChanged: (value) => locationIn = value,
                            setValueDrop:locationIn
                        )
                    ),
                    filterCard(Icons.car_repair_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Kilometraje(KM)'),
                      InputText(
                          validator: (value) => value.isEmpty || value == null ? GlobalConstants.requiredField: null,
                          onChanged: (text) => km = text as int,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    filterCard(Icons.local_gas_station_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Gasolina'),
                        DropDownButtonFormFieldStand(
                            listParam: fuelLevels,
                            textValidator :GlobalConstants.requiredField,
                            onChanged: (value) => valueFuelLevel = value,
                            setValueDrop:valueFuelLevel
                        )
                    ),
                    filterCard(Icons.water_drop,Text(style: TextStyle(fontWeight: FontWeight.bold),'Aceite(KM)'),
                      InputText(
                        validator: (value) => value.isEmpty || value == null ? GlobalConstants.requiredField: null,
                        keyboardType: TextInputType.number,
                        onChanged: (text) => oil = text as int,
                      ),
                    ),
                    filterCard(Icons.feed_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Numero de movimiento'),Text(docMov)),
                    ButtonStand(text:'Continuar',onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartParts(moduleName:widget.moduleName,vehicle:widget.vehicle)));
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

}
