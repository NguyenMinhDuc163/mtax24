import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';

// ignore: avoid_classes_with_only_static_members
class Constants {
  static const String ACCESS_TOKEN = "AccessToken"; //"access_token
  static const String SERIAL_NO = "SerialNo";
  static const String LISTITEMHOMEPAGE = "LISTITEMHOMEPAGE";
  static const String EKYCLISTCREATEACCOUNT = "EKYCLISTCREATEACCOUNT";
  static const String EKYCLISTGETMONEY = "EKYCLISTGETMONEY";
  static const String USER_INFO = "userInfo"; //"access_token
  static const String USER_INFO_FINGER = "userInfoFinger";
  static const String REMEMBERPASS = "rememberPass";
  static const String USERNAME = "Username";
  static const String PASSWORD = "Password";
  static const String Avatar = "Avatar";
  static const String TOKEN = "Token";
  static const String VI = "vi_VN";
  static const String EN = "en";
  static const String emailKey = "emailKey";
  static const String THEME = 'themeApp';
  static final String PLATFORM = Platform.isAndroid ? 'android' : 'ios ';
  static final String VERSION_APP = "1.0";

  static const FEE_TYPE_0 = '0';
  static const FEE_TYPE_1 = '1';

  static const HOLDER_WITH_OWNER = '0';
  static const HOLDER_DIFIFREEN_OWNER = '1';

  static const FONT_DEFAULT = 'OpenSans-Regular';

  // Mã module
  static const MODULE_ID_HOME = 10000;
  static const MODULE_ID_GENERAL = 61999;
  static const MODULE_ID_LOGOUT = 10009;
  static const MODULE_ID_ACCOUNT = 1001;
  static const MODULE_ID_TRANFERS = 2102;
  static const MODULE_ID_SETTING = 10008;
  static const MODULE_ID_PAYMENT_BILL_AUTO = 210507;
  static const MODULE_ID_CHECK_FEE = 210502;
  static const MODULE_ID_RECHARGE_VERIFY = 210502;

  static const MODULE_ID_TRANFERS_210202 = '210202';
  static const MODULE_ID_PAYMENT_BILL_210501 = '210501';
  static const MODULE_ID_RECHARGE_210502 = '210502';
  static const MODULE_ID_TRANFERS_SERVICE_TYPE = 'TR_I';
  static const MODULE_ID_TRANFERS_SERVICE_TYPE_TR_E = 'TR_E';
  static const MODULE_ID_PAYMENT_BILL_SERVICE_TYPE = 'BP';
  static const MODULE_ID_RECHARGE = 'RG';
  static const MODULE_ID_TRANFERS_FAST_SERVICE_TYPE = 'TF';
  static const MODULE_ID_TRANFERS_210210 = '210210';

  // Tab title question
  static const QUESTION = "QUESTION";
  static const CONDITION = "CONDITION";

  // Status checkmodal
  static const DEFAULT = "DEFAULT";
  static const CAMERA = "CAMERA";
  static const LIBRARY = "LIBRARY";

  // trang thai van tay

  static const FINGERPRINT_Y = 'Y';
  static const FINGERPRINT_N = 'N';
  static const Y = 'Y';
  static const N = 'N';

  static const ACCOUNT_CA = 'CA';
  static const ACCOUNT_SA = 'SA';
  static final formatDate = DateFormat('dd/MM/yyyy');

  // start mauld
  // trạng thái thông báo
  static const NOTIFICATION_Y = 'Y';
  static const NOTIFICATION_N = 'N';

  // trạng thái thông báo nhắc nợ
  static const DEBT_NOTIFICATION_Y = 'Y';
  static const DEBT_NOTIFICATION_N = 'N';

  static const MAX_LENGTH_REMARK = 150;
  static const MAX_LENGTH_PHONE = 10;
  static const MAX_LENGTH_MONEY = 15;
  static const MAX_LENGTH_BENIFICAL = 20;

  // trạng thái tạm ngừng dịch vụ
  static const TYPE_SUSPEND_SERVICE_PERIOD = 'period';
  static const TYPE_SUSPEND_SERVICE_PERMANENT = 'permanent';
  static const TYPE_HEALTH_INSURANCE = 'HEALTH';
  static const TYPE_HEALTH_INSURANCE_SERVICE = 'HI';
  static const TYPE_CANCER_INSURANCE_SERVICE = 'CI';
  static const TYPE_BREAST_CANCER_INSURANCE_SERVICE = 'BI';
  static const TYPE_EXTENDED_ACCIDENT_INSURANCE_SERVICE = 'EI';
  static const TYPE_INSURANCE_PROMOTION_ACTIVE =
      "1"; // trạng thái khuyến mại hoạt động
  static const TYPE_INSURANCE_PROMOTION_INACTIVE =
      "0"; // trạng thái khuyến mại ngừng
  static const MODULE_HEALTH_INSURANCE_211003 = '211003';
  // end mauld

  static const APP_NAME = 'IIG VIET NAM';
  static const ALL = 'Tất cả';

  static const List<Map<String, String>> invoicePropertyList = [
    {"name": Constants.ALL, "key": ""},
    {"name": "Hóa đơn gốc", "key": "01"},
    {"name": "Hóa đơn thay thế", "key": "02"},
    {"name": "Hóa đơn đã bị thay thế", "key": "03"},
    {"name": "Hóa đơn điều chỉnh", "key": "04"},
    {"name": "Hóa đơn đã bị điều chỉnh", "key": "05"},
    {"name": "Hóa đơn đã bị xóa bỏ", "key": "06"},
    {"name": "Hóa đơn đã bị điều chỉnh định danh", "key": "09"},
  ];

  static const List<Map<String, String>> invoiceKindList = [
    {"name": Constants.ALL, "key": ""},
    {"name": "Hóa đơn giá trị gia tăng", "key": "01GTKT"},
    {"name": "Hóa đơn bán hàng", "key": "02GTTT"},
    {"name": "Hoá đơn bán hàng (dành cho tổ chức, cá nhân trong khu phi thuế quan)", "key": "07KPTQ"},
    {"name": "Phiếu xuất kho hàng gửi bán đại lý", "key": "04HGDL"},
    {"name": "Phiếu xuất kho kiêm vận chuyển nội bộ", "key": "03XKNB"},
  ];

  static const List<String> months = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
  ];

  static const List<String> periods = [
    "1", "2", "3", "4"
  ];
}
