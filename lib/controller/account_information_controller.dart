import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/controller/z_general_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/utils/utils.dart';
import 'package:mtax24/screen/tab/account_information/setting/service_package/detail_information_service_package_screen.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/account_information/change_password_request.dart';
import 'package:mtax24/service/api_service/request/account_information/service_package/detail_infor_service_package_request.dart';
import 'package:mtax24/service/api_service/request/account_information/service_package/infor_service_package_request.dart';
import 'package:mtax24/service/api_service/request/account_information/register_fingerorint_request.dart';
import 'package:mtax24/service/api_service/request/account_information/register_notification_setting_request.dart';
import 'package:mtax24/service/api_service/request/authentication_request.dart';
import 'package:mtax24/service/api_service/response/account_information/service_package/detail_infor_service_package_response.dart';
import 'package:mtax24/service/api_service/response/account_information/service_package/infor_service_package_response.dart';
import 'package:mtax24/service/api_service/response/account_information/user_mobile_info_response.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';
import 'package:mtax24/service/api_service/response/user_response.dart';
import 'package:mtax24/service/common/status_api.dart';

class AccountInformationController extends BaseController {

  final ApiServices apiServices;
  AccountInformationController(this.apiServices);

  @override
  // TODO: implement model
  AccountInformationModel get model => GetIt.I<AccountInformationModel>();

