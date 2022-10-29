import 'package:flutter/material.dart';

import '../utils/global.color.dart';

class CardItem extends StatelessWidget {

  final IconData? icon;
  final description;
  final element;

  const CardItem({Key? key, this.icon, required this.description,this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              title: description,
              subtitle: element,
              leading: (icon != null) ? Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.black45)
                    )
                ),
                child: Icon(icon, color: GlobalColors.backgroudColor,size: 40),
              ) : null,
            )
        )
    );
  }
}

