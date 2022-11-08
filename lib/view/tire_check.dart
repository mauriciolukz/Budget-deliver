import 'dart:async';

import 'package:budgetdeliver/view/car_parts.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import '../utils/global.color.dart';
import 'package:flip_card/flip_card.dart';
import '../widgets/wheels.dart';

class TireCheck extends StatefulWidget {
  static const routeName = 'TireCheck';

  const TireCheck({Key? key}) : super(key: key);

  @override
  State<TireCheck> createState() => _TireCheckState();
}

class _TireCheckState extends State<TireCheck> {

  var orientation,size,height,width;
  var showModalTire = false;
  //GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  //GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
   //FlipCardController _controller = FlipCardController();
   Color colorIconTire = Colors.red;
  late Timer myTimer;
  String descTireGlobal = "";
  String tyrePressureLevel = "";
  bool isIron = false;

  @override
  void initState() {
    //_controller.toggleCard();
    myTimer =  Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        colorIconTire = colorIconTire.value == 4294198070 ? Colors.grey : Colors.red;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    orientation = MediaQuery.of(context).orientation;
    //cardKey.currentState?.toggleCard();
    //cardKey2.currentState?.toggleCard();
    //setState(() {
      //_controller.toggleCard();
    //});
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
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage('assets/images/car_topview.png'),
            fit: BoxFit.scaleDown
          ),
        ),
        child: Stack(
          children: [
            builderr2("DELANTERA-IZQUIERDA-1",height /(orientation == Orientation.portrait ? 4.5 : 8),width /(orientation == Orientation.portrait ? 4 : 2.7),0.0,Icons.info,colorIconTire),
            builderr2("DELANTERA-DERECHA-2",height /(orientation == Orientation.portrait ? 4.5 : 8),0.0,width /(orientation == Orientation.portrait ? 4 :  2.7),Icons.info,colorIconTire),
            builderr2("TRASERA-IZQUIERDA-3",height /1.50,width /(orientation == Orientation.portrait ? 4 :  2.7),0.0,Icons.info,colorIconTire),
            builderr2("TRASERA-DERECHA-4",height /1.50,0.0,width /(orientation == Orientation.portrait ? 4 :  2.7),Icons.info,colorIconTire),
            builderr2("REPUESTO-5",height /1.30,0.0,width /2.1,Icons.info,colorIconTire),
            Positioned(
                top: 5.00,
                right: 10.00,
                child: showModalTire == true ?
                Wheels(
                  descTireGlobal:  descTireGlobal,
                  tyrePressureLevelText : tyrePressureLevel,
                  isIron : isIron,
                  onPressedSave: (){
                    setState(() {
                      showModalTire = false;
                    });
                  },
                  onChangedFlip_rimType: (value){
                     setState(() {
                        isIron = value;
                     });
                  },
                  onChangedTyreLife: (value){

                  },
                  onChangedRimMarkCondition: (value){

                  },
                  onChangedRimPainting: (value){

                  },
                  onDrag_tyrePressureLevel: (value){
                    setState(() {
                      tyrePressureLevel = value.toString();
                    });
                  },
                ) :
                Card()
            )
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton() ,
    );
  }

  Positioned builderr2(String descTire,double al,double anl,double anr,IconData icon,Color color){
      if(anl == 0.0){
        return Positioned(
          top: al,
          right: anr,
          child: InkWell(onTap: (){
            setState(() {
              showModalTire = true;
              descTireGlobal = descTire;
              myTimer.cancel();
            });
          },child: Icon(icon,size: 40, color: color)),
        );
      }else{
        return Positioned(
          top: al,
          left: anl,
          child: InkWell(onTap: (){
            setState(() {
              showModalTire = true;
              descTireGlobal = descTire;
              myTimer.cancel();
            });
          },child: Icon(icon,size: 40, color: color)),
        );
      }

  }

  _floatingActionButton() {

    return FloatingActionButton.extended(
      elevation: 20,
      onPressed: ()  {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartParts()));
      },
      label: Text("Continuar"),
      icon: Icon(Icons.navigate_next),
      backgroundColor: GlobalColors.backgroudColor,
    );
  }

}
