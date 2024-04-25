import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/tra_cuu_tong_hop_hd_model.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tong_hop_hd/list_bang_thop_response.dart';
import 'package:mtax24/service/init.dart';

class TraCuuTongHopHDController extends BaseController {

  final ApiServices apiServices;
  TraCuuTongHopHDController(this.apiServices);

  @override
  // TODO: implement model
  TraCuuTongHopHDModel get model => GetIt.I<TraCuuTongHopHDModel>();

  void traCuuBTH(TraCuuTongHopHDRequest request) {
    execute(() => apiServices.traCuuBTH(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUHD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<TraCuuBthhdResponse> _listResult =
            List<TraCuuBthhdResponse>.from(objectConverted.map((x) => TraCuuBthhdResponse.fromJson(x)));
            model.setBangTongHopHD(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "traCuuTBCQT");
          }
        }, source: "TraCuuThongBaoCQTController: traCuuTBCQT");
  }


  void dowloadBTHApi(TraCuuDetailRequest request) {
    execute(() => apiServices.dowloadBTHApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "000"){
            model.setChiTietBangTongHopHD(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "detailThongBao");
          }
        }, source: "TraCuuThongBaoCQTController: detailThongBao");
  }

  void viewBTHApi(TraCuuDetailRequest request) {
    execute(() => apiServices.viewBTHApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            ListBangThopResponse object = ListBangThopResponse.fromJson(objectConverted);
            model.setViewBTH(response: object);
          }else{
            model.setError(error: baseResponse.message, source: "detailThongBao");
          }
        }, source: "TraCuuThongBaoCQTController: detailThongBao");
  }

}