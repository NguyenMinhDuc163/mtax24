import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/screen/components/widget/account_information/toggle_widget.dart';
import 'package:mtax24/screen/components/widget/init_widget.dart';

class FingerSettingScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  FingerSettingScreen({Key key}) : super(key: key);

  @override
  _FingerSettingScreenState createState() => _FingerSettingScreenState();
}

class _FingerSettingScreenState extends State<FingerSettingScreen> with GetItStateMixin {

  var accountInformationController = GetIt.I<AccountInformationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountInformationController.getUserMobileInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    final fingerToggle = watchX((AccountInformationModel x) => x.fingerToggle);
    final passwordController = watchX((AccountInformationModel x) => x.passwordController);
    final loading = watchX((AccountInformationModel x) => x.loading);

    return Stack(
      children: [
        CustomerAppbarScreen(title: "Đăng ký vân tay", isShowBack: true, isShowHome: true,
          children: [
            SingleChildScrollView(
              child: Column(
                  children: [
                    ToggleWidget(
                        title: "Sử dụng vân tay để đăng nhập ứng dụng",
                        value: fingerToggle,
                        onToggle: (_) => accountInformationController.registerFingerprint(context, passwordController: passwordController, toggleFingerprint: !_))
                  ]
              ),
            ),
          ],
        ),
        loading ? LoadingWidget() : Container()
      ],
    );
  }
}
