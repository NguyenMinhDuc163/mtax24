// import 'package:flutter/cupertino.dart';
// import 'package:mtax24/model/base_model.dart';
// import 'package:mtax24/screen/init_view.dart';
// import 'package:mtax24/screen/tab/account_information/setting/change_password_setting_screen.dart';
// import 'package:mtax24/screen/tab/account_information/setting/email_setting_screen.dart';
// import 'package:mtax24/screen/tab/account_information/setting/finger_setting_screen.dart';
// import 'package:mtax24/screen/tab/account_information/setting/guide_usage_screen.dart';
// import 'package:mtax24/screen/tab/account_information/setting/service_package/information_service_package_screen.dart';
// import 'package:mtax24/screen/tab/account_information/setting/version_screen.dart';
// import 'package:mtax24/screen/tab/home/invoice_report/invoice_report_screen.dart';
// import 'package:mtax24/screen/tab/home/tab_home.dart';
// import 'package:mtax24/screen/tab/thongbao/tab_thong_bao.dart';
// import 'package:mtax24/service/common/status_api.dart';
//
// class MenuPageModel extends BaseModel {
//
//   final ValueNotifier<Widget> interface = ValueNotifier<Widget>(TabHomeScreen());
//   final ValueNotifier<String> title = ValueNotifier<String>("Trang chủ");
//   final ValueNotifier<int> page = ValueNotifier<int>(0);
//   // final ValueNotifier<bool> showHome = ValueNotifier<bool>(false);
//   // final ValueNotifier<bool> showBack = ValueNotifier<bool>(false);
//
//   void setMenuPage({@required int page}){
//     this.page.value = page;
//     switch (page) {
//       case 0:
//         this.interface.value = TabHomeScreen();
//         this.title.value = "Trang chủ";
//         // this.showHome.value = false;
//         // this.showBack.value = false;
//         break;
//
//       case 1:
//         this.interface.value = LapHoaDonScreen();
//         this.title.value = "Lập hóa đơn";
//         // this.showHome.value = false;
//         // this.showBack.value = false;
//         break;
//
//       case 2:
//         this.interface.value = TabThongBaoScreen();
//         this.title.value = "Thông báo";
//         // this.showHome.value = false;
//         // this.showBack.value = false;
//         break;
//
//       case 3:
//         this.interface.value = InformationAccountScreen();
//         this.title.value = "Tài khoản";
//         // this.showHome.value = false;
//         // this.showBack.value = false;
//         break;
//
//       case 4:
//         this.interface.value = InvoiceReportScreen();
//         this.title.value = TitleFunction.TITLE_REPORT;
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 5:
//         this.interface.value = EmailSettingScreen();
//         this.title.value = "Thiết lập kênh nhận thông báo email";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 6:
//         this.interface.value = FingerSettingScreen();
//         this.title.value = "Đăng ký vân tay";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 7:
//         this.interface.value = ChangePasswordSettingScreen();
//         this.title.value = "Đổi mật khẩu";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 8:
//         this.interface.value = VersionScreen();
//         this.title.value = "Phiên bản";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 9:
//         this.interface.value = GuideUsageScreen();
//         this.title.value = "Hướng dẫn sử dụng";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       case 10:
//         this.interface.value = InformationServicePackageScreen();
//         this.title.value = "Thông tin gói dịch vụ";
//         // this.showHome.value = true;
//         // this.showBack.value = true;
//         break;
//
//       default:
//         this.interface.value = TabHomeScreen();
//     }
//     clearError();
//   }
//
//   void setHomeInterface() {
//     this.interface.value = TabHomeScreen();
//   }
// }