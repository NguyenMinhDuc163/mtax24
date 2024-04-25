import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class ThongBaoModel extends BaseModel {


  final ValueNotifier<List<DanhMucHoaDonResponse>> dMucHoaDon = ValueNotifier<List<DanhMucHoaDonResponse>>(null);

  final ValueNotifier<List<TraCuuThongBaoResponse>> lstThongBao = ValueNotifier<List<TraCuuThongBaoResponse>>(null);
  final ValueNotifier<BaseResponse> chiTietThongBao = ValueNotifier<BaseResponse>(null);

  final ValueNotifier<TiepTucTBaoDcDinhDanhResponse> luuTBaoDCDinhDanh = ValueNotifier<TiepTucTBaoDcDinhDanhResponse>(null);
  final ValueNotifier<TiepTucTBaoDcDinhDanhResponse> tiepTucTBaoDCDinhDanh = ValueNotifier<TiepTucTBaoDcDinhDanhResponse>(null);
  final ValueNotifier<BaseResponse> kyTBaoDCDDApi = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<BaseResponse> guiTBaoDCDinhDanh = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<LapTBaoDcDinhDanhResponse> lapTBDCDinhDanh = ValueNotifier<LapTBaoDcDinhDanhResponse>(null);
  final ValueNotifier<ThaoTacLapTBaoXoaBoResponse> thaoTacLapTBaoXoaBo = ValueNotifier<ThaoTacLapTBaoXoaBoResponse>(null);


  final ValueNotifier<ThongBaoXoaBoResponse> nextTBaoXoaBo = ValueNotifier<ThongBaoXoaBoResponse>(null);
  final ValueNotifier<BaseResponse> preLuuTBaoXoaBo = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<ThongBaoXoaBoResponse> kyTBaoXoaBo = ValueNotifier<ThongBaoXoaBoResponse>(null);
  final ValueNotifier<BaseResponse> guiTBaoXoaBo = ValueNotifier<BaseResponse>(null);


  void setDanhMucHoaDon({@required List<DanhMucHoaDonResponse> response}) {
    print("setDanhMucHoaDon: ${response.toList()}");
    this.dMucHoaDon.value = response;
    clearError();
  }

  void setThongBao({@required List<TraCuuThongBaoResponse> response}) {
    print("setThongBao: ${response.toList()}");
    this.lstThongBao.value = response;
    clearError();
  }

  void setChiTietThongBao({@required BaseResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.chiTietThongBao.value = response;
    clearError();
  }

  void setLuuThongBao({@required TiepTucTBaoDcDinhDanhResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.luuTBaoDCDinhDanh.value = response;
    clearError();
  }
  void setTiepTucThongBao({@required TiepTucTBaoDcDinhDanhResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.tiepTucTBaoDCDinhDanh.value = response;
    clearError();
  }
  void setKyThongBao({@required BaseResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.kyTBaoDCDDApi.value = response;
    clearError();
  }
  void setGuiThongBao({@required BaseResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.guiTBaoDCDinhDanh.value = response;
    clearError();
  }

  void setLapTBDCDinhDanh({@required LapTBaoDcDinhDanhResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.lapTBDCDinhDanh.value = response;
    clearError();
  }
  void setThaoTacLapTBaoXoaBo({@required ThaoTacLapTBaoXoaBoResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.thaoTacLapTBaoXoaBo.value = response;
    clearError();
  }

  void setNextTBaoXoaBo({@required ThongBaoXoaBoResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.nextTBaoXoaBo.value = response;
    clearError();
  }
  void setPreLuuTBaoXoaBo({@required BaseResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.preLuuTBaoXoaBo.value = response;
    clearError();
  }
  void setKyTBaoXoaBo({@required ThongBaoXoaBoResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.kyTBaoXoaBo.value = response;
    clearError();
  }

  void setGuiTBaoXoaBo({@required BaseResponse response}) {
    print("setThongBao: ${response.toJson()}");
    this.guiTBaoXoaBo.value = response;
    clearError();
  }




}