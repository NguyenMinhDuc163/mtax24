import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/request/invoice_report/gui_bthdl_request.dart';
import 'package:mtax24/service/init.dart';

import 'base_model.dart';

class BaoCaoTongHopHdModel extends BaseModel {


  final ValueNotifier<List<ListBthdLieu>> lstLapBTH = ValueNotifier<List<ListBthdLieu>>(null);

  final ValueNotifier<List<ListBthdLieu>> lstGuiBTHDL = ValueNotifier<List<ListBthdLieu>>(null);

  final ValueNotifier<BaseResponse> downloadLapBTH = ValueNotifier<BaseResponse>(null);



  void setLapBTH({@required List<ListBthdLieu> response}) {
    print("setThongBaoCQT: ${response.toList()}");
    this.lstLapBTH.value = response;
    clearError();
  }

  void setGuiBTH({@required List<ListBthdLieu> response}) {
    print("setGuiBTH: ${response.toList()}");
    this.lstGuiBTHDL.value = response;
    clearError();
  }


  void setDownloadLapBTH({@required BaseResponse response}) {
    print("setDownloadLapBTH: ${response.toJson()}");
    this.downloadLapBTH.value = response;
    clearError();
  }

}