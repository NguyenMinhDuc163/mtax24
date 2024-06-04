import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mtax24/controller/z_general_controller.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/toast.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart' as ti;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:translator/translator.dart';
import 'share_prefer_utils.dart';
import 'package:local_auth_android/local_auth_android.dart';

typedef ValueOtp<String> = String Function(String);

class DialogAlert{

  static showLoadding(BuildContext context) {
    // ignore: inference_failure_on_function_return_type
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                ),
              ],
            ),
          );
        });
  }

  static dissmissLoadingDialog(BuildContext context, GlobalKey key) {
    Navigator.of(context).pop();
  }
  static void showDialogAlert(BuildContext context, String content, {Function onclick, String titleBtn}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)), //this right here
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width_24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height_32),
                    child: Text('Thông báo', style: text45spBold700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width_40, left: width_40, bottom: height_16),
                    child: Text(content, style: text40sp, textAlign: TextAlign.center,),
                  ),
                  Divider(thickness: 1,),
                  InkWell(
                    onTap: () {
                      if(onclick != null) {
                        onclick();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: height_16, bottom: height_32),
                          child: Text(titleBtn ?? "Thoát", style: text45spBold700ColorBackground),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showDialogWidthOneInput(BuildContext context, {String titleInput, TextEditingController inputController, Function onFunctionAgree, bool isInputPassword}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)), //this right here
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width_24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height_32),
                    child: Text(titleInput, style: text45spBold700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width_40, left: width_40, bottom: height_16),
                    child: ti.TextInput(
                      textEditingController: inputController,
                      haveBorder: true,
                      obscureText: isInputPassword,
                      isShowDialogOneInput: true,
                    ),
                  ),
                  Divider(thickness: 1,),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: width_24),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: height_16, bottom: height_32),
                                  child: Text("Thoát", style: text45spBold700ColorBackground),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: width_24),
                          child: InkWell(
                            onTap: () {
                              if(inputController.text.isEmpty) {
                                GetIt.I<GeneralController>().setErrorText(errorText: "Không được để trống");
                              } else {
                                onFunctionAgree();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: height_16, bottom: height_32),
                                  child: Text("Đồng ý", style: text45spBold700ColorBackground),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  static Future<bool> showDialogFinger(BuildContext context, {@required String title}) async {
    bool resultFingerprint = false;
    try {
      resultFingerprint = await LocalAuthentication().authenticate(
        localizedReason: title,
        authMessages: <AuthMessages>[
          AndroidAuthMessages(cancelButton: "Hủy bỏ",
              signInTitle: 'Tax24',
              biometricHint: "")
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      Navigator.of(context).pop();
      switch (e.code) {
        case "PermanentlyLockedOut":
          DialogAlert.showDialogAlert(context, "Thao tác đã bị hủy vì xảy ra quá nhiều lần sai. Xác thực sinh trắc học bị tắt mở bằng mã PIN, hình mở khóa hoặc mật khẩu.");
          break;
        case "LockedOut":
          DialogAlert.showDialogAlert(context, "Thao tác đã bị khóa do quá nhiều lần thử. Điều này xảy ra sau 5 lần thử không thành công và kéo dài trong 30 giây.");
          break;
        case "PasscodeNotSet":
          DialogAlert.showDialogAlert(context, "Thao tác đã bị hủy vì người dùng chưa cấu hình mật mã (iOS) hoặc / PIN / pattern / password (Android) trên thiết bị.");
          break;
        case "NotEnrolled":
          DialogAlert.showDialogAlert(context, "Thao tác đã bị hủy vì người dùng chưa đăng ký bất kỳ dấu vân tay nào trên thiết bị.");
          break;
        case "OtherOperatingSystem":
          DialogAlert.showDialogAlert(context, "Thao tác đã bị hủy vì hệ điều hành của thiết bị không phải là iOS hoặc Android");
          break;
        default:
          var translation = await GoogleTranslator().translate(e.message, from: 'en', to: 'vi');
          DialogAlert.showDialogAlert(context, translation.toString());
          break;
      }
    }
    return resultFingerprint;
  }

  //  alert dành cho nhập otp login
  // ignore: inference_failure_on_function_return_type


  // static showMDialogOTP(
  //     String messanger, BuildContext context, ValueOtp valueOtp,
  //     {bool visibleInput = false}) {
  //   bool isRemember = false;
  //   final otpController = TextEditingController();
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           // backgroundColor: Colors.blue,
  //             insetPadding: (visibleInput != true) ? EdgeInsets.symmetric(horizontal: 10) : null, // fix overload pinCode
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.w)), //this right here
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: <Widget>[
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 15),
  //                 child: Container(
  //                     child: Center(
  //                   child: Column(
  //                     children: [
  //                       Text("Thông báo",
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(
  //                               fontSize: 50.sp, fontWeight: FontWeight.bold)),
  //                       SizedBox(height: height_40,),
  //                       Text(visibleInput == true ? 'otpDialog.title'.tr(): "Vui lòng nhập mã PIN",
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(
  //                               fontSize: 50.sp,))
  //                     ],
  //                   ),
  //                 )),
  //               ),
  //               visibleInput == true
  //                   ? Container(
  //                       child: Center(
  //                     child: Text(
  //                       messanger,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ))
  //                   : Column(
  //                 children: [
  //                   Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 10.w),
  //                       margin: EdgeInsets.only(bottom: 30.h),
  //                       child: PinCodeTextField(
  //                         onCompleted: (pin) {
  //                           otpController.text = pin;
  //                         },
  //                         length: 8,
  //                         appContext: context,)
  //                   ),
  //                   Center(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                       Checkbox(value: isRemember, onChanged: (value){
  //                         isRemember = value;
  //                       }),
  //                       Text("Ghi Nhớ Mật Khẩu"),
  //                     ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 15),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     border: Border(
  //                       top: BorderSide(color: Colors.grey),
  //                     ),
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: <Widget>[
  //                       // ignore: avoid_unnecessary_containers
  //                       Container(
  //                         child: Flexible(
  //                           flex: 1,
  //                           fit: FlexFit.tight,
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               border: Border(
  //                                 right: BorderSide(color: Colors.grey),
  //                               ),
  //                             ),
  //                             child: ElevatedButton(
  //                                 // color: blueAccent,
  //                                 onPressed: () {
  //                                   Navigator.of(context).pop();
  //                                 },
  //                                 style: ButtonStyle(
  //                                   backgroundColor: MaterialStateProperty.all(colorWhite),
  //                                   elevation: MaterialStateProperty.all<double>(0),
  //                                 ),
  //                                 child: Text(
  //                                   // AppTranslate.of(context)
  //                                   //     .translate('common.cancel'),
  //                                   'logOut.cancel'.tr(),
  //                                   style: TextStyle(
  //                                       fontSize: fontSize_40sp,
  //                                       color: Theme.of(context).primaryColor),
  //                                 )),
  //                           ),
  //                         ),
  //                       ),
  //                       Flexible(
  //                         flex: 1,
  //                         fit: FlexFit.tight,
  //                         child: ElevatedButton(
  //                             // color: blueAccent,
  //                             onPressed: () {
  //                               if (visibleInput == false) {
  //                                 if (otpController.text != "") {
  //                                   valueOtp(otpController.text);
  //                                   Navigator.of(context)
  //                                       .pop({otpController.text});
  //                                 } else {
  //                                   Toast.showLong(
  //                                       'otpDialog.title'.tr() + " !");
  //                                 }
  //                               } else {
  //                                 Navigator.of(context).pop();
  //                               }
  //                             },
  //                             style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all(colorWhite),
  //                               elevation: MaterialStateProperty.all<double>(0),
  //                             ),
  //                             child: Text('logOut.yes'.tr(),
  //                                 style: TextStyle(
  //                                     fontSize: fontSize_40sp,
  //                                     color: Theme.of(context).primaryColor))),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }


  static showMDialogOTP(
      String messenger, BuildContext context, ValueOtp valueOtp,
      {bool visibleInput = false, String pinCode = '12345678', String flag = 'N'})  {
    bool isRemember = (flag == 'Y') ? true : false;
    final otpController = TextEditingController();
    otpController.text = (flag == 'Y') ? pinCode : '';
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: (visibleInput != true) ? EdgeInsets.symmetric(horizontal: 10) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      margin: EdgeInsets.only(bottom: margin_16),
                      child: Center(
                        child: Column(
                          children: [
                            Text("Thông báo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 50.sp, fontWeight: FontWeight.bold)),
                            SizedBox(height: height_16),
                            Text(visibleInput == true ? 'otpDialog.title'.tr() : 'PINDialog.title'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 50.sp)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  visibleInput == true
                      ? Container(
                    child: Center(
                      child: Text(
                        messenger,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                      : Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        margin: EdgeInsets.only(bottom: 30.h),
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          controller: otpController,
                          onCompleted: (pin) {
                            otpController.text = pin;
                          },
                          length: 8,
                          appContext: context,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isRemember,
                            onChanged: (value) {
                              setState(() {
                                isRemember = value;
                              });
                            },
                          ),
                          Text("Ghi Nhớ Mật Khẩu"),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(colorWhite),
                                  elevation: MaterialStateProperty.all<double>(0),
                                ),
                                child: Text(
                                  'logOut.cancel'.tr(),
                                  style: TextStyle(
                                      fontSize: 40.sp,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (visibleInput == false) {
                                  if (otpController.text != "") {
                                    valueOtp(otpController.text);
                                    // TODO - luu ma PIN
                                    await SharePreferUtils.savePIN(otpController.text);
                                    await SharePreferUtils.saveStatusPIN(isRemember);

                                    Navigator.of(context).pop({otpController.text});
                                  } else {
                                    Toast.showLong('PINDialog.title'.tr() + " !");
                                  }
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(colorWhite),
                                elevation: MaterialStateProperty.all<double>(0),
                              ),
                              child: Text('logOut.yes'.tr(),
                                  style: TextStyle(
                                      fontSize: 40.sp,
                                      color: Theme.of(context).primaryColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  static logOut(BuildContext context) {
    // ignore: inference_failure_on_function_return_type
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            // backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)), //this right here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Bạn muốn đăng xuất tài khoản này ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Đăng xuất !",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            child: ElevatedButton(
                              // color: blueAccent,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(colorWhite),
                                  elevation: MaterialStateProperty.all<double>(0),
                                ),
                                child: Text(
                                  "Hủy bỏ",
                                  style: TextStyle(
                                      fontSize: fontSize_40sp,
                                      color: Theme.of(context).primaryColor),
                                )),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                            onPressed: () {
                              // GetIt.I<MenuPageController>().setInterfaceMenuPage(0);
                              SharePreferUtils.logOutApp();
                              // đồng ý thoát app xóa các trang cũ đi
                              Phoenix.rebirth(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(colorWhite),
                              elevation: MaterialStateProperty.all<double>(0),
                            ),
                            child: Text("Đồng ý",
                                style: TextStyle(
                                    fontSize: fontSize_40sp,
                                    color: Theme.of(context).primaryColor))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  static void showDialogAlertCancel(BuildContext context, String content, {Function onSuccess}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)), //this right here
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('fingerprint.notif'.tr(),
                      style: TextStyle(
                          fontSize: 50.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Center(
                      child: Text(content),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                FocusScope.of(context).unfocus();
                                if(onSuccess != null){
                                  onSuccess();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(colorWhite),
                                elevation: MaterialStateProperty.all<double>(0),
                              ),
                              child: Text('logOut.yes'.tr(),
                                  style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showDialogAlertCloseScreen(BuildContext context, String content) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)), //this right here
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('fingerprint.notif'.tr(),
                      style: TextStyle(
                          fontSize: 50.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Center(
                      child: Text(content),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                FocusScope.of(context).unfocus();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(colorWhite),
                                elevation: MaterialStateProperty.all<double>(0),
                              ),
                              child: Text('logOut.yes'.tr(),
                                  style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static showDialogInfo(BuildContext context, String content, {Function onSuccess}) {
    // ignore: inference_failure_on_function_return_type
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            // backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w)), //this right here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Thông báo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          content,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            child: ElevatedButton(
                              // color: blueAccent,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(colorWhite),
                                  elevation: MaterialStateProperty.all<double>(0),
                                ),
                                child: Text(
                                  "Hủy bỏ",
                                  style: TextStyle(
                                      fontSize: fontSize_40sp,
                                      color: Theme.of(context).primaryColor),
                                )),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                            onPressed: onSuccess,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(colorWhite),
                              elevation: MaterialStateProperty.all<double>(0),
                            ),
                            child: Text("Đồng ý",
                                style: TextStyle(
                                    fontSize: fontSize_40sp,
                                    color: Theme.of(context).primaryColor))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
