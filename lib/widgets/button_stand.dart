import 'package:flutter/material.dart';

import '../utils/global.color.dart';

class ButtonStand extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ButtonStand({Key? key,required this.text,required this.onPressed,required this.height,required this.width}) : super(key: key);

  @override
  State<ButtonStand> createState() => _ButtonStandState();
}

class _ButtonStandState extends State<ButtonStand> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: (
        Container(
          margin: EdgeInsets.only(
            top: 30.0,
            left:20.0,
            right: 20.0
          ),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFF8A65),
                  Color(0xFFFF5722)
                ]
            )
          ),
          child: Center(
            child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Lato",
                  color: Colors.white
                )
            ),
          )
        )
      )
    );
  }
}
