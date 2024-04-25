import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class LapHoaDonController extends BaseController {

  final ApiServices apiServices;

  LapHoaDonController(this.apiServices);

  @override
  // TODO: implement model
  LapHoaDonModel get model => GetIt.I<LapHoaDonModel>();


  void getDMucHoaDon() {
    execute(() => apiServices.dmuchdon(),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "GDM001"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<DanhMucHoaDonResponse> _listResult =
            List<DanhMucHoaDonResponse>.from(objectConverted
                .map((x) => DanhMucHoaDonResponse.fromJson(x)));
            model.setDanhMucHoaDon(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void getPreLapHoaDon(PreLapHoaDonRequest request) {
    execute(() => apiServices.PreLapHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "ICSPRE01"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getPreLapHoaDon: ${objectConverted.toString()}');
            List<CorpSerialsResponse> _listCorpSerials = List<CorpSerialsResponse>.from(objectConverted
                .map((x) => CorpSerialsResponse.fromJson(x)));
            model.setCorpSerials(response: _listCorpSerials);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void getSerialInvoiceApi(SerialInvoiceRequest request) {
    execute(() => apiServices.getSerialInvoiceApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "SI00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getSerialInvoiceApi: ${objectConverted.toString()}');
            List<SerialInvoiceResponse> _listResult =
            List<SerialInvoiceResponse>.from(objectConverted
                .map((x) => SerialInvoiceResponse.fromJson(x)));
            model.setSerialInvoice(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void luuHoaDon(LuuHoaDonRequest request) {
    print("==============request: ${request.lstInvOtherInfoCthd}");
    execute(() => apiServices.luuHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "ISHD01S"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setLuuHoaDon(response: response);

          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void checkAmountHDon(CheckAmountHDonRequest request) {
    execute(() => apiServices.checkAmountHDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "SUCC"){
            model.setCheckAmountHD(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "checkAmountHDon: setCheckAmountHD");
  }

  void kyHoaDonAPI(KyHoaDonApiRequest request) {

    execute(() => apiServices.kyHoaDonAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "kythanhcong"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setKyHoaDon(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "kyHoaDonAPI");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void guiHoaDonAPI(GuiHoaDonApiRequest request) {
    execute(() => apiServices.guiHoaDonAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "ISHD01S"){
            print("==============htmlContent: ${baseResponse.htmlContent}");
            final objectConverted = jsonDecode(baseResponse?.object);

            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setGuiHoaDon(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }



  void kyHoaDonDC_TT(KyHoaDonApiRequest request) {
    execute(() => apiServices.kyHoaDonAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "kythanhcong"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setKyHoaDon(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void guiHoaDonDC_TT(GuiHoaDonApiRequest request) {
    execute(() => apiServices.guiHoaDonAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "ISHD01S"){
            print("==============htmlContent: ${baseResponse.htmlContent}");
            final objectConverted = jsonDecode(baseResponse?.object);

            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setGuiHoaDon(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void getCorpInvoiceSerialApi(CorpInvoiceSerialRequest request) {
    execute(() => apiServices.getCorpInvoiceSerialApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "SI00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            LstCorpSerial response = LstCorpSerial.fromJson(objectConverted);
            model.setCorpSerial(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void guiReview(GuiReviewHoaDonRequest request) {
    execute(() => apiServices.guiReviewHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "RVHDS"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setSendReviewEmail(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setSendReviewEmail");
          }
        }, source: "hoaDonChiTiet: ");
  }
}