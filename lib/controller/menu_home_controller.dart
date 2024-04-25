import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/service/init.dart';
import 'controller.dart';

class MenuHomeController extends BaseController {
  @override
  // TODO: implement model
  MenuHomeModel get model => GetIt.I<MenuHomeModel>();

  final ApiServices _services;

  MenuHomeController(this._services);

  void getMenuHome() async {
    var menuLocal =
        jsonDecode(await rootBundle.loadString('assets/json/menu/menu.json'))
            .toList();
    List<MenuHomeResponse> menuHomes = [];
    var responses = menuLocal.map((j) => MenuHomeResponse.fromJson(j)).toList();
    responses.forEach((i){
        menuHomes.add(i);
    });
    model.setMenu(menus: menuHomes);
    getUserInfo();
  }

  void getUserInfo() {
    SharePreferUtils.getUserInfo().then((value) async {
      model.setUserInfoData(user: value);
    });
  }

  void getTinTuc(TinTucRequest request) {
    execute(() => _services.tieudetintuc(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "DMTT002"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getTinTuc: ${objectConverted.toString()}');

            List<TieuDeTinTucResponse> _listTinTuc = List<TieuDeTinTucResponse>.from(objectConverted
                .map((x) => TieuDeTinTucResponse.fromJson(x)));
            model.setTinTuc(response: _listTinTuc);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void getTieuDeTinTucChung(TinTucRequest request) {
    execute(() => _services.tieudetintucchung(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "DMTT002"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getTinTuc: ${objectConverted.toString()}');
            List<TieuDeTinTucResponse> _listTinTuc = List<TieuDeTinTucResponse>.from(objectConverted
                .map((x) => TieuDeTinTucResponse.fromJson(x)));
            model.setTieuDeTinTucChung(response: _listTinTuc);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }


}
