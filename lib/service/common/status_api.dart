/*sv local*/
const String BASE_API_URL = "http://dc.seatechit.com.vn:8088/Api-Test/"; // test
// const String BASE_API_URL = 'http://192.168.1.229:9080/HoaDon-Mobile-Server/'; // that

const int TIME_OUT = 30000;

class StatusApi {
// Error

  static const String SERVE_RESPONSE_TEXT_ERROR500 = '500';

//* TODO module login
  static const STATUS_LOGIN_AUTHENTICATION_AUTH00 = 'AUTH00';
  static const STATUS_LOGIN_AUTHENTICATION_AUTH06 =
      'AUTH06'; //tai khoản chưa kích hoạt
  static const STATUS_LOGIN_AUTHENTICATION_AUTH07 =
      'AUTH07'; //tài khoản bị khóa do đăng nhập sai
  static const STATUS_LOGIN_AUTHENTICATION_AUTH08 =
      'AUTH08'; //tài khoản đăng nhập lần đầu
  static const STATUS_UPDATE_INFO_SUCCESS = 'CI00';

  //OTP
  static const SENT_OTP_UNCORECT = "OTP02"; //GUI OTP KHONG DUNG
  static const SENT_OTP_END_TIME = "OTP03"; //GUI OTP HET THOI GIAN;
  //Mật khẩu
  static const CHANGE_PASS_ERROR = "CPWD99"; //Loi doi mat khau

  static const CHANGE_PASS_SUCCESS = "CPWD00";
  static const WRONG_OLD_PASS = "CPWD04";

  static const RESET_PASSWORD_SUCCESS = "FP00";

  static const INVOICE_REPORT_SUCCESS = "TRACUUHD00";
  static const MONEY_KIND_SUCCESS = "GDM002";
  static const NOTIFICATION_SUCCESS = "PRL00";
  static const USER_MOBILE_INFO_SUCCESS = "USER_SUCC";
  static const REGISTER_FINGERPRINT_SUCCESS = "REGISTER_FINGER_SUCC";
  static const VERIFY_INVOICE_SUCCESS = "CTR200";
}

class TitleFunction {
  static const TITLE_REPORT_INVOICE = "Báo cáo bán hàng";
  static const TITLE_REPORT = "Báo cáo ";
  static const TITLE_CREATE_REPORT_SOLD_INVOICE = "Lập báo cáo bản kê bán ra";
  static const TITLE_REPORT_USAGE_INVOICE = "Báo cáo tình hình sử dụng hóa đơn (BC/26AC)";
  static const TITLE_REPORT_DATA_SYNTHESIS= "Báo cáo tổng hợp dữ liệu";
}

