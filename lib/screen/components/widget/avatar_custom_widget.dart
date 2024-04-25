import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AvatarCustomWidget extends StatefulWidget {
  final double height;
  final double width;
  final bool disable;
  final Color colorBorder;

  AvatarCustomWidget(
      {Key key, this.height, this.width, this.disable, this.colorBorder})
      : super(key: key);

  @override
  _AvatarCustomWidget createState() => _AvatarCustomWidget();
}

class _AvatarCustomWidget extends State<AvatarCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(150))),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.colorBorder != null
                    ? widget.colorBorder
                    : Theme.of(context).primaryColorLight,
                width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(150))),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(150)),
              child: Image.asset('assets/images/avata1.png',)
            ),
            // loading ? LoadingWidget() : SizedBox(),
          ],
        ),
      ),
    );
  }
}
