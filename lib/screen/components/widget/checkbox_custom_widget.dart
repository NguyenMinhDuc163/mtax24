import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';


class CheckboxCustomWidget extends StatelessWidget {
  final isChecked;
  final colorBorder;

  const CheckboxCustomWidget({Key key, this.isChecked, this.colorBorder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: width_8,horizontal: width_24),
        width: height_70,
        height: height_70,
        decoration:  BoxDecoration(
          border: Border.all(width: width_2,color:colorBorder??colorBorderInputCombobox),
          color: isChecked?Theme.of(context).primaryColor:Colors.white,
          shape: BoxShape.circle,
        ),
        child:  Icon(
          Icons.check,
          size: height_50,
          color: Colors.white,
        ));
  }
}
