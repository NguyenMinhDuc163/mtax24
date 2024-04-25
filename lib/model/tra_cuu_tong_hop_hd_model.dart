import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tong_hop_hd/list_bang_thop_response.dart';
import 'package:mtax24/service/init.dart';

import 'base_model.dart';

class TraCuuTongHopHDModel extends BaseModel {


  final ValueNotifier<List<TraCuuBthhdResponse>> lstBangTongHopHD = ValueNotifier<List<TraCuuBthhdResponse>>(null);

  final ValueNotifier<BaseResponse> chiTietBangTongHopHD = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<ListBangThopResponse> viewBangTongHopHD = ValueNotifier<ListBangThopResponse>(null);



  void setBangTongHopHD({@required List<TraCuuBthhdResponse> response}) {
    print("setBangTongHopHD: ${response.toList()}");
    this.lstBangTongHopHD.value = response;
    clearError();
  }



  void setChiTietBangTongHopHD({@required BaseResponse response}) {
    print("setChiTietBangTongHopHD: ${response.toJson()}");
    this.chiTietBangTongHopHD.value = response;
    clearError();
  }

  void setViewBTH({@required ListBangThopResponse response}) {
    print("setViewBTH: ${response.toJson()}");
    this.viewBangTongHopHD.value = response;
    clearError();
  }

}