import 'package:circular/circular.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../utils/global.constants.dart';
import 'button_stand.dart';
import 'dropdown_button_form_field_stand.dart';

class Wheels extends StatefulWidget {
  final VoidCallback onPressedSave;
  final Function(dynamic text) onChangedFlip_rimType;
  final Function(dynamic text) onChangedTyreLife;
  final Function(dynamic text) onDrag_tyrePressureLevel;
  final Object? tyreLife;
  final String descTireGlobal;
  final bool isIron;
  final String tyrePressureLevelText;
  final Function(dynamic text) onChangedRimMarkCondition;
  final Function(dynamic text) onChangedRimPainting;
  const Wheels({Key? key, required this.onPressedSave, required this.onChangedFlip_rimType, required this.onDrag_tyrePressureLevel, required this.onChangedTyreLife, this.tyreLife, required  this.descTireGlobal, required this.tyrePressureLevelText, required this.onChangedRimMarkCondition, required this.onChangedRimPainting, required  this.isIron}) : super(key: key);

  @override
  State<Wheels> createState() => _WheelsState();
}

class _WheelsState extends State<Wheels> {

  @override
  Widget build(BuildContext context) {

    late List utilLife = [];
    const condition = ['Excelente','Bueno','Regular','Mal'];
    for (var i = 1; i < 50; i++) {utilLife.add((i).toString() + ' %');}
    for (var i = 5; i < 11; i++) {utilLife.add((i * 10).toString() + ' %');}

    final TextStyle styleText = TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 16
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 40,
      child: SizedBox(
        width: 330,
        //height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                          children: [
                          Text("${widget.tyrePressureLevelText} PSI",textAlign: TextAlign.center,style: styleText),
                          Text("${widget.descTireGlobal}",textAlign: TextAlign.center,style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ))
                        ]
                  )
                  ),
                  ButtonStand(
                    text:'Guardar',
                    onPressed: widget.onPressedSave,
                    width: 100,
                    height: 40
                  ),
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
                          size: Size.fromRadius(80),
                          child:
                          FlipCard(
                            //key: key,
                            //controller:_controller,
                            onFlipDone: widget.onChangedFlip_rimType,
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
                onDrag: widget.onDrag_tyrePressureLevel,
              ),
              Row(
                children: [
                  Expanded(
                    child:  Column(
                      children: [
                        Text("Vida util",style :styleText),
                        DropDownButtonFormFieldStand(
                            listParam: utilLife,
                            textValidator :GlobalConstants.requiredField,
                            onChanged: widget.onChangedTyreLife,
                            setValueDrop:widget.tyreLife
                        ),
                      ]
                    ),
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Text("Estado de la marca",style :styleText),
                          DropDownButtonFormFieldStand(
                              listParam: condition,
                              textValidator :GlobalConstants.requiredField,
                              onChanged: widget.onChangedRimMarkCondition,
                              setValueDrop:widget.tyreLife
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (widget.isIron == true)
                            Text("Estado pintura",style :styleText),
                          if (widget.isIron == true)
                            DropDownButtonFormFieldStand(
                              listParam: condition,
                              textValidator :GlobalConstants.requiredField,
                              onChanged: widget.onChangedRimPainting,
                              setValueDrop:widget.tyreLife
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
}
