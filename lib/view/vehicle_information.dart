import 'dart:ui';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:budgetdeliver/app.dart';
import 'package:budgetdeliver/view/vehicle_delivery_detail.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/card_item.dart';

class VehicleInformation extends StatefulWidget {
  final String moduleName;
  final Vehicle vehicle;
  const VehicleInformation({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _InfoVehicleState();
}

class _InfoVehicleState extends State<VehicleInformation> {
  final _formKey = GlobalKey<FormState>();
  final bool typeCheck = false;
  List driversList = ['Paco','Martin','Valenciano','Juaquin','Pereire','Salasar'];
  Object? valueDriver = null;

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
            loadCardVehicle(
              typeCheck == true ? Icons.call_received : Icons.call_made,
              typeCheck == true ? Text(textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),'Check In ${widget.moduleName}') : Text(textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),'Check Out ${widget.moduleName}'),
              Text(
                  widget.vehicle.isAvailable == true ? 'Disponible' : 'No disponible',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:35,
                    fontWeight: FontWeight.bold,
                    color: widget.vehicle.isAvailable == true ? Colors.green : Colors.red,
                  )
              ),
            ),
            loadCardVehicle(Icons.car_rental,Text(style: TextStyle(fontWeight: FontWeight.bold),'Model'),Text(widget.vehicle.model)),
            loadCardVehicle(Icons.info,Text(style: TextStyle(fontWeight: FontWeight.bold),'MVA'),Text(widget.vehicle.mva)),
            loadCardVehicle(Icons.ad_units_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Placa'),Text(widget.vehicle.plateNum)),
            loadCardVehicle(Icons.format_color_fill,Text(style: TextStyle(fontWeight: FontWeight.bold),'Color'),Text(widget.vehicle.color)),
            loadCardVehicle(Icons.key,Text(style: TextStyle(fontWeight: FontWeight.bold),'Llave'),Text(widget.vehicle.keyNum)),
            Form(
                key: _formKey,
                child: Column(
                children: [
                  loadCardVehicle(Icons.account_circle_outlined,Text(style: TextStyle(fontWeight: FontWeight.bold),'Conductor'),
                      DropdownButton(
                        dropdownColor: GlobalColors.backgroudColor,
                        value: valueDriver,
                        onChanged: (newValue) {
                          setState(() {
                            valueDriver = newValue;
                          });
                        },
                        items: driversList.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem)
                          );
                        }).toList(),
                      ),
                  ),
                  loadCardVehicle(Icons.call,Text(style: TextStyle(fontWeight: FontWeight.bold),'Celular'),
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
                          if(valueDriver == null) {QuickAlert.show(context: context,type: QuickAlertType.error,text: "Elija el conductor"); return;}
                          if(widget.vehicle.isAvailable){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehiculeDeliverDetail()));
                          }else{
                            QuickAlert.show(context: context,type: QuickAlertType.error,text: "Vehiculo no disponible");
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                        foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                      ),
                      child: Text('Continuar')
                  )],
                )
            )
          ],
      ),
      ),
    );
  }

  loadCardVehicle(IconData? icon, description, element){

    if(typeCheck == true && (description.data == 'Celular' || description.data == 'Conductor' )){return Card();}
    return CardItem(icon:icon,description:description,element:element);

  }

  loadAdvise(IconData icon,String description,String tittle){
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: loadCardVehicle(icon,Text(description),Text(tittle)),
    );
  }


}
