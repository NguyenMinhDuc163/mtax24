import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String function;
  final bool haveDivider;
  const SettingWidget({Key key, @required this.icon, @required this.function, this.haveDivider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: width_56, left: width_56, bottom: height_70),
          child: Icon(icon ?? Icons.image, size: icon_70sp, color: colorPrimary,),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height_16),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Row(
                      children: [
                        Expanded(child: Text(function ?? "", style: text45sp,)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width_56),
                          child: Icon(Icons.arrow_forward_ios, size: icon_40sp),
                        )
                      ],
                    ),
                  ),
                  haveDivider == null || haveDivider ? Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Divider(thickness: 1,),
                  ) : Container(
                    padding: const EdgeInsets.only(top: 30.0),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
