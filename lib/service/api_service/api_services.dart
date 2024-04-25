import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mtax24/service/api_service/request/account_information/change_password_request.dart';
import 'package:mtax24/service/api_service/request/account_information/service_package/detail_infor_service_package_request.dart';
import 'package:mtax24/service/api_service/request/account_information/service_package/infor_service_package_request.dart';
import 'package:mtax24/service/api_service/request/account_information/register_fingerorint_request.dart';
import 'package:mtax24/service/api_service/request/account_information/register_notification_setting_request.dart';
import 'package:mtax24/service/api_service/request/account_information/user_mobile_info_request.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/invoice_report_list_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/lap_bth_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/merchandise_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/money_kind_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/sold_report_list_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/login/login_finger_request.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/verify_invoice_request.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_request.dart';
import 'package:retrofit/retrofit.dart';
import '../init.dart';
import 'request/invoice_report/gui_bthdl_request.dart';
import 'request/tra_cuu_hoa_don/ky_tbao_dcdinh_danh_request.dart';
part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl, int connectTimeout}) = _ApiServices;
  String baseUrl;
  int connectTimeout;

  @POST("api/authentication")
  Future<UserResponse> authentication(
      {@required @Body() AuthenticationRequest request});

  @POST("api/versionapp")
  Future<BaseResponse> versionapp();

  @POST("api/userInfo")
  Future<BaseResponse> userInfo();

  @POST("api/tieudetintuc")
  Future<BaseResponse> tieudetintuc({@required @Body() TinTucRequest request});

  @POST("api/dmuchdon")
  Future<BaseResponse> dmuchdon();

  @POST("api/PreLapHoaDon")
  Future<BaseResponse> PreLapHoaDon(
      {@required @Body() PreLapHoaDonRequest request});

  @POST("api/getSerialInvoiceApi")
  Future<BaseResponse> getSerialInvoiceApi(
      {@required @Body() SerialInvoiceRequest request});

  @POST("api/getCorpInvoiceSerialApi")
  Future<BaseResponse> getCorpInvoiceSerialApi(
      {@required @Body() CorpInvoiceSerialRequest request});

  @POST("api/dmucnhangtte")
  Future<BaseResponse> dmucnhangtte(
      {@required @Body() DMucNHangTTeRequest request});

  @POST("api/CustomerInfoByUserId")
  Future<BaseResponse> CustomerInfoByUserId(
    {@required @Body() CustomerInfoByUserIdRequest request});

  @POST("api/createCustomerAPI")
  Future<BaseResponse> createCustomerAPI(
      {@required @Body() CreateCustomerApiRequest request});

  @POST("api/GetInfoCustomerByCode")
  Future<BaseResponse> getInfoCustomerByCode(
      {@required @Body() GetInfoCustomerByCodeRequest request});

  @POST("api/GetListHangHoaByMa")
  Future<BaseResponse> getListHangHoaByMa(
      {@required @Body() GetListHangHoaByMaRequest request});

  @POST("api/TraCuuHoaDon")
    Future<BaseResponse> traCuuHoaDon(
        {@required @Body() TraCuuHoaDonRequest request});

  @POST("api/XacMinhHoaDon")
    Future<BaseResponse> xacMinhHoaDon(
        {@required @Body() XacMinhHoaDonRequest request});

  @POST("api/ViewHDonAPI")
    Future<BaseResponse> viewHDonAPI(
        {@required @Body() ViewHDonRequest request});


  @POST("api/TraCuuThongBao")
    Future<BaseResponse> traCuuThongBao(
        {@required @Body() TraCuuThongBaoRequest request});

  @POST("api/TraCuuThongBaoChiTiet")
      Future<BaseResponse> traCuuThongBaoChiTiet(
          {@required @Body() ChiTietThongBaoRequest request});


  @POST("api/BaoCaoBanHang")
  Future<BaseResponse> getInvoiceReportList({@required @Body() InvoiceReportListRequest request});

  @POST("api/dmucnhangtte")
  Future<BaseResponse> getMoneyKindList({@required @Body() MoneyKindRequest request});

  @POST("api/BangKeBanRaAPI")
  Future<BaseResponse> getSoldReportList({@required @Body() SoldReportListRequest request});

  @POST("api/GetAllHangHoaByTaxCodeAPI")
  Future<BaseResponse> getMerchandiseList({@required @Body() MerchandiseRequest request});

  @POST("api/BaoCaoBC26ACAPI")
    Future<BaseResponse> getUsageReport({@required @Body() Map<String, dynamic> request});


  @POST("api/TraCuuHoaDonChiTiet")
  Future<BaseResponse> traCuuHoaDonChiTiet(
      {@required @Body() TraCuuHoaDonChiTietRequest request});

  @POST("api/HoaDonXoaBo")
    Future<BaseResponse> hoaDonXoaBo(
        {@required @Body() HoaDonXoaBoRequest request});

  @POST("api/DieuChinhDinhDanh")
  Future<BaseResponse> dieuChinhDinhDanh(
      {@required @Body() DieuChinhDinhDanhRequest request});

  @POST("api/TraCuuHDDC")
  Future<BaseResponse> traCuuHDDC(
      {@required @Body() TraCuuHddcRequest request});

  @POST("api/TraCuuHDTT")
  Future<BaseResponse> traCuuHDTT(
      {@required @Body() TraCuuHdttRequest request});

  @POST("api/GuiReviewHoaDon")
  Future<BaseResponse> guiReviewHoaDon(
      {@required @Body() GuiReviewHoaDonRequest request});

  @POST("api/notificationInit")
  Future<BaseResponse> getNotificationSettingList();

  @POST("api/userMobileInfo")
  Future<BaseResponse> getUserMobileInfo({@required @Body() UserMobileInfoRequest request});

  @POST("api/LuuHoaDon")
  Future<BaseResponse> luuHoaDon({@required @Body() LuuHoaDonRequest request});

  @POST("api/checkAmountHDon")
  Future<BaseResponse> checkAmountHDon({@required @Body() CheckAmountHDonRequest request});

  @POST("api/KyHoaDonAPI")
    Future<BaseResponse> kyHoaDonAPI({@required @Body() KyHoaDonApiRequest request});

  @POST("api/GuiHoaDonAPI")
      Future<BaseResponse> guiHoaDonAPI({@required @Body() GuiHoaDonApiRequest request});

  @POST("api/TiepTucTBaoDCDinhDanh")
      Future<BaseResponse> tiepTucTBaoDCDinhDanh({@required @Body() TiepTucTBaoDcDinhDanhRequest request});

  @POST("api/KyTBaoDCDDApi")
        Future<BaseResponse> kyTBaoDCDDApi({@required @Body() TiepTucTBaoDcDinhDanhRequest request});

  @POST("api/GuiTBaoDCDinhDanh")
          Future<BaseResponse> guiTBaoDCDinhDanh({@required @Body() TiepTucTBaoDcDinhDanhRequest request});

  @POST("api/LuuTBaoDCDinhDanh")
            Future<BaseResponse> luuTBaoDCDinhDanh({@required @Body() TiepTucTBaoDcDinhDanhRequest request});

  @POST("api/notificationCreate")
  Future<BaseResponse> registerNotificationSetting({@required @Body() RegisterNotificationSettingRequest request});

  @POST("api/inquiryUserInfo")
  Future<BaseResponse> registerFingerprint({@required @Body() RegisterFingerprintRequest request});

  @POST("api/tieudetintucchung")
    Future<BaseResponse> tieudetintucchung({@required @Body() TinTucRequest request});

  @POST("api/loginFingerprint")
  Future<BaseResponse> loginFingerprint({@required @Body() LoginFingerRequest request});

  @POST("api/changePassword")
  Future<BaseResponse> changePassword({@required @Body() ChangePasswordRequest request});

  @POST("api/infoService")
  Future<BaseResponse> getInfoServicePackage({@required @Body() InforServicePackageRequest request});

  @POST("api/infoServiceDetail")
  Future<BaseResponse> getDetailInfoServicePackage({@required @Body() DetailInforServicePackageRequest request});

  @POST("api/XacMinhHoaDon")
  Future<BaseResponse> verifyInvoiceQR({@required @Body() VerifyInvoiceQrRequest request});

  @POST("api/TraCuuThongBaoCQT")
  Future<BaseResponse> traCuuThongBaoCQT({@required @Body() TraCuuThongBaoCqtRequest request});

  @POST("api/dowloadTBThueApi")
  Future<BaseResponse> dowloadTBThueApi({@required @Body() TraCuuDetailRequest request});

  @POST("api/dmuctbaocqt")
  Future<BaseResponse> dmuctbaocqt();

  @POST("api/TraCuuBTH")
  Future<BaseResponse> traCuuBTH({@required @Body() TraCuuTongHopHDRequest request});

  @POST("api/dowloadBTHApi")
  Future<BaseResponse> dowloadBTHApi({@required @Body() TraCuuDetailRequest request});

  @POST("api/viewTBThueApi")
  Future<BaseResponse> viewTBThueApi({@required @Body() TraCuuDetailRequest request});

  @POST("api/viewBTHApi")
  Future<BaseResponse> viewBTHApi({@required @Body() TraCuuDetailRequest request});


  @POST("api/LapBTH")
  Future<BaseResponse> lapBTH({@required @Body() LapBthRequest request});

  @POST("api/GuiBTHDL")
  Future<BaseResponse> guiBTHDL({@required @Body() GuiBthdlRequest request});

  @POST("api/dowloadLapBTHApi")
  Future<BaseResponse> dowloadLapBTHApi({@required @Body() GuiBthdlRequest request});

  @POST("api/LapTBaoDCDinhDanh")
  Future<BaseResponse> LapTBaoDCDinhDanh({@required @Body() LapTBaoDCDinhDanhRequest request});

  @POST("api/ThaoTacLapTBaoXoaBo")
  Future<BaseResponse> ThaoTacLapTBaoXoaBo({@required @Body() ThaoTacLapTBaoXoaBoRequest request});

  @POST("api/NextTBaoXoaBo")
  Future<BaseResponse> NextTBaoXoaBo({@required @Body() NextTBaoXoaBoRequest request});

  @POST("api/PreLuuTBaoXoaBo")
  Future<BaseResponse> PreLuuTBaoXoaBo({@required @Body() NextTBaoXoaBoRequest request});

  @POST("api/KyTBaoApi")
  Future<BaseResponse> KyTBaoApi({@required @Body() NextTBaoXoaBoRequest request});

  @POST("api/GuiTBaoXoaBo")
  Future<BaseResponse> GuiTBaoXoaBo({@required @Body() NextTBaoXoaBoRequest request});


}
