import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/bao_cao_tong_hop_hd_model.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/invoice_report/gui_bthdl_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/lap_bth_request.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';

class BaoCaoTongHopHDController extends BaseController {

  final ApiServices apiServices;
  BaoCaoTongHopHDController(this.apiServices);

  @override
  // TODO: implement model
  BaoCaoTongHopHdModel get model => GetIt.I<BaoCaoTongHopHdModel>();

  void lapBTH(LapBthRequest request) {
    execute(() => apiServices.lapBTH(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUBTH00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<ListBthdLieu> _listResult =
            List<ListBthdLieu>.from(objectConverted.map((x) => ListBthdLieu.fromJson(x)));
            model.setLapBTH(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "traCuuTBCQT");
          }
        }, source: "BaoCaoTongHopHDController: traCuuTBCQT");
  }


  void guiBTHDL(GuiBthdlRequest request) {
    execute(() => apiServices.guiBTHDL(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "G00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<ListBthdLieu> _listResult =
            List<ListBthdLieu>.from(objectConverted.map((x) => ListBthdLieu.fromJson(x)));
            model.setGuiBTH(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "guiBTHDL");
          }
        }, source: "BaoCaoTongHopHDController: guiBTHDL");
  }

  void viewTBThueApi(GuiBthdlRequest request) {
      execute(() => apiServices.dowloadLapBTHApi(request: request),
          onCompleted: (BaseResponse baseResponse) {
            if(baseResponse.responseCode == "00"){
              model.setDownloadLapBTH(response: baseResponse);
            }else{
              model.setError(error: baseResponse.message, source: "viewTBThueApi");
            }
          }, source: "BaoCaoTongHopHDController: viewTBThueApi");
    }


}