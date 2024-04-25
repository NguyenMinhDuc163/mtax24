import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/controller/bao_cao_tong_hop_hd_controller.dart';
import 'package:mtax24/controller/lap_hoa_don/lap_hoa_don_controller.dart';
import 'package:mtax24/controller/tra_cuu_hoa_don/verify_invoice_controller.dart';
import 'package:mtax24/controller/tra_cuu_thong_bao_cqt_controller.dart';
import 'package:mtax24/controller/tra_cuu_tong_hop_hd_controller.dart';
import 'package:mtax24/controller/z_general_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/model/bao_cao_tong_hop_hd_model.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/model/tra_cuu_thong_bao_cqt_model.dart';
import 'package:mtax24/model/tra_cuu_tong_hop_hd_model.dart';
import 'package:mtax24/model/z_general_model.dart';
import 'package:mtax24/service/init.dart';
import 'controller/controller.dart';
import 'controller/invoice_report_controller.dart';
import 'model/model.dart';


Future<void> initModel() async {
  GetIt.I.registerSingleton<LoginModel>(LoginModel());
  GetIt.I.registerSingleton<MenuHomeModel>(MenuHomeModel());
  GetIt.I.registerSingleton<VersionModel>(VersionModel());
  GetIt.I.registerSingleton<LapHoaDonModel>(LapHoaDonModel());
  GetIt.I.registerSingleton<InvoiceReportModel>(InvoiceReportModel());
  // GetIt.I.registerSingleton<MenuPageModel>(MenuPageModel());
  GetIt.I.registerSingleton<HangHoaModel>(HangHoaModel());
  GetIt.I.registerSingleton<ThongTinNguoiMuaModel>(ThongTinNguoiMuaModel());
  GetIt.I.registerSingleton<HoaDonBanHangModel>(HoaDonBanHangModel());
  GetIt.I.registerSingleton<ThongBaoModel>(ThongBaoModel());
  GetIt.I.registerSingleton<AccountInformationModel>(AccountInformationModel());
  GetIt.I.registerSingleton<GeneralModel>(GeneralModel());

  GetIt.I.registerSingleton<TraCuuThongBaoCQTModel>(TraCuuThongBaoCQTModel());
  GetIt.I.registerSingleton<TraCuuTongHopHDModel>(TraCuuTongHopHDModel());
  GetIt.I.registerSingleton<BaoCaoTongHopHdModel>(BaoCaoTongHopHdModel());

  GetIt.I.registerSingleton<HoaDonDieuChinhThayTheModel>(HoaDonDieuChinhThayTheModel());
}

Future<void> initController() async {
  GetIt.I.registerSingleton<UserController>(
      UserController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<MenuHomeController>(
      MenuHomeController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<VersionController>(
      VersionController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<LapHoaDonController>(
      LapHoaDonController(GetIt.I<ApiServices>()));

  GetIt.I.registerSingleton<InvoiceReportController>(InvoiceReportController(GetIt.I<ApiServices>()));
  // GetIt.I.registerSingleton<MenuPageController>(MenuPageController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<ThongTinNguoiMuaController>(ThongTinNguoiMuaController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<HangHoaController>(HangHoaController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<HoaDonBanHangController>(HoaDonBanHangController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<ThongBaoController>(ThongBaoController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<AccountInformationController>(AccountInformationController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<GeneralController>(GeneralController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<VerifyInvoiceController>(VerifyInvoiceController(GetIt.I<ApiServices>()));

  GetIt.I.registerSingleton<TraCuuThongBaoCQTController>(TraCuuThongBaoCQTController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<TraCuuTongHopHDController>(TraCuuTongHopHDController(GetIt.I<ApiServices>()));
  GetIt.I.registerSingleton<BaoCaoTongHopHDController>(BaoCaoTongHopHDController(GetIt.I<ApiServices>()));

  GetIt.I.registerSingleton<HoaDonDieuChinhThayTheController>(HoaDonDieuChinhThayTheController(GetIt.I<ApiServices>()));

}
