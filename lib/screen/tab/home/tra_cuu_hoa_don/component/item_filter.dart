import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mtax24/screen/components/styles/style.dart';

Widget ItemFilterTB(String name, String values, {Function onTap, TextStyle textStyle, TextAlign textAlign}){
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: Text("$name", style: text14OBold400,),
            flex: 3,
          ),
          Expanded(
              child: InkWell(
                  onTap: onTap,
                  child: Text("$values",
                    style: textStyle == null ? text14Bold400 : textStyle,
                    textAlign: textAlign == null ? TextAlign.end : textAlign,)
              ),
            flex: 4,
          ),
          textStyle != null ?
          Icon(Icons.file_download_outlined) : SizedBox()

        ],
      ),
    ],
  );
}