  void getNotificationSettingList(BuildContext context) {
    execute(() => apiServices.getNotificationSettingList(),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == StatusApi.NOTIFICATION_SUCCESS) {
            List<Map<String, dynamic>> notificationSettingList = [];
            dynamic responseObjectList = json.decode(baseResponse.object);
            dynamic responseNotificationSettingList = responseObjectList[1]["contains"];
            dynamic responseNotificationSettingList2 = responseObjectList[0]["contains"];
            responseNotificationSettingList2.forEach((f) {
              responseNotificationSettingList.forEach((e) {
                if(e["serviceId"] == f["serviceId"]) {
                  notificationSettingList.add({
                    "title": e["serviceName"].toString(),
                    "value": f["openEmail"].toString().toUpperCase() == "Y" ? true : false,
                    "serviceId": e["serviceId"],
                    "openIms": f["openIms"].toString().toUpperCase(),
                    "openSms": f["openSms"].toString().toUpperCase(),
                  });
                }
              });
            });
            model.setNotificationSettingList(notificationSettingList: notificationSettingList);
          } else {
            DialogAlert.showDialogAlertCancel(context, baseResponse.message.toString());
            model.setError(error: baseResponse.message, source: "getNotificationSettingList");
          }
        },
        source: "AccountInformationController: getNotificationSettingList");
  }

  void registerNotificationSetting(BuildContext context, {@required List<String> openEmail, @required List<String> openIms, @required List<String> openSms, @required List<int> serviceId}) {
    execute(() => apiServices.registerNotificationSetting(request: RegisterNotificationSettingRequest(
          limitation: [0,0,0,0,0],
          openEmail: openEmail,
          openIms: openIms,
          openSms: openSms,
          serviceId: serviceId
        )),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode != StatusApi.NOTIFICATION_SUCCESS) {
            DialogAlert.showDialogAlertCancel(context, baseResponse.message.toString());
            model.setError(error: baseResponse.message, source: "registerNotificationSetting");
          }
          model.clearError();
        },
        source: "AccountInformationController: registerNotificationSetting");
  }

  void setNotificationSettingToggle({@required bool notificationSettingToggle, @required int index}) {
    model.setNotificationSettingToggle(notificationSettingToggle: notificationSettingToggle, index: index);
  }

  void getUserMobileInfo(BuildContext context) {
    SharePreferUtils.getUserInfo().then((userInfo) {
      GetIt.I<GeneralController>().getUserMobileInfo(username: userInfo.tin).then((baseResponse) {
        if(baseResponse.responseCode == StatusApi.USER_MOBILE_INFO_SUCCESS) {
          UserMobileInfoResponse userMobileInfoResponse = UserMobileInfoResponse.fromJson(baseResponse.object);
          // check did the user registered fingerprint ?
          // kiểm tra người dùng đã đăng ký vân tay chưa ?
          model.setFingerToggle(fingerToggle: userMobileInfoResponse.dkvantay.toString().toUpperCase() == "Y" ? true : false);

          // check have the user registered fingerprint yet or this is the first time ?
          // kiểm tra người dùng đã đăng ký vân tay trước đó bao giờ chưa ?
          model.checkRegisterFingerprintYet(didRegisterFingerprint: userMobileInfoResponse.tin == null ? false : true);
        } else {
          DialogAlert.showDialogAlertCancel(context, baseResponse.message.toString());
          model.setError(error: baseResponse.message, source: "getNotificationSettingList");
        }
      });
    });
  }

  void setToggleFingerprint({@required bool fingerToggle}) {
    model.setFingerToggle(fingerToggle: fingerToggle);
  }

  void registerFingerprint(BuildContext context, {@required TextEditingController passwordController, @required bool toggleFingerprint}) async {
    if(toggleFingerprint) {
      registerFingerprintAPI(context, password: passwordController.text, toggleFingerprint: toggleFingerprint);
    } else {
      final canCheckBiometric = await LocalAuthentication().canCheckBiometrics;
      final isDeviceSupported = await LocalAuthentication().isDeviceSupported();
      if (canCheckBiometric && isDeviceSupported) {
        DialogAlert.showDialogWidthOneInput(context,
            inputController: passwordController,
            titleInput: "Nhập mật khẩu",
            isInputPassword: true,
            onFunctionAgree: () {
              SharePreferUtils.getUserInfo().then((userInfo) {
                execute(() => apiServices.authentication(request: AuthenticationRequest(
                  passCode: Utils.getCurrentTimeStringRequest(),
                  username: userInfo.tin,
                  password: Utils.generateSHA256Pwd(passwordController.text.trim()),
                  operatingSystem: Constants.PLATFORM,
                  // tokenId: token_push,
                  deviceId: GlobalUtils.DEVICE_ID,
                )), onCompleted: (UserResponse response) async {
                  if(response.responseCode == StatusApi.STATUS_LOGIN_AUTHENTICATION_AUTH00) {
                    DialogAlert.showDialogFinger(context, title: "Quét mã vân tay để xác thực đăng nhập bằng vân tay").then((resultFingerprint) {
                      if (resultFingerprint) {
                        SharePreferUtils.savePassword(password: Utils.generateSHA256Pwd(passwordController.text.trim()));
                        registerFingerprintAPI(context, password: passwordController.text, toggleFingerprint: toggleFingerprint);
                      }
                    });
                  } else {
                    GetIt.I<GeneralController>().setErrorText(errorText: "Sai mật khẩu");
                  }
                  model.clearError();
                }, source: "AccountInformationController: checkPassword");
              });
            }
        );
      } else {
        DialogAlert.showDialogAlert(context, "Thiết bị không hỗ trợ hoặc chưa kích hoạt tính năng bảo mật vân tay trên thiết bị");
      }
    }

  }

  void registerFingerprintAPI(BuildContext context,{@required String password, @required bool toggleFingerprint}) {
    String platform = "other";
    if (Platform.isAndroid) {
      platform = "android";
    } else if (Platform.isIOS) {
      platform = "ios";
    }
    Utils.getDeviceId().then((deviceId) {
      SharePreferUtils.getUserInfo().then((userInfo) {
        execute(() => apiServices.registerFingerprint(request: RegisterFingerprintRequest(
            tin: userInfo.tin,
            deviceId: deviceId,
            action: toggleFingerprint ? "UPDATE" : (model.didRegisterFingerprint.value == false ? "INSERT" : "UPDATE"),
            dkPush: toggleFingerprint ? "N" : "Y",
            dkVantay: toggleFingerprint ? "N" : "Y",
            operatingSystem: platform,
            passWord: toggleFingerprint ? "" : Utils.generateSHA256Pwd(password.trim()),
            tokenPush: ""
            )), onCompleted: (BaseResponse baseResponse) {
              if(baseResponse.responseCode == StatusApi.REGISTER_FINGERPRINT_SUCCESS) {
                model.setFingerToggle(fingerToggle: !toggleFingerprint);
                if(toggleFingerprint == false) {
                  Navigator.of(context).pop();
                }
              } else {
                DialogAlert.showDialogAlert(context, baseResponse.message.toString());
              }
            },
            source: "AccountInformationController: registerFingerprint"
        );
      });
    });
  }

  void setErrorOldPassword({@required String errorOldPasswordController}) {
    model.setErrorOldPassword(errorOldPasswordController: errorOldPasswordController);
  }

  void setErrorNewPassword({@required String errorNewPasswordController}) {
    model.setErrorNewPassword(errorNewPasswordController: errorNewPasswordController);
  }

  void setErrorReNewPassword({@required String errorReNewPasswordController}) {
    model.setErrorReNewPassword(errorReNewPasswordController: errorReNewPasswordController);
  }

  void changePassword(BuildContext context, {@required String oldPassword, @required String newPassword, @required String reNewPassword}) {
    FocusScope.of(context).unfocus();
    RegExp regExp = new RegExp(r"^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})",
      caseSensitive: false,
      multiLine: false,
    );
    model.setErrorOldPassword(errorOldPasswordController: null);
    model.setErrorNewPassword(errorNewPasswordController: null);
    model.setErrorReNewPassword(errorReNewPasswordController: null);
    if(oldPassword.isEmpty) {
      model.setErrorOldPassword(errorOldPasswordController: "Không được để trống");
    } else if (newPassword.isEmpty) {
      model.setErrorNewPassword(errorNewPasswordController: "Không được để trống");
    } else if (reNewPassword.isEmpty) {
      model.setErrorReNewPassword(errorReNewPasswordController: "Không được để trống");
    } else if (newPassword.contains(" ") ) {
      model.setErrorNewPassword(errorNewPasswordController: "Không được chứa dấu cách");
    } else if (reNewPassword.contains(" ")) {
      model.setErrorReNewPassword(errorReNewPasswordController: "Không được chứa dấu cách");
    } else if (newPassword.length < 6) {
      model.setErrorNewPassword(errorNewPasswordController: "Mật khẩu không được ít hơn 6 ký tự");
    } else if (reNewPassword.length < 6) {
      model.setErrorReNewPassword(errorReNewPasswordController: "Mật khẩu không được ít hơn 6 ký tự");
    } else if(!regExp.hasMatch(newPassword)) {
      model.setErrorNewPassword(errorNewPasswordController: "Mật khẩu không hợp lệ");
      DialogAlert.showDialogAlert(context, "Mật khẩu phải có ít nhất 1 ký tự đặc biệt, số và chữ viết hoa");
    } else if(!regExp.hasMatch(reNewPassword)) {
      model.setErrorReNewPassword(errorReNewPasswordController: "Mật khẩu không hợp lệ");
      DialogAlert.showDialogAlert(context, "Mật khẩu phải có ít nhất 1 ký tự đặc biệt, số và chữ viết hoa");
    } else if (reNewPassword != newPassword) {
      DialogAlert.showDialogAlert(context, "Mật khẩu mới chưa khớp");
      model.setErrorNewPassword(errorNewPasswordController: "Mật khẩu chưa khớp");
      model.setErrorReNewPassword(errorReNewPasswordController: "Mật khẩu chưa khớp");
    } else {
      execute(() => apiServices.changePassword(request: ChangePasswordRequest(
          password: Utils.generateSHA256Pwd(oldPassword),
          confirmPassword: newPassword,
          newPassword: reNewPassword
      )), onCompleted: (BaseResponse baseResponse) {
          DialogAlert.showDialogAlert(context, baseResponse.message ?? "Lỗi hệ thống");
          if(baseResponse.responseCode == StatusApi.CHANGE_PASS_SUCCESS) {
            resetData();
          } else if (baseResponse.responseCode == StatusApi.WRONG_OLD_PASS) {
            model.setErrorOldPassword(errorOldPasswordController: "Mật khẩu không đúng");
          }
      },
          source: "AccountInformationController: changePassword"
      );
    }
  }

  void setToggleOldPassword() {
    model.setToggleOldPassword();
  }

  void setToggleNewPassword() {
    model.setToggleNewPassword();
  }

  void setToggleReNewPassword() {
    model.setToggleReNewPassword();
  }

  void resetData() {
    model.resetData();
  }

  void getInforServicePackage(BuildContext context) {
    SharePreferUtils.getUserInfo().then((userInfo) {
      execute(() => apiServices.getInfoServicePackage(request: InforServicePackageRequest(
        mst: userInfo.tin
      )),
      onCompleted: (BaseResponse baseResponse) {
        if(baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
          InforServicePackageResponse inforServicePackageResponse = InforServicePackageResponse.fromJson(baseResponse.object);
          model.setPackageEInvoiceUsed(packageEInvoiceUsed: {
            "Mã số thuế": userInfo.tin,
            "Ngày đăng ký": inforServicePackageResponse.serviceCode.validatetime == null ? "" : Utils.convertTimestamp(inforServicePackageResponse.serviceCode.validatetime),
            "Gói sản phẩm dịch vụ": inforServicePackageResponse.serviceCode.servicecode ?? "",
            "Tên gói sản phẩm dịch vụ": inforServicePackageResponse.serviceCode.servicename ?? "",
            "Số lượng hóa đơn": inforServicePackageResponse.serviceCode.fixAmountInvoce.toString() ?? "",
            "Trạng thái": ((inforServicePackageResponse.status ?? "") == "hhieuluc" ? "Hết " : "Còn ") + "hiệu lực",
          });
          model.setPackageOtherUsing(packageOtherUsing: inforServicePackageResponse.trans);
        } else {
          DialogAlert.showDialogAlert(context, baseResponse.message ?? "Lỗi hệ thống");
          model.setError(error: baseResponse.message, source: "getInforServicePackage");
        }
      },
      source: "AccountInformationController: getInforServicePackage");
    });
  }

  void getDetailInforServicePackage(BuildContext context, {@required String customerId, @required String serviceCode}) {
    execute(() => apiServices.getDetailInfoServicePackage(request: DetailInforServicePackageRequest(
      customerid: customerId,
      servicecode: serviceCode
    )), onCompleted: (BaseResponse baseResponse) {
      if(baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
        dynamic object = json.decode(baseResponse.object);
        if(object["listPay"] == null || object["serviceCode"] == null) {
          DialogAlert.showDialogAlert(context, "Lỗi hệ thống");
        } else {
          SharePreferUtils.getUserInfo().then((userInfo) {
            Navigator.of(context).pushNamed(DetailInformationServicePackageScreen.routeName, arguments: DetailInformationServicePackageScreenArguments(DetailInforServicePackageResponse.fromMap(object), userInfo.tin));
          });
        }
      } else {
        DialogAlert.showDialogAlert(context, baseResponse.message == null || baseResponse.message.isEmpty ? "Lỗi hệ thống" : baseResponse.message);
        model.setError(error: baseResponse.message, source: "getDetailInforServicePackage");
      }
      model.clearError();
    },
      source: "AccountInformationController: getDetailInforServicePackage"
    );
  }
}