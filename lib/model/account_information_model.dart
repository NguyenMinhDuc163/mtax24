import 'package:flutter/cupertino.dart';
import 'package:mtax24/model/base_model.dart';
import 'package:mtax24/service/api_service/response/account_information/service_package/infor_service_package_response.dart';

class AccountInformationModel extends BaseModel {

    //email
    final ValueNotifier<List<Map<String, dynamic>>> notificationSettingList = new ValueNotifier<List<Map<String, dynamic>>>([]);

    //finger
    final ValueNotifier<bool> fingerToggle = new ValueNotifier<bool>(false);
    final ValueNotifier<TextEditingController> passwordController = new ValueNotifier<TextEditingController>(TextEditingController());
    final ValueNotifier<bool> didRegisterFingerprint = new ValueNotifier<bool>(false);

    //change password
    final ValueNotifier<TextEditingController> oldPasswordController = new ValueNotifier<TextEditingController>(TextEditingController());
    final ValueNotifier<TextEditingController> newPasswordController = new ValueNotifier<TextEditingController>(TextEditingController());
    final ValueNotifier<TextEditingController> reNewPasswordController = new ValueNotifier<TextEditingController>(TextEditingController());
    final ValueNotifier<String> errorOldPasswordController = new ValueNotifier<String>(null);
    final ValueNotifier<String> errorNewPasswordController = new ValueNotifier<String>(null);
    final ValueNotifier<String> errorReNewPasswordController = new ValueNotifier<String>(null);
    final ValueNotifier<bool> toggleOldPassword = new ValueNotifier<bool>(true);
    final ValueNotifier<bool> toggleNewPassword = new ValueNotifier<bool>(true);
    final ValueNotifier<bool> toggleReNewPassword = new ValueNotifier<bool>(true);

    //service package info
    final ValueNotifier<Map<String, String>> packageEInvoiceUsed = new ValueNotifier<Map<String, String>>({});
    final ValueNotifier<List<Tran>> packageOtherUsing = new ValueNotifier<List<Tran>>([]);

    void setNotificationSettingList({@required List<Map<String, dynamic>> notificationSettingList}) {
      this.notificationSettingList.value = notificationSettingList;
      clearError();
    }

    void setNotificationSettingToggle({@required bool notificationSettingToggle, @required int index}) {
      this.notificationSettingList.value[index]["value"] = notificationSettingToggle;
      clearError();
    }

    void setFingerToggle({@required bool fingerToggle}) {
      this.fingerToggle.value = fingerToggle;
      clearError();
    }

    void checkRegisterFingerprintYet({@required bool didRegisterFingerprint}) {
      this.didRegisterFingerprint.value = didRegisterFingerprint;
      clearError();
    }

    void setErrorOldPassword({@required String errorOldPasswordController}) {
      this.errorOldPasswordController.value = errorOldPasswordController;
      clearError();
    }

    void setErrorNewPassword({@required String errorNewPasswordController}) {
      this.errorNewPasswordController.value = errorNewPasswordController;
      clearError();
    }

    void setErrorReNewPassword({@required String errorReNewPasswordController}) {
      this.errorReNewPasswordController.value = errorReNewPasswordController;
      clearError();
    }

    void setToggleOldPassword() {
      this.toggleOldPassword.value = !this.toggleOldPassword.value;
      clearError();
    }

    void setToggleNewPassword() {
      this.toggleNewPassword.value = !this.toggleNewPassword.value;
      clearError();
    }

    void setToggleReNewPassword() {
      this.toggleReNewPassword.value = !this.toggleReNewPassword.value;
      clearError();
    }

    void resetData() {
      this.toggleOldPassword.value = true;
      this.toggleNewPassword.value = true;
      this.toggleReNewPassword.value = true;
      this.oldPasswordController.value.text = "";
      this.newPasswordController.value.text = "";
      this.reNewPasswordController.value.text = "";
      this.errorOldPasswordController.value = null;
      this.errorNewPasswordController.value = null;
      this.errorReNewPasswordController.value = null;
      clearError();
    }

    void setPackageEInvoiceUsed({@required Map<String, String> packageEInvoiceUsed}) {
      this.packageEInvoiceUsed.value = packageEInvoiceUsed;
      clearError();
    }

    void setPackageOtherUsing({@required List<Tran> packageOtherUsing}) {
      this.packageOtherUsing.value = packageOtherUsing;
      clearError();
    }
}