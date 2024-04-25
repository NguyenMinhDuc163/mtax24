// ignore: avoid_classes_with_only_static_members

import 'init.dart';

class GlobalUtils {

  static  String DEVICE_ID = '';
  static  int FINGER = 0xe834;
  // ignore: avoid_classes_with_only_static_members
  static  String LANGUAGE = 'vi_VN';


  // static List<AccountAll> inquirySourceAccountListChild = [];
  // static  List<ListObjectSourceAccountAll> inquirySourceAccountList = [];



  // xóa dữ liêu jkhi user thoát
  static LogOut() {
    SharePreferUtils.logOutApp();

  }


}