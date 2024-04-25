import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class HangHoaModel extends BaseModel {


  final ValueNotifier<List<GetListHangHoaByMaResponse>> lstHangHoaByMa = ValueNotifier<List<GetListHangHoaByMaResponse>>(null);



  void setListHangHoaByMa({@required List<GetListHangHoaByMaResponse> response}) {
    print("setListHangHoaByMa: ${response.toList()}");
    this.lstHangHoaByMa.value = response;
    clearError();
  }

}