import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color shadowColor ;
  const CardWidget({Key key, this.children, this.margin, this.padding, this.shadowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(width_16))),
      // shadowColor: shadowColor ?? Colors.transparent,
      // elevation: 0.1,
      margin: margin ?? EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }
}
