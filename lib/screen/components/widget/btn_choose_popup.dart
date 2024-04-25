import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class BtnChoosePopup extends StatefulWidget {
  final Function onTab;
  final String title;
  final bool check;
  BtnChoosePopup({Key key, this.onTab, this.title, this.check})
      : super(key: key);

  @override
  _BtnChoosePopupState createState() => _BtnChoosePopupState();
}

class _BtnChoosePopupState extends State<BtnChoosePopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: widget.onTab,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue[50]))),
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child:
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
                  Container(
                    height: 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: text12Bold400,
                      ),
                    ),
                  ),
                  // widget.check
                  //     ? Icon(
                  //   Icons.check,
                  //   size: 50.h,
                  //   color: Colors.blue,
                  // )
                  //     : Container(),
              //   ],
              // ),
            ),
          )),
    );
  }
}
