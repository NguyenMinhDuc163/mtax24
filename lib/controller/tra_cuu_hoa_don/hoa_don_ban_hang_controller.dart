import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class HoaDonBanHangController extends BaseController {

  final ApiServices apiServices;

  HoaDonBanHangController(this.apiServices);

  @override
  // TODO: implement model
  HoaDonBanHangModel get model => GetIt.I<HoaDonBanHangModel>();


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

  void traCuuHoadonBh(TraCuuHoaDonRequest request) {
    execute(() => apiServices.traCuuHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUHD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getSerialInvoiceApi: ${objectConverted.toString()}');
            List<TraCuuHoaDonResponse> _listResult =
            List<TraCuuHoaDonResponse>.from(objectConverted
                .map((x) => TraCuuHoaDonResponse.fromJson(x)));
            model.setHoaDonBanHang(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }


  void xacMinhHoaDon(XacMinhHoaDonRequest request) {
    execute(() => apiServices.xacMinhHoaDon(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "CTR200"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('xacMinhHoaDon: ${objectConverted.toString()}');
            XacMinhHoaDonResponse xacMinhHoaDonResponse =  XacMinhHoaDonResponse.fromJson(objectConverted);
            model.setXacMinhHoaDon(response: xacMinhHoaDonResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
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

  Future<void> hoaDonXoaBo(HoaDonXoaBoRequest request) async {
    await execute(() => apiServices.hoaDonXoaBo(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TCTBXB00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print("========hoaDonXoaBo: ${objectConverted.toString()}");
            List<HoaDonXoaBoResponse> _listResult =
            List<HoaDonXoaBoResponse>.from(objectConverted
                .map((x) => HoaDonXoaBoResponse.fromJson(x)));
            model.setHoaDonXoaBo(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setHoaDonXoaBo");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  Future<void> dieuChinhDinhDanh(DieuChinhDinhDanhRequest request) async {
    await execute(() => apiServices.dieuChinhDinhDanh(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TCTBDCDD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<DieuChinhDinhDanhResponse> _listResult =
            List<DieuChinhDinhDanhResponse>.from(objectConverted
                .map((x) => DieuChinhDinhDanhResponse.fromJson(x)));
            model.setDieuChinhDinhDanh(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setHoaDonXoaBo");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  Future<void> traCuuHDDC(TraCuuHddcRequest request) async {
    await execute(() => apiServices.traCuuHDDC(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "HDTT00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<TraCuuHddcResponse> _listResult =
            List<TraCuuHddcResponse>.from(objectConverted
                .map((x) => TraCuuHddcResponse.fromJson(x)));
            model.setTraCuuHddc(response: _listResult);
          } else {
            model.setError(error: baseResponse.message, source: "setTraCuuHddc");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  Future<void> traCuuHDTT(TraCuuHdttRequest request) async {
   await execute(() => apiServices.traCuuHDTT(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "HDTT00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<TraCuuHdttResponse> _listResult =
            List<TraCuuHdttResponse>.from(objectConverted
                .map((x) => TraCuuHdttResponse.fromJson(x)));
            model.setTraCuuHdtt(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setHoaDonXoaBo");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
}