import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class HoaDonDieuChinhThayTheController extends BaseController {

  final ApiServices apiServices;

  HoaDonDieuChinhThayTheController(this.apiServices);

  @override
  // TODO: implement model
  HoaDonDieuChinhThayTheModel get model => GetIt.I<HoaDonDieuChinhThayTheModel>();

  void hoaDonChiTiet(TraCuuHoaDonChiTietRequest request) {
    execute(() => apiServices.traCuuHoaDonChiTiet(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "CTTCHD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print("hoaDonChiTiet: ${objectConverted.toString()}");
            TraCuuHoaDonChiTietResponse traCuuHoaDonChiTietResponse =  TraCuuHoaDonChiTietResponse.fromJson(objectConverted);
            model.setHoaDonChiTiet(response: traCuuHoaDonChiTietResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "hoaDonChiTiet: ");
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

  void luuHoaDon(LuuHoaDonRequest request) {
    execute(() => apiServices.luuHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "ISHD01S"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setLuuHoaDonDCTT(response: response);

          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void checkAmountHDon(CheckAmountHDonRequest request) {
    execute(() => apiServices.checkAmountHDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "SUCC"){
            model.setCheckAmountHDDCTT(response: baseResponse);
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
            model.setKyHoaDonDCTT(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
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
            model.setGuiHoaDonDCTT(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setLuuHoaDon");
          }
        }, source: "luuHoaDon: setLuuHoaDon");
  }

  void viewHoaDon(ViewHDonRequest request) {
    execute(() => apiServices.viewHDonAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUHDID00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('xacMinhHoaDon: ${objectConverted.toString()}');
            ViewHDonResponse viewHD =  ViewHDonResponse.fromJson(objectConverted);
            model.setViewHoaDon(response: viewHD);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void guiReview(GuiReviewHoaDonRequest request) {
    execute(() => apiServices.guiReviewHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "RVHDS"){
            final objectConverted = jsonDecode(baseResponse?.object);
            KyHoaDonApiResponse response = KyHoaDonApiResponse.fromJson(objectConverted);
            model.setGuiReviewDCTT(response: response);
          }else{
            model.setError(error: baseResponse.message, source: "setSendReviewEmail");
          }
        }, source: "hoaDonChiTiet: ");
  }

}