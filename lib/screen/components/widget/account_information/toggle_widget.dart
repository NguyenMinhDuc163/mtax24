import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class ToggleWidget extends StatelessWidget {
  final String title;
  final bool value;
  final Function onToggle;
  const ToggleWidget({Key key, @required this.title, @required this.value, @required this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width_40, left: width_40, top: height_24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(title ?? "", style: text45sp,)
              ),
              CupertinoSwitch(
                activeColor: color_background,
                value: value,
                onChanged: (_) => onToggle(_),
              ),
            ],
          ),
          Divider(thickness: 2,)
        ],
      ),
    );
  }
}
