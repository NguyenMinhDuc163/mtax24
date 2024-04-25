import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class HomeBackGround extends StatelessWidget {
  final List<Widget> children;
  final List<Widget> bottomButton;

  // ignore: use_key_in_widget_constructors
  HomeBackGround({this.children, this.bottomButton});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      // overflow: Overflow.visible,
      clipBehavior: Clip.none,
      children: [
        Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image : Image.asset("assets/images/ic_bg_default2.jpg"
          //   ).image,
          //       fit: BoxFit.cover),
          //   // color: colorE5E5E5.withOpacity(0.2),
          // ),
          // color: colorE5E5E5.withOpacity(0.2),
        ),
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // color: colorE5E5E5.withOpacity(0.2),
                child: KeyboardDismisser(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
        // * button chuyển trang luôn luôn đăt ở dưới nếu mà nội dung ngắn thì có thể cho vào
        Positioned(
          bottom: 0,
          left: 0,
          child: bottomButton != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: bottomButton,
                )
              : SizedBox(width: 0.0, height: 0.0),
        ),
      ],
    );
  }
}
