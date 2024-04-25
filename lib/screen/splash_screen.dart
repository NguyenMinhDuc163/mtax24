import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/version_controller.dart';
import 'package:mtax24/model/version_model.dart';

import 'components/utils/share_prefer_utils.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> with GetItStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetIt.I<VersionController>().getVersion(context);
    SharePreferUtils.logOutApp();
  }

  @override
  Widget build(BuildContext context) {

    final isUpdate = watchX((VersionModel x) => x.isUpdate);
    final loading = watchX((VersionModel x) => x.loading);

    return Scaffold(
      // appBar: buildAppBarMenuCustom(context, 'Chưa cập nhật', showHome: false ),
        body: loading || isUpdate ? Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/bg_splash1.png").image,
              // colorFilter: ColorFilter.mode(colorWhite.withOpacity(0.2), BlendMode.multiply),
              fit: BoxFit.cover,
            ),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 90.0),
          // child: Image.asset(
          //   'assets/images/avatar.png',
          //   fit: BoxFit.scaleDown,
          // ),
        ) : LoginScreen()
    );
  }

}
