import 'dart:ui';
import 'package:budgetdeliver/app.dart';
import 'package:budgetdeliver/view/vehicle_delivery_detail.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:realm/realm.dart';
import '../utils/database_util.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/card_item.dart';

class VehicleInformation extends StatefulWidget {
  final String moduleName;
  final Vehicles vehicle;
  const VehicleInformation({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _InfoVehicleState();
}

class _InfoVehicleState extends State<VehicleInformation> {
  final _formKey = GlobalKey<FormState>();
  late final bool typeCheck;
  late List driversList = [];
  Object? valueDriver = null;
  final _databaseUtil = GetIt.instance<DatabaseUtil>();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {typeCheck = widget.vehicle.isAvailable;});
    RealmResults<Drivers> allDrivers =_databaseUtil.getAllDrivers();
    allDrivers.forEach((driver) {
      setState(() {driversList.add(driver.fullName);});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.moduleName == ''){
      return loadAdvise(Icons.find_in_page_outlined,'Buscar un vehiculo','Click boton parte inferior derecha');
    }

    if(widget.vehicle.mva == ''){
      return loadAdvise(Icons.cancel_outlined,'Vehiculo no encontrado','Volver a intentar');
    }

    return SingleChildScrollView(
      child: Container(
        child:Column(
          children: <Widget>[
            filterCard(
              widget.vehicle.isAvailable == true ? Icons.call_made : Icons.call_received,
              widget.vehicle.isAvailable == true ? Text(textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),'Check Out ${widget.moduleName}') : Text(textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),'Check In ${widget.moduleName}'),
              Text(
                  widget.vehicle.isAvailable == true ? 'Salida' : 'Entrada',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:35,
                    fontWeight: FontWeight.bold,
                    color: widget.vehicle.isAvailable == true ? Colors.green : Colors.red,
                  )
              ),
            ),
            filterCard(Icons.car_rental,Text(style: TextStyle(fontWeight: FontWeight.bold),'Model'),Text(widget.vehicle.model)),
            filterCard(Icons.info,Text(style: TextStyle(fontWeight: FontWeight.bold),'MVA'),Text(widget.vehicle.mva)),
            filterCard(Icons.ad_units_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Placa'),Text(widget.vehicle.plateNum)),
            filterCard(Icons.format_color_fill,Text(style: TextStyle(fontWeight: FontWeight.bold),'Color'),Text(widget.vehicle.color)),
            filterCard(Icons.key,Text(style: TextStyle(fontWeight: FontWeight.bold),'Llave'),Text(widget.vehicle.keyNum)),
            Form(
                key: _formKey,
                child: Column(
                children: [
                  filterCard(Icons.account_circle_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Conductor'),
                    DropdownButtonFormField(
                        dropdownColor: GlobalColors.backgroudColor,
                        value: valueDriver,
                        elevation: 2,
                        validator: (value) => value == null ? 'Por favor elegir conductor' : null,
                        onChanged: (newValue) {
                          setState(() {
                            valueDriver = newValue;
                          });
                        },
                        items: driversList.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                  ),
                  filterCard(Icons.call,Text(style: TextStyle(fontWeight: FontWeight.bold),'Celular'),
                    TextFormField(
                      validator: (value) => value!.isEmpty || value == null ? GlobalConstants.enterPassword: null,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "+505 00000000",
                      ),
                      inputFormatters: [MaskTextInputFormatter(mask: '+### ########',filter: { "#": RegExp(r'[0-9]') },type: MaskAutoCompletionType.lazy)],
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleDeliveryDetail(moduleName:widget.moduleName,vehicle:widget.vehicle)));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                        foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                      ),
                      child: Text('Continuar')
                  )
                ],
                )
            )
          ],
      ),
      ),
    );
  }

  filterCard(IconData? icon, description, element){

    if(widget.moduleName == 'renting' && (description.data == 'Celular' || description.data == 'Conductor' )){return Card();}
    return CardItem(icon:icon,description:description,element:element);

  }

  loadAdvise(IconData icon,String description,String tittle){
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: filterCard(icon,Text(description),Text(tittle)),
    );
  }


}
