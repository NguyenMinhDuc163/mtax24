import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/z_general_model.dart';
import 'package:mtax24/screen/components/utils/utils.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/account_information/user_mobile_info_request.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';

class GeneralController extends BaseController {

  final ApiServices apiServices;
  GeneralController(this.apiServices);

  @override
  GeneralModel get model => GetIt.I<GeneralModel>();

  void setToggleObscureInput({@required bool toggleObscureInput}) {
    model.setToggleObscureInput(toggleObscureInput: toggleObscureInput);
  }

  void setErrorText({@required String errorText}) {
    model.setErrorText(errorText: errorText);
  }

  Future getUserMobileInfo({@required String username}) async {
      String deviceId = await Utils.getDeviceId();
      BaseResponse baseResponseTmp = new BaseResponse();
      await execute(() => apiServices.getUserMobileInfo(request: UserMobileInfoRequest(
          deviceId: deviceId ?? "",
          tin: username
      )), onCompleted: (BaseResponse baseResponse) {
        baseResponseTmp = baseResponse;
        model.clearError();
      },
      source: "AccountInformationController: getUserMobileInfo");
      return baseResponseTmp;
  }
}