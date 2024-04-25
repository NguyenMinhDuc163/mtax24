import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/utils/name_icon.dart';
import '../styles/style.dart';

class ButtonBottomNotStackWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final double marginTop;
  final double radius;
  final bool isExcel;
  final Color color;
  final TextStyle textStyle;

  const ButtonBottomNotStackWidget({Key key, @required this.title, @required this.onPressed, this.margin, this.width, this.height,this.marginTop, this.radius, this.isExcel, this.color, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? margin_32),
      height: height ?? heightButton,
      width: width ?? MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
          gradient: color == null ? LinearGradient( begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[color_background, color406BAC]) : null,
          color: color != null ? color : null,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 25))),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 25)))
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isExcel != null && isExcel ? Padding(
              padding: EdgeInsets.only(right: width_24),
              child: Image.asset(png_excel, height: height_40, width: width_40,),
            ) : Container(),
            Expanded(
              child: Center(
                child: Text(
                  title, style: textStyle ?? text_button_white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
