import 'package:flutter/foundation.dart';
import 'package:mtax24/service/init.dart';

import 'model.dart';

class LoginModel extends BaseModel {
  final ValueNotifier<UserResponse> user = ValueNotifier<UserResponse>(null);
  final ValueNotifier<BaseResponse> infoAccount =
      ValueNotifier<BaseResponse>(null);
  final ValueNotifier<BaseResponse> changeInfo =
      ValueNotifier<BaseResponse>(null);
  final ValueNotifier<NoDataResponse> data =
      ValueNotifier<NoDataResponse>(null);
  final ValueNotifier<BaseResponse> changePassword =
      ValueNotifier<BaseResponse>(null);
  final ValueNotifier<BaseResponse> resetPassword =
      ValueNotifier<BaseResponse>(null);


  void setUser({@required UserResponse user}) {
    print("setUser: ${user.toJson()}");
    this.user.value = user;
    clearError();
  }

  void setInfoAccount({@required BaseResponse mUser}) {
    print("setInfoAccount: ${mUser.toJson()}");
    this.infoAccount.value = mUser;
    clearError();
  }

  void setChangeInfo({@required BaseResponse mUser}) {
    print("setInfoAccount: ${mUser.toJson()}");
    this.changeInfo.value = mUser;
    clearError();
  }

  void setVersion({@required NoDataResponse version}) {
    print("setVersion: ${version.toJson()}");
    this.data.value = version;
    clearError();
  }

  void setChangePassword({@required BaseResponse changePassword}) {
    print("setChangePassword: ${changePassword.toJson()}");
    this.changePassword.value = changePassword;
    clearError();
  }

  void setResetPassword({@required BaseResponse resetPassword}) {
    print("setChangePassword: ${resetPassword.toJson()}");
    this.resetPassword.value = resetPassword;
    clearError();
  }
}
