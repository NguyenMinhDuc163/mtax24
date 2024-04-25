import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class AccountInformationWidget extends StatelessWidget {
  final String title;
  final String info;
  final bool haveDivider;
  const AccountInformationWidget({Key key,@required this.title, @required this.info, this.haveDivider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height_24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          haveDivider == null || haveDivider ? Expanded(
              flex: 2,
              child: Text(title, style: TextStyle(
                  fontSize: fontSize_43sp,
                  color: Colors.black.withOpacity(0.5)
              ),)
          ): Container(),
          Expanded(
            flex: 5,
              child: Text(info, style: text43sp,)
          ),
        ],
      ),
    );
  }
}
