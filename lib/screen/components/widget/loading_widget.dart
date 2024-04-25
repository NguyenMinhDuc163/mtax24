import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey.shade500.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(color_background),
        ),
      ),
    );
  }
}