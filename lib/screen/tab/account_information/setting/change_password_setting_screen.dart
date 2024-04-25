import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';

import '../../../init_view.dart';

class ChangePasswordSettingScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {
  ChangePasswordSettingScreen({Key key}) : super(key: key);

  @override
  _ChangePasswordSettingScreenState createState() =>
      _ChangePasswordSettingScreenState();
}

class _ChangePasswordSettingScreenState
    extends State<ChangePasswordSettingScreen> with GetItStateMixin {

  var accountInformationController = GetIt.I<AccountInformationController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    accountInformationController.resetData();
  }

  @override
  Widget build(BuildContext context) {
    final oldPasswordController = watchX((AccountInformationModel x) => x.oldPasswordController);
    final newPasswordController = watchX((AccountInformationModel x) => x.newPasswordController);
    final reNewPasswordController = watchX((AccountInformationModel x) => x.reNewPasswordController);
    final errorOldPasswordController = watchX((AccountInformationModel x) => x.errorOldPasswordController);
    final errorNewPasswordController = watchX((AccountInformationModel x) => x.errorNewPasswordController);
    final errorReNewPasswordController = watchX((AccountInformationModel x) => x.errorReNewPasswordController);
    final toggleOldPassword = watchX((AccountInformationModel x) => x.toggleOldPassword);
    final toggleNewPassword = watchX((AccountInformationModel x) => x.toggleNewPassword);
    final toggleReNewPassword = watchX((AccountInformationModel x) => x.toggleReNewPassword);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: "Đổi mật khẩu", isShowBack: true, isShowHome: true,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height_32, horizontal: width_24),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextInput(
                            textEditingController: oldPasswordController,
                            haveBorder: true,
                            hintText: "Mật khẩu cũ",
                            maxLength: 20,
                            errorText: errorOldPasswordController,
                            obscureText: toggleOldPassword,
                            onToggleCustom: () => accountInformationController.setToggleOldPassword(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height_24),
                            child: TextInput(
                              textEditingController: newPasswordController,
                              haveBorder: true,
                              hintText: "Mật khẩu mới",
                              errorText: errorNewPasswordController,
                              maxLength: 20,
                              obscureText: toggleNewPassword,
                              onToggleCustom: () => accountInformationController.setToggleNewPassword(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height_24),
                            child: TextInput(
                              textEditingController: reNewPasswordController,
                              haveBorder: true,
                              hintText: "Nhập lại mật khẩu mới",
                              maxLength: 20,
                              errorText: errorReNewPasswordController,
                              obscureText: toggleReNewPassword,
                              onToggleCustom: () => accountInformationController.setToggleReNewPassword(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40),
                            child: ButtonBottomNotStackWidget(title: "Gửi", onPressed: (){
                              accountInformationController.changePassword(context,
                                  oldPassword: oldPasswordController.text,
                                  newPassword: newPasswordController.text,
                                  reNewPassword: reNewPasswordController.text);
                            }),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ],
        )



      ),
    );
  }
}
