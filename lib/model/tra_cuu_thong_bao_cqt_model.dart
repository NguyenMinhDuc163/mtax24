import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/dmuc_thong_bao_cqt_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_response.dart';
import 'package:mtax24/service/init.dart';

import 'base_model.dart';

class TraCuuThongBaoCQTModel extends BaseModel {


  final ValueNotifier<List<TraCuuThongBaoCqtResponse>> lstThongBaoCQT = ValueNotifier<List<TraCuuThongBaoCqtResponse>>(null);

  final ValueNotifier<List<DMucThongBaoCqtResponse>> lstDMucThongBaoCQT = ValueNotifier<List<DMucThongBaoCqtResponse>>(null);
  final ValueNotifier<BaseResponse> chiTietThongBaoCQT = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<BaseResponse> viewThongBaoCQT = ValueNotifier<BaseResponse>(null);



  void setThongBaoCQT({@required List<TraCuuThongBaoCqtResponse> response}) {
    print("setThongBaoCQT: ${response.toList()}");
    this.lstThongBaoCQT.value = response;
    clearError();
  }

  void setDMucThongBaoCQT({@required List<DMucThongBaoCqtResponse> response}) {
    print("setDMucThongBaoCQT: ${response.toList()}");
    this.lstDMucThongBaoCQT.value = response;
    clearError();
  }

  void setChiTietThongBaoCQT({@required BaseResponse response}) {
    print("setChiTietThongBaoCQT: ${response.toJson()}");
    this.chiTietThongBaoCQT.value = response;
    clearError();
  }

  void setViewThongBaoCQT({@required BaseResponse response}) {
    print("setViewThongBaoCQT: ${response.toJson()}");
    this.viewThongBaoCQT.value = response;
    clearError();
  }

}