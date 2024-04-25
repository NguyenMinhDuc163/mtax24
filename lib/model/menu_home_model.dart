import 'package:flutter/foundation.dart';
import 'package:mtax24/service/init.dart';

import 'model.dart';

class MenuHomeModel extends BaseModel{

  final ValueNotifier<List<MenuHomeResponse>> menus = ValueNotifier<List<MenuHomeResponse>>(null);

  final ValueNotifier<UserResponse> userInfo = ValueNotifier<UserResponse>(null);

  final ValueNotifier<List<TieuDeTinTucResponse>> lstTinTuc = ValueNotifier<List<TieuDeTinTucResponse>>(null);
  final ValueNotifier<List<TieuDeTinTucResponse>> lstTinTucChung = ValueNotifier<List<TieuDeTinTucResponse>>(null);

  void setUserInfoData({@required UserResponse user}){
    print("setUserInfoData: ${user.toJson()}");
    this.userInfo.value = user;
    clearError();
  }
  void setMenu({@required List<MenuHomeResponse> menus}) {
    print("setMenus: ${menus.toList()}");
    this.menus.value = menus;
    clearError();
  }

  void setTinTuc({@required List<TieuDeTinTucResponse> response}) {
    print("setMenus: ${response.toList()}");
    this.lstTinTuc.value = response;
    clearError();
  }
  void setTieuDeTinTucChung({@required List<TieuDeTinTucResponse> response}) {
      print("setMenus: ${response.toList()}");
      this.lstTinTucChung.value = response;
      clearError();
    }

}