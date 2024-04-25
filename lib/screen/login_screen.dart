import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/forgot_password_screen.dart';
import 'package:mtax24/screen/tab/account_information/setting/guide_usage_screen.dart';
import 'package:mtax24/screen/tab/account_information/setting/version_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/xac_minh_hoa_don_screen.dart';
import 'package:mtax24/service/init.dart';
import 'package:url_launcher/url_launcher.dart';
import 'init_view.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with GetItStateMixin {
  TextEditingController passwordController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  bool isShowPassword = true;
  int iconFinger = 0xe834;
  String token_push = "";
  String lan = '';
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  var controller = GetIt.I<UserController>();
  int languageChecker = 1;

  @override
  void initState() {
    checkFinger();
    controller.getDeviceId();
    super.initState();
  }

  bool isFace = false;

  checkFinger() async {
    String username = await SharePreferUtils.getUserName();
    token_push = await SharePreferUtils.getFCMToken();
    accountController.text = username;
    List<BiometricType> availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();
    setState(() {
      isFace = availableBiometrics.contains(BiometricType.face);
    });
  }

  Future<bool> _onBackPressed() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Public.init(context);
    registerHandler((LoginModel x) => x.user,
        (context, UserResponse userResponse, cancel) {
      verifyAuthentication(userResponse);
    });

    final loading = watchX((LoginModel x) => x.loading);

    return  WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            BaseAppbarScreen(
              children: [
                buildExpandedContainer(context),
              ],
              bottomNavBar: Container(
                color: color_background,
                child: Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height_16),
                      child: Stack(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(XacMinhHoaDonScreen.routeName, arguments: InvoiceVerifyArguments(showHome: false));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.qr_code_scanner_outlined,
                                          color: colorWhite),
                                      Padding(
                                        padding: EdgeInsets.only(top: height_16),
                                        child: Text("Xác minh", style: TextStyle(color: colorWhite, fontWeight: FontWeight.normal),),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(GuideUsageScreen.routeName);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.list_alt_outlined, color: colorWhite),
                                      Padding(
                                        padding: EdgeInsets.only(top: height_16),
                                        child: Text("Hướng dẫn", style: TextStyle(color: colorWhite, fontWeight: FontWeight.normal)),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(VersionScreen.routeName);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.perm_device_information_outlined, color: colorWhite),
                                      Padding(
                                        padding: EdgeInsets.only(top: height_16),
                                        child: Text("Phiên bản", style: TextStyle(color: colorWhite, fontWeight: FontWeight.normal)),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launch("tel://19006630");
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.phone, color: colorWhite),
                                      Padding(
                                        padding: EdgeInsets.only(top: height_16),
                                        child: Text("Hỗ trợ", style: TextStyle(color: colorWhite, fontWeight: FontWeight.normal)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loading ? LoadingWidget() : SizedBox()
          ],
        ),
    );
  }

  Expanded buildExpandedContainer(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: padding_80, right: padding_80),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            InputFiledLinedWidget(
                'login.name'.tr(),
                ACCOUNT,
                accountController,
                prefixIcon: Icon(Icons.person, color: colorGrey, size: icon_50sp)),
            SizedBox(
              height: height_30,
            ),
            // Input Password
            InputFiledLinedWidget(
              'login.pwd'.tr(),
              PASSWORD,
              passwordController,
              prefixIcon: Icon(Icons.password, color: colorGrey, size: icon_50sp),
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  !isShowPassword
                      ? Icons.visibility_off
                      : Icons.remove_red_eye_rounded,
                  color: colorGrey,
                ),
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
              ),
            ),
            SizedBox(
              height: height_70,
            ),

            Row(
              children: [
                Expanded(
                  child: ButtonBottomNotStackWidget(
                    title: "login.buttonSubmit".tr(),
                    onPressed: () {
                      if (accountController.text.trim() == null ||
                          accountController.text.trim() == "" ||
                          passwordController.text.trim() == null ||
                          passwordController.text.trim() == "") {
                        DialogAlert.showDialogAlertCancel(
                            context, 'login.empty'.tr());
                      } else {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.authentication(AuthenticationRequest(
                          passCode: Utils.getCurrentTimeStringRequest(),
                          username: accountController.text.trim(),
                          password: Utils.generateSHA256Pwd(passwordController.text.trim()),
                          operatingSystem: Constants.PLATFORM,
                          tokenId: token_push,
                          deviceId: GlobalUtils.DEVICE_ID,
                          lang: Constants.VI,
                        ));
                      }
                      //TODO backdoor
                      // Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    marginTop: 0,
                  ),
                ),
                // SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: width_20, top: height_20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radius_10)),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO call api loginFinger
                      // _loginFinger();
                      controller.loginFinger(context, usernameFinger: accountController.text, tokenId: token_push);
                    },
                    child: Icon(isFace
                        ? Icons.face
                        : Icons.fingerprint,
                        size: icon_145sp,
                        color: colorPrimary),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(padding_16),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: Text("Quên mật khẩu", style: text_action_font14, textAlign: TextAlign.center,),

                    ),
                  ),
                  flex: 1,
                ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: InkWell(
                //       onTap: (){
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => DangKyDichVuScreen()),
                //         );
                //       },
                //       child: Text("Đăng ký dịch vụ", style: text_action_font14, textAlign: TextAlign.end,),
                //
                //     ),
                //   ),
                //   flex: 1,
                // ),
              ],
            )

          ]),
        ),
      ),
    );
  }

  void verifyAuthentication(UserResponse result) {
    switch (result.responseCode) {
      // case StatusApi.STATUS_LOGIN_AUTHORIZED_FIRST:  // login lan dau
      //   var controller = GetIt.I<UserController>();
      //   DialogAlert.showMDialogOTP('login.otpInput'.tr(), context, (otpValue) {
      //     // login(request, context,Constants.FINGERPRINT_N);
      //     var controller = GetIt.I<UserController>();
      //     controller.authentication(AuthenticationRequest(
      //       requestId: Utils.getCurrentTimeStringRequest(),
      //       username: accountController.text.trim(),
      //       password: passwordController.text.trim(),
      //       otpNo: otpValue,
      //       operatingSystem: Constants.PLATFORM,
      //       tokenId: token_push,
      //       deviceId: GlobalUtils.DEVICE_ID,
      //     ));
      //   },);
      //   break;
      case StatusApi.STATUS_LOGIN_AUTHENTICATION_AUTH00: // login thanh coong
      case StatusApi.STATUS_LOGIN_AUTHENTICATION_AUTH08: // login thanh coong
        loginStep2VerifyOtp(result);
        break;
      case StatusApi.STATUS_LOGIN_AUTHENTICATION_AUTH06:
        DialogAlert.showDialogAlertCancel(context, result.message);
        break;
      default:
        Toast.showLongTop(result.message);
        break;
    }
  }

  void loginStep2VerifyOtp(UserResponse data) async {
    await SharePreferUtils.saveAccessToken(data.token);
    await SharePreferUtils.saveUserInfo(data);
    await SharePreferUtils.saveUsername(data.tin);
    await SharePreferUtils.saveUserInfoFinger(data, data.tin);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }

}
