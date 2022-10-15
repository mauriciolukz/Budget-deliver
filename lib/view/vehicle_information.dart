import 'package:budgetdeliver/app.dart';
import 'package:budgetdeliver/view/vehicle_delivery_detail.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../utils/global.color.dart';

class VehicleInformation extends StatefulWidget {
  final String moduleName;
  final Vehicle vehicle;
  const VehicleInformation({Key? key, required String this.moduleName, required this.vehicle}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _InfoVehicleState();
}

class _InfoVehicleState extends State<VehicleInformation> {

  final bool typeCheck = true;
  List driversList = ['Paco','Martin','Valenciano','Juaquin','Pereire','Martin','Salasar'];
  Object? valueChoose;

  @override
  Widget build(BuildContext context) {

    if(widget.moduleName == ''){
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: loadInfoVehicle(Icons.find_in_page_outlined,'Buscar un vehiculo',Text('Click boton parte inferior derecha')),
      );
    }

    if(widget.vehicle.mva == ''){
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: loadInfoVehicle(Icons.cancel_outlined,'Vehiculo no encontrado',Text('Volver a intentar')),
      );
    }

    return Container(
      child:
        Column(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: Icon(typeCheck == true ? Icons.call_received : Icons.call_made, color: GlobalColors.backgroudColor,size: 40),
                title: Text(style:  TextStyle(fontWeight: FontWeight.bold),typeCheck == true ? 'Check In ${widget.moduleName}' : 'Check Out ${widget.moduleName}',textAlign: TextAlign.center),
                subtitle: Text(
                    widget.vehicle.isAvailable == true ? 'Disponible' : 'No disponible',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize:35,
                        fontWeight: FontWeight.bold,
                        color: widget.vehicle.isAvailable == true ? Colors.green : Colors.red,
                    )
                ),
              ),
            ),
            new ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  loadInfoVehicle(Icons.car_rental,'Modelo',Text(widget.vehicle.model)),
                  loadInfoVehicle(Icons.info,'MVA',Text(widget.vehicle.mva)),
                  loadInfoVehicle(Icons.ad_units_outlined,'Placa',Text(widget.vehicle.plateNum)),
                  loadInfoVehicle(Icons.format_color_fill,'Color',Text(widget.vehicle.color)),
                  loadInfoVehicle(Icons.key,'Llave',Text(widget.vehicle.keyNum)),
                  loadInfoVehicle(Icons.account_circle_outlined,'Conductor',
                    DropdownButton(
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
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
                  loadInfoVehicle(Icons.call,'Celular',
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "+XXX XXXXXXXX",
                      ),
                      inputFormatters: [MaskTextInputFormatter(mask: '+### ########',filter: { "#": RegExp(r'[0-9]') },type: MaskAutoCompletionType.lazy)],
                    ),
                  ),
                ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      onPressed: (){
                        if(widget.vehicle.isAvailable){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehiculeDeliverDetail()));
                        }else{
                          QuickAlert.show(context: context,type: QuickAlertType.error,text: "Vehiculo no disponible");
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                        foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                      ),
                      child: Text('Continuar')
                  )
                )
              ],
            )
          ],
        )
    );
  }

  loadInfoVehicle(IconData? icon,String description, element){

    if(typeCheck == true && (description == 'Celular' || description == 'Conductor' )){return Card();}

    return Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: 4.0, color: GlobalColors.backgroudColor
              ),
            ),
            color: Colors.white,
          ),
          child:new ListTile(
              //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(style:  TextStyle(fontWeight: FontWeight.bold),description),
              subtitle: element,
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                  border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black45)
                  )
                ),
                child: Icon(icon, color: GlobalColors.backgroudColor,size: 40),
              ),
          )
        )
    );


  }


}
