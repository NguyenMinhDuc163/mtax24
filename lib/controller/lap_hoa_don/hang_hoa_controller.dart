import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class HangHoaController extends BaseController {

  final ApiServices apiServices;

  HangHoaController(this.apiServices);

  @override
  // TODO: implement model
  HangHoaModel get model => GetIt.I<HangHoaModel>();


  void getListHangHoaByMa(GetListHangHoaByMaRequest request) {
    execute(() => apiServices.getListHangHoaByMa(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "TCTBXB00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            List<GetListHangHoaByMaResponse> _listResult =
            List<GetListHangHoaByMaResponse>.from(objectConverted
                .map((x) => GetListHangHoaByMaResponse.fromJson(x)));
            model.setListHangHoaByMa(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

 
}