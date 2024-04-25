
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:html/dom.dart' as dom;

import '../../init_view.dart';

class ViewChiTiet extends StatefulWidget{
  final String htlm;
  final bool type;


  ViewChiTiet(this.htlm, this.type);

  @override
  State<StatefulWidget> createState() => _ViewChiTietState();

}
class _ViewChiTietState extends State<ViewChiTiet> {
  String string;

  @override
  void initState() {
    super.initState();
    if(widget.htlm.isNotEmpty){
      string = widget.htlm;
    }
  }

  @override
  Widget build(BuildContext context) {
    String htmlOpeningString = "<!DOCTYPE html><html><body>";
    String htmlClosingString = "</body></html>";
    return new Scaffold(
      appBar: buildAppBarMenuCustom(context, widget.type ? "Tin tức" : 'Thông báo chi tiết'),
      body: SingleChildScrollView(
        child: Html(
          data: htmlOpeningString +
              string +
              htmlClosingString, //html string to be parsed

          useRichText: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          defaultTextStyle: TextStyle(fontSize: 16),
          imageProperties: ImageProperties(
            //formatting images in html content
            height: 150,
            width: 150,
          ),
          customRender: (node, children) {
            if (node is dom.Element) {
              switch (node.localName) {
                case "custom_tag":
                  return Column(children: children);
              }
            }
            return null;
          },

        ),
      ),
    );
  }
}
