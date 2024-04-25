import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/tra_cuu_hoa_don/hoa_don_ban_hang_model.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/verify_invoice_request.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_hoa_don/xac_minh_hoa_don_response.dart';
import 'package:mtax24/service/common/status_api.dart';

class VerifyInvoiceController extends BaseController {

  ApiServices apiServices;

  VerifyInvoiceController(this.apiServices);

  @override
  // TODO: implement model
  HoaDonBanHangModel get model => GetIt.I<HoaDonBanHangModel>();

  void verifyInvoice(BuildContext context, {@required String qrCode}) {
    execute(() => apiServices.verifyInvoiceQR(request: VerifyInvoiceQrRequest(
      maKTra: qrCode
    )), onCompleted: (BaseResponse baseResponse) {
      if(baseResponse.responseCode == StatusApi.VERIFY_INVOICE_SUCCESS) {
        XacMinhHoaDonResponse verifyInvoiceQrResponse = XacMinhHoaDonResponse.fromJson(json.decode(baseResponse.object));
        model.setXacMinhHoaDon(response: verifyInvoiceQrResponse);
      } else {
        DialogAlert.showDialogAlert(context, baseResponse.message ?? "Lỗi hệ thống");
        model.setError(error: baseResponse.message, source: "VerifyInvoiceController: verifyInvoice");
      }
      Navigator.of(context).pop();
    }, source: "VerifyInvoiceController: verifyInvoice"
    );
  }
}