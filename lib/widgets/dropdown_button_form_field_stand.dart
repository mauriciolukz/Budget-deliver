import 'package:flutter/material.dart';
import '../utils/global.color.dart';

class DropDownButtonFormFieldStand extends StatefulWidget {

  final List listParam;
  final String? textValidator;
  final Function(dynamic text) onChanged;
  final Object? setValueDrop;

  const DropDownButtonFormFieldStand({Key? key,required this.listParam, required this.textValidator, required this.onChanged,required this.setValueDrop}) : super(key: key);

  @override
  State<DropDownButtonFormFieldStand> createState() => _DropDownButtonFormFieldStandState();
}

class _DropDownButtonFormFieldStandState extends State<DropDownButtonFormFieldStand> {
  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        color:Colors.deepOrangeAccent, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:3), //border of dropdown button
        borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
        boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
            blurRadius: 5
          ) //blur radius of shadow
        ]
      ),
      child:Padding(
        padding: EdgeInsets.only(left:30, right:30),
        child:
          DropdownButtonFormField(
            dropdownColor: GlobalColors.backgroudColor,
            value: widget.setValueDrop,
            elevation: 2,
            validator: (value) => value == null ? widget.textValidator : null,
            onChanged: widget.onChanged,
            items: widget.listParam.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem.toString()),
            );
            }).toList(),
            icon: Padding( //Icon at tail, arrow bottom is default icon
              padding: EdgeInsets.only(left:20),
              child:Icon(Icons.arrow_circle_down_sharp)
            ),
            iconEnabledColor: Colors.white, //Icon color
            style: TextStyle(  //te
              color: Colors.white, //Font color
              fontSize: 20 //font size on dropdown button
            ),//remove underline
            isExpanded: true
          )
      )
    );

  }

}
