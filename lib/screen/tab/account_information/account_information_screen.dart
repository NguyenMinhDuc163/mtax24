import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/account_information/account_information_widget.dart';
import 'package:mtax24/screen/components/widget/account_information/setting_widget.dart';
import '../../init_view.dart';
import 'setting/change_password_setting_screen.dart';
import 'setting/email_setting_screen.dart';
import 'setting/finger_setting_screen.dart';
import 'setting/guide_usage_screen.dart';
import 'setting/service_package/information_service_package_screen.dart';
import 'setting/version_screen.dart';

class InformationAccountScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {
  @override
  _InformationAccountScreenState createState() =>
      _InformationAccountScreenState();
}

class _InformationAccountScreenState extends State<InformationAccountScreen>
    with GetItStateMixin {

  List<Map<String, dynamic>> functions = [
    {"icon": Icons.email_outlined, "function": "Thiết lập kênh email"},
    {"icon": Icons.fingerprint_outlined, "function": "Đăng ký vân tay"},
    {"icon": Icons.vpn_key_outlined, "function": "Đổi mật khẩu"},
    {"icon": Icons.perm_device_information_outlined, "function": "Phiên bản"},
    {"icon": Icons.list_alt_outlined, "function": "Hướng dẫn sử dụng"},
    {"icon": Icons.format_list_bulleted_outlined , "function": "Thông tin gói dịch vụ"},
    {"icon": Icons.logout_outlined , "function": "Đăng xuất"},
  ];

  @override
  Widget build(BuildContext context) {
    final userInfo = watchX((MenuHomeModel x) => x.userInfo);

    return Scaffold(
      body: Stack(
        children: [
          TabAppbarScreen(title: "", image: "assets/images/bg_tai_khoan.png", isShowBack: false, isShowHome: false,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height_32),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(height_32),
                          decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.all( Radius.circular(50.h)),
                              // boxShadow: [BoxShadow(
                              //     color: color_background.withOpacity(0.6),
                              //     offset: Offset(0,5),
                              //     blurRadius: 5.0,
                              //     spreadRadius: 0
                              // )]
                          ),
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: height_32, top: height_16, bottom: height_40),
                            child: Column(
                              children: [
                                AccountInformationWidget(title: "", info: userInfo.fullName.toString(), haveDivider: false,),
                                AccountInformationWidget(title: "mã số thuế: ", info: userInfo.tin.toString()),
                                AccountInformationWidget(title: "Địa chỉ: ", info: userInfo.addr.toString()),
                                AccountInformationWidget(title: "Email: ", info: userInfo.email.toString(), ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              child: Padding(
                                padding:
                                EdgeInsets.only(top: height_40, bottom: height_8),
                                child: Column(
                                  children: [
                                    ...Iterable.generate(functions.length).map((e) {
                                      return InkWell(
                                        onTap: () {
                                          switch(functions[e]["function"]) {
                                            case "Thiết lập kênh email":
                                              // menuPageController.setInterfaceMenuPage(5);
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => EmailSettingScreen()));

                                              break;

                                            case "Đăng ký vân tay":
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => FingerSettingScreen()));
                                              // menuPageController.setInterfaceMenuPage(6);
                                              break;

                                            case "Đổi mật khẩu":
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => ChangePasswordSettingScreen()));
                                              // menuPageController.setInterfaceMenuPage(7);
                                              break;

                                            case "Phiên bản":
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => VersionScreen()));
                                              // menuPageController.setInterfaceMenuPage(8);
                                              break;

                                            case "Hướng dẫn sử dụng":
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => GuideUsageScreen()));
                                              // menuPageController.setInterfaceMenuPage(9);
                                              break;

                                            case "Thông tin gói dịch vụ":
                                              Navigator.push(context,
                                                  new MaterialPageRoute(builder: (context) => InformationServicePackageScreen()));
                                              // menuPageController.setInterfaceMenuPage(10);
                                              break;

                                            case "Đăng xuất":
                                              DialogAlert.logOut(context);
                                              break;

                                          }
                                        },
                                        child: SettingWidget(
                                          icon: functions[e]["icon"],
                                          function: functions[e]["function"],
                                          haveDivider: e == functions.length - 1 ? false : true,
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
