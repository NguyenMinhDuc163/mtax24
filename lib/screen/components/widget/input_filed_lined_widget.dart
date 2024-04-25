
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import '../../init_view.dart';


// ignore: must_be_immutable
class InputFiledLinedWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  InputFiledLinedWidget(this.labelText, this.typeInput, this.controller,
      {this.color,
        this.typeKeyBoard,
        this.isOnlyInputNumber=false,
        this.prefixIcon,
        this.obscureText = false,
        this.suffixIcon,

        this.sizeVertical}
  );

  String labelText;
  String typeInput;
  TextEditingController controller;
  TextInputType typeKeyBoard;
  Color color;
  bool isOnlyInputNumber;
  Icon prefixIcon;
  bool obscureText;
  Widget suffixIcon;
  double sizeVertical;

  @override
  Widget build(BuildContext context) {

    final Validates validates = Validates(AppTranslate.of(context));
    switch (isOnlyInputNumber) {
      case true:
        return StreamBuilder(
            stream: validates.streamValidate.stream,
            builder: (context, AsyncSnapshot<String> textStream) {
              return TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,-]'))
                ],
                style: text16Bold400,
                obscureText: obscureText,
                decoration: InputDecoration(
                  fillColor: colorPrimaryLogin,
                  prefixIcon: prefixIcon != null
                      ? prefixIcon
                      : null,
                  suffixIcon: suffixIcon != null
                      ? suffixIcon
                      : null,
                  errorText: textStream.hasError ? textStream.error : null,
                  labelText: labelText,
                  enabledBorder: const UnderlineInputBorder(

                    borderSide: BorderSide(
                      color: colorPrimaryLogin, width: 0.5,),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPrimaryLogin, width: 0.5,),
                  ),
                  labelStyle: text14Bold400,
                ),
                onChanged: (String text) =>
                    validates.validateInput(text, typeInput),
                controller: controller,
                keyboardType: typeKeyBoard ?? TextInputType.text,
              );
            });
        break;
      default:
        return StreamBuilder(
            stream: validates.streamValidate.stream,
            builder: (context, AsyncSnapshot<String> textStream) {
              return TextField(
                style: TextStyle(color: Colors.black),
                obscureText: obscureText,
                decoration: InputDecoration(
                  fillColor: colorPrimaryLogin,
                  prefixIcon: prefixIcon != null
                      ? prefixIcon
                      : null,
                  border: OutlineInputBorder(),
                  suffixIcon: suffixIcon != null
                      ? suffixIcon
                      : null,
                  errorText: textStream.hasError ? textStream.error : null,
                  labelText: labelText,
                  // enabledBorder: const UnderlineInputBorder(
                  //
                  //   borderSide: BorderSide(
                  //     color: colorPrimaryLogin, width: 0.5,),
                  // ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: colorPrimaryLogin, width: 0.5,),
                  // ),
                  labelStyle: TextStyle(
                      color: colorPrimaryLogin, fontSize: fontSize_40sp),
                ),
                onChanged: (String text) =>
                    validates.validateInput(text, typeInput),
                controller: controller,
                keyboardType: typeKeyBoard ?? TextInputType.text,
              );
            });
        break;
    }
  }
}
