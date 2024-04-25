import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/ky_tbao_dcdinh_danh_request.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class ThongBaoController extends BaseController {

  final ApiServices apiServices;

  ThongBaoController(this.apiServices);

  @override
  // TODO: implement model
  ThongBaoModel get model => GetIt.I<ThongBaoModel>();


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

  void traCuuThongBao(TraCuuThongBaoRequest request) {
    execute(() => apiServices.traCuuThongBao(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUTB00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getSerialInvoiceApi: ${objectConverted.toString()}');
            List<TraCuuThongBaoResponse> _listResult =
            List<TraCuuThongBaoResponse>.from(objectConverted
                .map((x) => TraCuuThongBaoResponse.fromJson(x)));
            model.setThongBao(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void chiTietThongBao(ChiTietThongBaoRequest request) {
      execute(() => apiServices.traCuuThongBaoChiTiet(request: request),
          onCompleted: (BaseResponse baseResponse) {
            if(baseResponse.responseCode == "CTTCTB00"){
              model.setChiTietThongBao(response: baseResponse);
            }else{
              model.setError(error: baseResponse.message, source: "setDMucHoaDon");
            }
          }, source: "LapHoaDonController: setDMucHoaDon");
    }

  void luuTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest request) {
    execute(() => apiServices.luuTBaoDCDinhDanh(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "LTBDCDD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            TiepTucTBaoDcDinhDanhResponse object = TiepTucTBaoDcDinhDanhResponse.fromJson(objectConverted);
            model.setLuuThongBao(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
  void tiepTucTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest request) {
    execute(() => apiServices.tiepTucTBaoDCDinhDanh(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TTTBDCDD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            TiepTucTBaoDcDinhDanhResponse object = TiepTucTBaoDcDinhDanhResponse.fromJson(objectConverted);
            model.setTiepTucThongBao(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
  void kyTBaoDCDDApi(TiepTucTBaoDcDinhDanhRequest request) {
    execute(() => apiServices.kyTBaoDCDDApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "kythanhcong"){
            model.setKyThongBao(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
  void guiTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest request) {
    execute(() => apiServices.guiTBaoDCDinhDanh(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "GTBDCDD00"){
            model.setGuiThongBao(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void lapTBaoDCDinhDanh(LapTBaoDCDinhDanhRequest request) {
    execute(() => apiServices.LapTBaoDCDinhDanh(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "CTTBDCDD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            LapTBaoDcDinhDanhResponse object = LapTBaoDcDinhDanhResponse.fromJson(objectConverted);
            model.setLapTBDCDinhDanh(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void thaoTacLapTBaoXoaBo(ThaoTacLapTBaoXoaBoRequest request) {
    execute(() => apiServices.ThaoTacLapTBaoXoaBo(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "CTTBXB00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            ThaoTacLapTBaoXoaBoResponse object = ThaoTacLapTBaoXoaBoResponse.fromJson(objectConverted);
            model.setThaoTacLapTBaoXoaBo(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void nextTBaoXoaBo(NextTBaoXoaBoRequest request) {
    execute(() => apiServices.NextTBaoXoaBo(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TTTBXB00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            ThongBaoXoaBoResponse object = ThongBaoXoaBoResponse.fromJson(objectConverted);
            model.setNextTBaoXoaBo(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
  void preLuuTBaoXoaBo(NextTBaoXoaBoRequest request) {
    execute(() => apiServices.PreLuuTBaoXoaBo(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "LTBXB00"){
            // final objectConverted = jsonDecode(baseResponse?.object);
            // ThongBaoXoaBoResponse object = ThongBaoXoaBoResponse.fromJson(objectConverted);
            model.setPreLuuTBaoXoaBo(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
  void kyTBaoApi(NextTBaoXoaBoRequest request) {
    execute(() => apiServices.KyTBaoApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "kythanhcong"){
            final objectConverted = jsonDecode(baseResponse?.object);
            ThongBaoXoaBoResponse object = ThongBaoXoaBoResponse.fromJson(objectConverted);
            model.setKyTBaoXoaBo(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void GuiTBaoXoaBo(NextTBaoXoaBoRequest request) {
      execute(() => apiServices.GuiTBaoXoaBo(request: request),
          onCompleted: (BaseResponse baseResponse) {
            if(baseResponse.responseCode == "GTBXB00"){
              // final objectConverted = jsonDecode(baseResponse?.object);
              // ThongBaoXoaBoResponse object = ThongBaoXoaBoResponse.fromJson(objectConverted);
              model.setGuiTBaoXoaBo(response: baseResponse);
            }else{
              model.setError(error: baseResponse.message, source: "GuiTBaoXoaBo");
            }
          }, source: "LapHoaDonController: GuiTBaoXoaBo");
    }


}