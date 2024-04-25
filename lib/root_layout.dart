import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/init_view.dart';


class RootLayout extends StatefulWidget {
  final Widget child;

  const RootLayout({
    this.child,
  });

  @override
  _RootLayoutState createState() => _RootLayoutState();
}



class _RootLayoutState extends State<RootLayout> {



  @override
  void initState() {
    super.initState();
  }


@override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Public.init(context);
  //  ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(children: [
      widget.child,
    ])
    );
  }
}
