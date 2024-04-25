import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class DataSearchWidget extends StatelessWidget {
  final String title, content;
  const DataSearchWidget({Key key,@required this.title, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height_24),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: height_24),
            child: Row(children: [
              Expanded(child: Text(title, style: text45sp)),
              Expanded(child: Text(content, style: text45sp))
            ],),
          ),
          Divider(thickness: 1,)
        ],
      ),
    );
  }
}
