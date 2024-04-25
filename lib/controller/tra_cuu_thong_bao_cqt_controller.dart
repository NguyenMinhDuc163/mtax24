import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/tra_cuu_thong_bao_cqt_model.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_tb_cqt/tra_cuu_detail_request.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_request.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/dmuc_thong_bao_cqt_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_response.dart';

class TraCuuThongBaoCQTController extends BaseController {

  final ApiServices apiServices;
  TraCuuThongBaoCQTController(this.apiServices);

  @override
  // TODO: implement model
  TraCuuThongBaoCQTModel get model => GetIt.I<TraCuuThongBaoCQTModel>();

  void traCuuTBCQT(TraCuuThongBaoCqtRequest request) {
    execute(() => apiServices.traCuuThongBaoCQT(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TRACUUHD00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<TraCuuThongBaoCqtResponse> _listResult =
            List<TraCuuThongBaoCqtResponse>.from(objectConverted.map((x) => TraCuuThongBaoCqtResponse.fromJson(x)));
            model.setThongBaoCQT(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "traCuuTBCQT");
          }
        }, source: "TraCuuThongBaoCQTController: traCuuTBCQT");
  }

  void dMucThongBaoCQT() {
    execute(() => apiServices.dmuctbaocqt(),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "GDM001"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<DMucThongBaoCqtResponse> _listResult =
            List<DMucThongBaoCqtResponse>.from(objectConverted
                .map((x) => DMucThongBaoCqtResponse.fromJson(x)));
            model.setDMucThongBaoCQT(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "dMucThongBaoCQT");
          }
        }, source: "TraCuuThongBaoCQTController: dMucThongBaoCQT");
  }

  void dowloadTBThueApi(TraCuuDetailRequest request) {
    execute(() => apiServices.dowloadTBThueApi(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "000"){
            model.setChiTietThongBaoCQT(response: baseResponse);
          }else{
            model.setError(error: baseResponse.message, source: "detailThongBao");
          }
        }, source: "TraCuuThongBaoCQTController: detailThongBao");
  }

  void viewTBThueApi(TraCuuDetailRequest request) {
      execute(() => apiServices.viewTBThueApi(request: request),
          onCompleted: (BaseResponse baseResponse) {
            if(baseResponse.responseCode == "00"){
              model.setViewThongBaoCQT(response: baseResponse);
            }else{
              model.setError(error: baseResponse.message, source: "detailThongBao");
            }
          }, source: "TraCuuThongBaoCQTController: detailThongBao");
    }


}