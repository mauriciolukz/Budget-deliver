import 'dart:async';

import 'package:budgetdeliver/view/car_parts.dart';
import 'package:circular/circular.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../app.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/button_stand.dart';
import '../widgets/dropdown_button_form_field_stand.dart';
import 'package:flip_card/flip_card.dart';

class TireCheck extends StatefulWidget {
  static const routeName = 'TireCheck';

  const TireCheck({Key? key}) : super(key: key);

  @override
  State<TireCheck> createState() => _TireCheckState();
}

class _TireCheckState extends State<TireCheck> {
  late List fuelLevels = ["30 psi","36 psi","42 psi"];
  Object? valueFuelLevel;
  var selector;
  late List utilLife = [];
  Object? valueutilLife;
  late int value2 = 0;
  var valueuFlip;
  var showTire = false;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
   FlipCardController _controller = FlipCardController();
   Color colorIconTire = Colors.red;
  late Timer mytimer;
  String descTireGlobal = "";
  @override
  void initState() {
    _controller.toggleCard();
    for (var i = 5; i < 11; i++) {utilLife.add((i * 10).toString() + '%');}
    mytimer =  Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        colorIconTire = colorIconTire.value == 4294198070 ? Colors.grey : Colors.red;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            //fit: BoxFit.fill
          ),
        ),
        child: Stack(
          children: [
            builderr2("D-L-1",210.0,150.0,0.0,Icons.info,colorIconTire),
            builderr2("D-R-2",210.0,0.0,150.0,Icons.info,colorIconTire),
            builderr2("T-L-3",600.0,150.0,0.0,Icons.info,colorIconTire),
            builderr2("T-R-4",600.0,0.0,150.0,Icons.info,colorIconTire),
            builderr2("R-5",665.0,0.0,285.0,Icons.info,colorIconTire),
            Positioned(
                top: 5.00,
                right: 10.00,
                child: showTire == true ? builderr() : Card()
            )
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton() ,
    );
  }

   builderr(){
    return
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 40,
          child: SizedBox(
            width: 330,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(value2.toString() + " PSI ${descTireGlobal}",textAlign: TextAlign.center,style: TextStyle(fontSize: 30))
                      ),
                      ButtonStand(text:'Guardar',onPressed: () {
                        setState(() {
                          showTire = false;
                        });
                      },width: 100,height: 40),
                    ],
                  ),
                  CircularSlider(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                    ),
                    maxValue: 100,
                    radius:100,
                    child:
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 58.0,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                        radius: 35.0,
                          //child: null
                          child:
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(80), // Image radius
                              child:
                              FlipCard(
                                //key: key,
                                  //controller:_controller,
                                onFlipDone: (statuss) {
                                  setState(() {
                                    valueuFlip = statuss;
                                  });
                                },
                                //controller: _controller,
                                fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                                direction: FlipDirection.HORIZONTAL, //
                                front: Container(
                                  child: Image.asset('assets/images/ring-lujo.png',fit: BoxFit.contain),
                                ),
                                back: Container(
                                  child: Image.asset('assets/images/ring-hierro.png',fit: BoxFit.contain),
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                    color: Color(0xFF57F17),
                    sliderColor: Color(0xFFF44336),
                    unSelectedColor: Color(0xFF00C853),
                    onDrag: (value) {
                      setState(() {
                        value2 = value;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:  DropDownButtonFormFieldStand(
                        listParam: utilLife,
                        textValidator :GlobalConstants.requiredField,
                        onChanged: (value) => valueutilLife = value,
                        setValueDrop:valueutilLife
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            LiteRollingSwitch(
                              value: true,
                              textOn: 'marca',
                              textOff: 'marca',
                              colorOn: Colors.green,
                              colorOff: Colors.red,
                              iconOn: Icons.done,
                              iconOff: Icons.phonelink_erase_rounded,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                selector = state;
                                setState(() {
                                  selector;
                                });
                              }, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (valueuFlip == true)
                              LiteRollingSwitch(
                                value: true,
                                textOn: 'pintado',
                                textOff: 'no pintado',
                                colorOn: Colors.green,
                                colorOff: Colors.red,
                                iconOn: Icons.done,
                                iconOff: Icons.phonelink_erase_rounded,
                                textSize: 16.0,
                                onChanged: (bool state) {
                                  selector = state;
                                  setState(() {
                                  selector;
                                  });
                                }, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},
                              ),

                          ],
                        )
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        );
  }

  Positioned builderr2(String descTire,double al,double anl,double anr,IconData icon,Color color){
      //resetTire(descTire);
      if(anl == 0.0){
        return Positioned(
          top: al,
          right: anr,
          child: InkWell(onTap: (){
            setState(() {
              showTire = true;
              descTireGlobal = descTire;
              mytimer.cancel();
            });
          },child: Icon(icon,size: 40, color: color)),
        );
      }else{
        return Positioned(
          top: al,
          left: anl,
          child: InkWell(onTap: (){
            setState(() {
              showTire = true;
              descTireGlobal = descTire;
              mytimer.cancel();
            });
          },child: Icon(icon,size: 40, color: color)),
        );
      }

  }

  void resetTire(String descTire) {
    setState(() {
      descTireGlobal = descTire;
    });
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
