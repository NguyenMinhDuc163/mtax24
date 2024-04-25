import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mtax24/controller/z_general_controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/service/api_service/request/login/login_finger_request.dart';
import 'package:mtax24/service/api_service/response/account_information/user_mobile_info_response.dart';
import 'package:mtax24/service/init.dart';

import 'base_controller.dart';

class UserController extends BaseController {
  @override
  // TODO: implement model
  LoginModel get model => GetIt.I<LoginModel>();

  final ApiServices _services;

  UserController(this._services);


  void getDeviceId() async {
    GlobalUtils.DEVICE_ID = await Utils.getDeviceId();
  }

  void authentication(AuthenticationRequest request) {
    print("++++++++++++request: ${request.toJson()}");
    execute(() => _services.authentication(request: request),
        onCompleted: (UserResponse response) {
          SharePreferUtils.savePassword(password: request.password);
          model.setUser(user: response);
    }, source: "UserController: authentication");
  }

  void userInfo() {
    execute(() => _services.userInfo(), onCompleted: (BaseResponse response) {
      model.setInfoAccount(mUser: response);
    }, source: "UserController: userInfo");
  }

  void loginFinger(BuildContext context, {@required String usernameFinger, @required String tokenId}) async {
    final canCheckBiometric = await LocalAuthentication().canCheckBiometrics;
    final isDeviceSupported = await LocalAuthentication().isDeviceSupported();
    if (canCheckBiometric && isDeviceSupported) {
      SharePreferUtils.getPassword().then((passwordFinger) {
        if (usernameFinger.isEmpty) {
          DialogAlert.showDialogAlert(context, "Vui lòng điền tên tài khoản");
        } else if(passwordFinger == null) {
          DialogAlert.showDialogAlert(context, "Vui lòng đăng nhập bằng mật khẩu và đăng ký vân tay trên thiết bị mới");
        } else {
          GetIt.I<GeneralController>().getUserMobileInfo(username: usernameFinger).then((baseResponse) {
            if(baseResponse.responseCode == StatusApi.USER_MOBILE_INFO_SUCCESS) {
              UserMobileInfoResponse userMobileInfoResponse = UserMobileInfoResponse.fromJson(baseResponse.object);
              if(userMobileInfoResponse.tin == null) {
                DialogAlert.showDialogAlert(context, "Bạn chưa đăng ký vân tay trên thiết bị mới. Xin vui lòng đăng nhập để đăng ký!");
              } else if (userMobileInfoResponse.dkvantay.toString().toUpperCase() != "Y") {
                DialogAlert.showDialogAlert(context, "Tài khoản này chưa được đăng ký sử dụng vân tay để đăng nhập. Xin vui lòng đăng nhập để đăng ký!");
              } else {
                String platform = "other";
                if (Platform.isAndroid) {
                  platform = "android";
                } else if (Platform.isIOS) {
                  platform = "ios";
                }
                Utils.getDeviceId().then((deviceId) {
                  // SharePreferUtils.getFCMToken().then((tokenId) {
                    execute(() => _services.loginFingerprint(request: LoginFingerRequest(
                        password: passwordFinger,
                        operatingSystem: platform,
                        deviceId: deviceId,
                        lang: "vi_VN",
                        passCode: "",
                        tokenId: tokenId,
                        username: usernameFinger
                    )), onCompleted: (BaseResponse response) {
                      model.clearError();
                      if(response.responseCode == StatusApi.USER_MOBILE_INFO_SUCCESS) {
                        DialogAlert.showDialogFinger(context, title: "Quét mã vân tay để đăng nhập").then((resultFingerprint) {
                          if(resultFingerprint) {
                            model.clearError();
                            authentication(AuthenticationRequest(
                              passCode: Utils.getCurrentTimeStringRequest(),
                              username: usernameFinger,
                              password: passwordFinger,
                              operatingSystem: platform,
                              tokenId: tokenId,
                              deviceId: GlobalUtils.DEVICE_ID,
                              lang: Constants.VI,
                            ));
                          }
                        });
                      } else {
                        DialogAlert.showDialogAlert(context, response.message);
                      }
                    }, source: "UserController: loginFinger");
                  // });
                });
              }
            } else {
              DialogAlert.showDialogAlertCancel(context, baseResponse.message.toString());
              model.setError(error: baseResponse.message, source: "loginFinger");
            }
          });
        }
      });
    } else {
      DialogAlert.showDialogAlert(context, "Thiết bị không hỗ trợ hoặc chưa kích hoạt tính năng bảo mật vân tay trên thiết bị");
    }
  }

}
