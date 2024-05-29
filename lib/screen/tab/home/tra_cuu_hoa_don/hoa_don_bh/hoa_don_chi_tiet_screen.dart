import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/laphoadon/hop_dong_dai_ly_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_hang_hoa/danh_sach_hang_hoa_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_hang_hoa/them_moi_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_nguoi_mua_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_van_chuyen_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao/chi_tiet_thong_bao_screen.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../../../../components/core/constants/currency_constants.dart';
import '../../../../init_view.dart';
import 'hoa_don_dieu_chinh_chi_tiet_screen.dart';


class HoaDonChiTietScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;

  HoaDonChiTietScreen({this.object});

  @override
  State<StatefulWidget> createState() => _HoaDonChiTietScreenState();
}

class _HoaDonChiTietScreenState extends State<HoaDonChiTietScreen> with GetItStateMixin{

  TextEditingController mstController = TextEditingController();
  var type = 0;
  List<Dsdvu> listHangHoa = [];
  String tenhdon = "", ngaylap = "", tenDV = "", tenNM = "" , personalID = "",
      mstnmua = '', nguoivchuyen = '', diachiNM = '', ngayKy = '',
      ngayDD= '', hopDong= '', phuongTien = '', lenh = '', nguoiDD = '';

  ObjectHopdong objectHopdong = ObjectHopdong();
  ThongTinVanChuyenModel thongTinVanChuyen = ThongTinVanChuyenModel();
  CreateCustomerApiResponse thongTinUser = CreateCustomerApiResponse();

  String tongTienDv = "0";
  String tienGTGT = "0";
  String thanhTien = "0";
  String tongTToanTang = "0";
  String tongTToanGiam = "0";
  String trangthaiHD = "";
  var controller = GetIt.I<HoaDonBanHangController>();
  var lapHdController = GetIt.I<LapHoaDonController>();
  TraCuuHoaDonResponse response;
  TraCuuHoaDonChiTietResponse chiTietResponse;

  List<DieuChinhDinhDanhResponse> lstDCDinhDanh = [];

  List<SpeedDialChild> lstSpeedDialChild = [];
  String soHDGoc = '';
  bool isCheck = false;
  bool _showAdjustErrors = true;
  bool _showReplaceInvoice = true;
  bool _showAdjust = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
        chiTietResponse = widget.object;
        print("************************* chiTietResponse: ${chiTietResponse.toJson()}");
        print("===========tinhchat: ${chiTietResponse.sohdongoc}");
        tenhdon = Utils.convertTinhChatHoaDon(chiTietResponse.tinhchat);
        ngaylap = chiTietResponse.ngaylap;
        listHangHoa = chiTietResponse.dsdvu;
        thanhTien = chiTietResponse.tongtienttoannte;
        tenNM = chiTietResponse.tennmua;
        if(chiTietResponse.adjustType == "-"){
          tongTToanGiam = chiTietResponse.tongTToanGiam.toString() == "0" ? thanhTien : chiTietResponse.tongTToanGiam.toString();
        }
        if(chiTietResponse.adjustType == "+"){
          tongTToanGiam = chiTietResponse.tongTToanTang.toString() == "0" ? thanhTien : chiTietResponse.tongTToanTang.toString();
        }
        // tongTToanTang = chiTietResponse.tongTToanTang.toString();
        // tongTToanGiam = chiTietResponse.tongTToanGiam.toString();

        switch(chiTietResponse.loaihdon){
          case "01GTKT" :
          case "02GTTT":
          case "07KPTQ":
          case "05KHAC":
            type = chiTietResponse.loaihdon == "01GTKT" ? 0 :
            chiTietResponse.loaihdon == "02GTTT" ? 1 :
            chiTietResponse.loaihdon == "07KPTQ" ? 2 : 5;
            mstController.text = chiTietResponse.mstnmua;
            tenDV = chiTietResponse.tendvinmua != null ? chiTietResponse.tendvinmua : '';
            mstnmua = chiTietResponse.mstnmua != null ? chiTietResponse.mstnmua : '';
            diachiNM = chiTietResponse.dchinmua != null ? chiTietResponse.dchinmua : '';
            break;
          case "03XKNB":
            type = 3;
            tenDV = chiTietResponse.tennmua != null ? chiTietResponse.tennmua : "";
            mstnmua = chiTietResponse.mstnmua != null ? chiTietResponse.mstnmua : "";
            ngayKy = chiTietResponse.ngayhdon != null ? chiTietResponse.ngayhdon : '';
            ngayDD = chiTietResponse.ngayDDong != null ? chiTietResponse.ngayDDong : '';
            lenh = chiTietResponse.soLenhDDong != null ? chiTietResponse.soLenhDDong : '';
            nguoiDD = chiTietResponse.nguoiDDong != null ? chiTietResponse.nguoiDDong : '';

            break;
          case "04HGDL":
            type = 4;
            hopDong = chiTietResponse.sohdong != null ? chiTietResponse.sohdong : '';
            phuongTien = chiTietResponse.ptienvchuyen != null ? chiTietResponse.ptienvchuyen : '';
            nguoivchuyen = chiTietResponse.nguoivchuyen != null ? chiTietResponse.nguoivchuyen : '';

            break;
          default:
            type = 1;
            tenDV = chiTietResponse.tendvinmua != null ? chiTietResponse.tendvinmua : '';
            mstnmua = chiTietResponse.mstnmua != null ? chiTietResponse.mstnmua : '';
            diachiNM = chiTietResponse.dchinmua != null ? chiTietResponse.dchinmua : '';
            break;
        }

        trangthaiHD = chiTietResponse.trangthai;

        WidgetsBinding.instance.addPostFrameCallback((_) => getData());

    }
  }

  List<HoaDonXoaBoResponse> lstHDXoaBo = [];
  List<TraCuuHdttResponse> lstHDThayThe = [];
  List<TraCuuHddcResponse> lstHDDieuChinh = [];



  @override
  Widget build(BuildContext context) {

    registerHandler((HoaDonBanHangModel x) => x.viewHoaDon, (context, ViewHDonResponse response, cancel) {
      if(response != null){
        ReadOpenFile(response.htmlContent, chiTietResponse.tenhdon);
      }
    });

    registerHandler((HoaDonBanHangModel x) => x.lstDCDinhDanh, (context, List<DieuChinhDinhDanhResponse> list, cancel) {
      if(list.isNotEmpty){
        setState(() {
          lstDCDinhDanh = list;
          lstSpeedDialChild.add(
            SpeedDialChild(
              child: Icon(Icons.edit),
              backgroundColor: colorPrimary,
              label: 'Thông báo thay đổi định danh',
              onTap: () {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) => ChiTietThongBaoScreen(object: lstDCDinhDanh.first, type: "TCHDDCDD",)));
              },
            ),
          );
        });

      }
    });

    registerHandler((LapHoaDonModel x) => x.checkAmountHoaDon, (context, BaseResponse response, cancel) async {
      if(response != null){
        isCheck = true;
        DialogAlert.showLoadding(context);
        if(response?.object == null) {
          DialogAlert.dissmissLoadingDialog(context, GlobalKey());
          DialogAlert.showDialogAlert(context, "Lỗi Server");
          return;
        }
        final objectConverted = jsonDecode(response?.object);
        CheckAmountHDonResponse checkAmountHDonResponse = CheckAmountHDonResponse.fromJson(objectConverted);

        bool isSavePinCode = await SharePreferUtils.getStatusPIN();
        String pinCode = await SharePreferUtils.getPIN();

        if(checkAmountHDonResponse.isHsm == "Y"){
          (!isSavePinCode) ? DialogAlert.showMDialogOTP("", context, (values) => {
            lapHdController.kyHoaDonAPI(KyHoaDonApiRequest(
                id: chiTietResponse.id,
                pincode: int.parse(values),
                chitiethoadon: getChiTietHD(),
                dchinmua: type == 0 || type == 1 || type == 2 ?  chiTietResponse.dchinmua : "",
                dthoainmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.dthoainmua : "",
                emailnmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.emailnmua : "",
                hthuctoan: type == 0 || type == 1 || type == 2 ? chiTietResponse.hthuctoan : "",
                kyhieu: chiTietResponse.khieuhdon,
                loaihdon: chiTietResponse.loaihdon,
                lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
                lstInvOtherInfoCthd: chiTietResponse.lstInvOtherInfoCthd,
                lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
                lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
                matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
                mauhdon: chiTietResponse.mauhdon,
                mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.mstnmua : "",
                ngaykyvanban: chiTietResponse.ngayvban != null ? chiTietResponse.ngayvban : "",
                serviceType: chiTietResponse.serviceType,
                tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tendvinmua :"",
                tenhdon: chiTietResponse.tenhdon,
                tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tennmua :"",
                tgia: "1",
                tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
                tinhchat: chiTietResponse.tinhchat,
                tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
                tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
                tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
                nhangnmua: "",
                tkhoannmua: "",

                lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.noiDung,
                ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayDieuDong,
                ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayKy,
                nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.dvDieuDong,
                soLenhDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.lenh,

                hDongVchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.hdSo,
                nguoivchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.name,
                ptienvchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.phuongTien,
                sohdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.hdKinhTeSo,

                tenknhap: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoNhap,
                tenkxuat: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoXuat,
                adjustType: chiTietResponse.adjustType,
                lydoDC: chiTietResponse.lyDoDChinh,
                sovban: chiTietResponse.sovban,
                cd_khieuhdon: chiTietResponse.khieuhdon,
                cd_mauhdon: chiTietResponse.mauhdon,
                cd_ngayHD: chiTietResponse.ngayhdon,
                cd_sohdon: chiTietResponse.tinhchat == "04" || chiTietResponse.tinhchat == "02" ? soHDGoc : chiTietResponse.sohdon,
                ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,
                kyDienTu: "Y",
                sohdongoc: chiTietResponse.sohdongoc
            ), )
          },) :
          lapHdController.kyHoaDonAPI(KyHoaDonApiRequest(
              id: chiTietResponse.id,
              pincode: int.parse(pinCode),
              chitiethoadon: getChiTietHD(),
              dchinmua: type == 0 || type == 1 || type == 2 ?  chiTietResponse.dchinmua : "",
              dthoainmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.dthoainmua : "",
              emailnmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.emailnmua : "",
              hthuctoan: type == 0 || type == 1 || type == 2 ? chiTietResponse.hthuctoan : "",
              kyhieu: chiTietResponse.khieuhdon,
              loaihdon: chiTietResponse.loaihdon,
              lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
              lstInvOtherInfoCthd: chiTietResponse.lstInvOtherInfoCthd,
              lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
              lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
              matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
              mauhdon: chiTietResponse.mauhdon,
              mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.mstnmua : "",
              ngaykyvanban: chiTietResponse.ngayvban != null ? chiTietResponse.ngayvban : "",
              serviceType: chiTietResponse.serviceType,
              tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tendvinmua :"",
              tenhdon: chiTietResponse.tenhdon,
              tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tennmua :"",
              tgia: "1",
              tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
              tinhchat: chiTietResponse.tinhchat,
              tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
              tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
              tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
              nhangnmua: "",
              tkhoannmua: "",

              lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.noiDung,
              ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayDieuDong,
              ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayKy,
              nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.dvDieuDong,
              soLenhDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.lenh,

              hDongVchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.hdSo,
              nguoivchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.name,
              ptienvchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.phuongTien,
              sohdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.hdKinhTeSo,

              tenknhap: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoNhap,
              tenkxuat: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoXuat,
              adjustType: chiTietResponse.adjustType,
              lydoDC: chiTietResponse.lyDoDChinh,
              sovban: chiTietResponse.sovban,
              cd_khieuhdon: chiTietResponse.khieuhdon,
              cd_mauhdon: chiTietResponse.mauhdon,
              cd_ngayHD: chiTietResponse.ngayhdon,
              cd_sohdon: chiTietResponse.tinhchat == "04" || chiTietResponse.tinhchat == "02" ? soHDGoc : chiTietResponse.sohdon,
              ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,
              kyDienTu: "Y",
              sohdongoc: chiTietResponse.sohdongoc
          ));

        }else {
          lapHdController.kyHoaDonAPI(KyHoaDonApiRequest(
              id: chiTietResponse.id,
              pincode: 111111,
              chitiethoadon: getChiTietHD(),
              dchinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .dchinmua : "",
              dthoainmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .dthoainmua : "",
              emailnmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .emailnmua : "",
              hthuctoan: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .hthuctoan : "",
              kyhieu: chiTietResponse.khieuhdon,
              loaihdon: chiTietResponse.loaihdon,
              lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
              lstInvOtherInfoCthd: chiTietResponse.lstInvOtherInfoCthd,
              lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
              lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
              matte: chiTietResponse.matte != null
                  ? chiTietResponse.matte
                  : "VND",
              mauhdon: chiTietResponse.mauhdon,
              mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .mstnmua : "",
              ngaykyvanban: chiTietResponse.ngayvban != null ? chiTietResponse
                  .ngayvban : "",
              serviceType: chiTietResponse.serviceType,
              tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .tendvinmua : "",
              tenhdon: chiTietResponse.tenhdon,
              tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                  .tennmua : "",
              tgia: "1",
              tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
              tinhchat: chiTietResponse.tinhchat,
              tongtiennte: Utils.covertToMoney(
                  double.parse(tongTienDv.replaceAll(",", "")))
                  .toString()
                  .replaceAll(",", ""),
              tongtienthuente: Utils.covertToMoney(
                  double.parse(tienGTGT.replaceAll(",", "")))
                  .toString()
                  .replaceAll(",", ""),
              tongtienttoannte: Utils.covertToMoney(
                  double.parse(thanhTien.replaceAll(",", "")))
                  .toString()
                  .replaceAll(",", ""),
              nhangnmua: "",
              tkhoannmua: "",

              lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                  .noiDung,
              ngayDDong: type == 0 || type == 1 || type == 2
                  ? ""
                  : objectHopdong.ngayDieuDong,
              ngayhdong: type == 0 || type == 1 || type == 2
                  ? ""
                  : objectHopdong.ngayKy,
              nguoiDDong: type == 0 || type == 1 || type == 2
                  ? ""
                  : objectHopdong.dvDieuDong,
              soLenhDDong: type == 0 || type == 1 || type == 2
                  ? ""
                  : objectHopdong.lenh,

              hDongVchuyen: type == 0 || type == 1 || type == 2
                  ? ""
                  : thongTinVanChuyen.hdSo,
              nguoivchuyen: type == 0 || type == 1 || type == 2
                  ? ""
                  : thongTinVanChuyen.name,
              ptienvchuyen: type == 0 || type == 1 || type == 2
                  ? ""
                  : thongTinVanChuyen.phuongTien,
              sohdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                  .hdKinhTeSo,

              tenknhap: type == 0 || type == 1 || type == 2
                  ? ""
                  : thongTinVanChuyen.khoNhap,
              tenkxuat: type == 0 || type == 1 || type == 2
                  ? ""
                  : thongTinVanChuyen.khoXuat,
              adjustType: chiTietResponse.adjustType,
              lydoDC: chiTietResponse.lyDoDChinh,
              sovban: chiTietResponse.sovban,
              cd_khieuhdon: chiTietResponse.khieuhdon,
              cd_mauhdon: chiTietResponse.mauhdon,
              cd_ngayHD: chiTietResponse.ngayhdon,
              cd_sohdon: chiTietResponse.tinhchat == "04" ||
                  chiTietResponse.tinhchat == "02" ? soHDGoc : chiTietResponse
                  .sohdon,
              ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null ||
                  chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse
                  .ngayhdon : chiTietResponse.ngayCqThdongoc,
              kyDienTu: "Y",
              sohdongoc: chiTietResponse.sohdongoc
          ));
        }
      }
    });

    registerHandler((LapHoaDonModel x) => x.kyHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        lapHdController.guiHoaDonAPI(GuiHoaDonApiRequest(
          id: response.iccinvhdr.id,
          pincode: 111111,
          chitiethoadon: getChiTietHD(),
          dchinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.dchinmua : "",
          dthoainmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.dthoainmua : "",
          emailnmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.emailnmua : "",

          // faxnmua: thongTinUser.customerFax,
          hthuctoan: type == 0 || type == 1 || type == 2 ? chiTietResponse.hthuctoan :"",
          kyhieu: chiTietResponse.khieuhdon,
          loaihdon: chiTietResponse.loaihdon,
          lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
          lstInvOtherInfoCthd: chiTietResponse.lstInvOtherInfoCthd,
          lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
          lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
          matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
          mauhdon: chiTietResponse.mauhdon,
          mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.mstnmua : "",
          ngaykyvanban: chiTietResponse.ngayvban != null ? chiTietResponse.ngayvban : "",
          serviceType: chiTietResponse.serviceType,
          tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tendvinmua : "",
          tenhdon: chiTietResponse.tenhdon,
          tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tennmua :"",
          tgia: "1",
          tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
          tinhchat: chiTietResponse.tinhchat,
          tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
          tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
          tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
          nhangnmua: "",
          tkhoannmua: "",

          lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.noiDung,
          ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayDieuDong,
          ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayKy,
          nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.dvDieuDong,
          soLenhDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.lenh,

          hDongVchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.hdSo,
          nguoivchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.name,
          ptienvchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.phuongTien,
          sohdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.hdKinhTeSo,

          tenknhap: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoNhap,
          tenkxuat: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoXuat,
          adjustType: chiTietResponse.adjustType,
          sovban: chiTietResponse.sovban,
          lydoDC: chiTietResponse.lyDoDChinh,
          cd_khieuhdon: chiTietResponse.khieuhdon,
          cd_mauhdon: chiTietResponse.mauhdon,
          cd_ngayHD: chiTietResponse.ngayhdon,
          cd_sohdon: chiTietResponse.tinhchat == "04" || chiTietResponse.tinhchat == "02" ? soHDGoc : chiTietResponse.sohdon,
          ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,

        ));
      }
    });

    registerHandler((LapHoaDonModel x) => x.guiHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      DialogAlert.dissmissLoadingDialog(context, GlobalKey());
      isCheck = false;
      DialogAlert.showDialogInfo(context, "Ký điện tử thành công \n bạn có muốn xem hóa đơn đã ký không", onSuccess: (){
        if(response != null && response.htmlContent != null){
          Navigator.of(context).pop();
          ReadOpenFile(response.htmlContent, response.iccinvhdr.id.toString());
        }else {
          Navigator.of(context).pop();
        }
      });
    });

    registerHandler((LapHoaDonModel x) => x.luuHoaDon, (context, KyHoaDonApiResponse response, cancel) {

      DialogAlert.dissmissLoadingDialog(context, GlobalKey());
      if(response != null){
        DialogAlert.showDialogInfo(context, "Lưu thành công số hóa đơn ${response.iccinvhdr.sohdon}", onSuccess: (){
          if(response.htmlContent != null && response.htmlContent != ""){
            Utils.saveAndOpenBase64ByPDF(response.htmlContent, nameFile: response.iccinvhdr.id.toString()).then((value) {
              Navigator.of(context).pop();
            });
          }else{
            Navigator.of(context).pop();
          }
        });
      }
    });

    registerHandler((HoaDonBanHangModel x) => x.guiReview, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        DialogAlert.showDialogAlertCancel(context, 'Gửi khách hàng thành công');
      }
    });

    registerHandler((HoaDonBanHangModel x) => x.error, (context, String error, cancel) {
      DialogAlert.showDialogAlertCancel(context, error.isNotEmpty ? error : "Có lỗi xảy ra");
    });

    registerHandler((LapHoaDonModel x) => x.error, (context, String error, cancel) {
      if(isCheck){
        DialogAlert.dissmissLoadingDialog(context, GlobalKey());
        isCheck = false;
      }
      // TODO loi null
      DialogAlert.showDialogAlertCancel(context, error.isNotEmpty ? error : "Có lỗi xảy ra");
    });

    final loading = watchX((HoaDonBanHangModel x) => x.loading);

    return Scaffold(
        body: Stack(
          children: [

            chiTietResponse != null
                ? AppbarScreen(title: '$tenhdon', isShowBack: true, isShowHome: true,
              trangThai: chiTietResponse.trangthai != null ? Utils.convertStatusThongBao(chiTietResponse.trangthai) : "",
              childrenAppBar: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ItemFilterTB("Ký hiệu: ", chiTietResponse.khieuhdon != null ? chiTietResponse.khieuhdon : "", textAlign: TextAlign.start),
                          ItemFilterTB("Mẫu số: ", chiTietResponse.mauhdon != null ? chiTietResponse.mauhdon : "", textAlign: TextAlign.start),
                          ItemFilterTB("Ngày lập", ngaylap != null ? ngaylap : "", textAlign: TextAlign.start),
                        ],
                      ),
                      flex: 1,
                    ),
                    SizedBox(width: 20.h,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorF4FAFF,
                            borderRadius: BorderRadius.all(Radius.circular(40.h)
                            ),
                        ),
                        padding: EdgeInsets.all(20.h),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Tổng tiền thanh toán", style: text14OBold400,),
                            Text("${thanhTien.isNotEmpty ? Utils.covertToMoney(double.parse(thanhTien)) : "0"}", style: text24Red600,),
                            Text("${chiTietResponse.matte.isNotEmpty ? chiTietResponse.matte : "VND"}", style: text14OBold400,),

                          ],
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                )
              ],
              //TODO them nguoi moi
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        type == 0 || type == 1 || type == 2 || type == 5 || type == 6 || type == 7 ?
                        InkWell(
                          onTap: ()async{
                            final resuls = await Navigator.push(
                                context, new MaterialPageRoute(builder: (context) => ThongTinNguoiMuaScreen(mst: chiTietResponse.mstnmua, thongTinUser: thongTinUser, trangThai: chiTietResponse.trangthai, flag: "INVOICE", idHD: chiTietResponse.id, chiTietResponse: chiTietResponse,)));
                            if(resuls != null){
                              setState(() {
                                thongTinUser = resuls;
                                // maKH = thongTinUser.maKH;
                                tenDV = thongTinUser.customerCompany;
                                mstnmua = thongTinUser.maKH != null && thongTinUser.maKH != "" ? thongTinUser.maKH : thongTinUser.customerTaxcode;
                                diachiNM = thongTinUser.customerAddress;
                                mstController.text = thongTinUser.maKH != null && thongTinUser.maKH != "" ? thongTinUser.maKH : thongTinUser.customerTaxcode;
                                tenNM = thongTinUser.customerName;
                                personalID = thongTinUser.personalID;
                              });
                            }

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 40.h, right: 40.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text("Thông tin khách hàng".toUpperCase(), style: text14OBold600,)),
                                    Icon(Icons.post_add_outlined)
                                  ],
                                ),
                                tenNM == null || tenNM == "" ? SizedBox() :
                                Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: Text("${tenNM}" , style: text16Bold600, textAlign: TextAlign.start),
                                ),
                                tenDV == null || tenDV == "" ? SizedBox() :
                                Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: Text("${tenDV}", style: text16Bold600, textAlign: TextAlign.start),
                                ),
                                mstnmua == null || mstnmua == "" ? SizedBox() :
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Text("Mst: ${mstnmua}", style: text14Bold400, textAlign: TextAlign.start,),
                                ),
                                diachiNM == null || diachiNM == "" ? SizedBox() :
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Text("Đc: ${diachiNM}", style: text14Bold400, textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          )
                        ) :
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {

                                final results = await Navigator.push(
                                    context, new MaterialPageRoute(builder: (context) => HopDongDaiLyScreen(object: objectHopdong, trangThai: chiTietResponse.trangthai)));
                                if(results != null){
                                  setState(() {
                                    objectHopdong = results;
                                    tenDV = objectHopdong.tcCaNhan ;
                                    mstnmua = objectHopdong.mst;
                                    lenh = objectHopdong.lenh;
                                    nguoiDD = objectHopdong.dvDieuDong;
                                    ngayKy = objectHopdong.ngayKy;
                                    ngayDD = objectHopdong.ngayDieuDong;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 40.h, right: 40.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text(type == 4 ? "Hợp đồng đại lý".toUpperCase() : "Căn cứ điều động".toUpperCase(), style: text14OBold600,)),
                                        Icon(Icons.post_add_outlined)
                                      ],
                                    ),
                                    tenDV == null || tenDV == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: Text("${tenDV}" , style: text16Bold600, textAlign: TextAlign.start),
                                    ),
                                    type == 3 ?
                                    nguoiDD == null || nguoiDD == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text(type == 3 ? "Mst: ${mstnmua}" : "Lệnh $lenh", style: text14Bold400, textAlign: TextAlign.start,),
                                    ):
                                    lenh == null || lenh == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text(type == 3 ? "Mst: ${mstnmua}" : "Lệnh $lenh", style: text14Bold400, textAlign: TextAlign.start,),
                                    ),
                                    type == 3 ?
                                    ngayKy == null || ngayKy == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text(type == 3 ? "Ngày ký: ${ngayKy}" : "Ngày ĐĐ $nguoiDD", style: text14Bold400, textAlign: TextAlign.start),
                                    ) :
                                    ngayDD == null || ngayDD == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text(type == 3 ? "Ngày ký: ${ngayKy}" : "Ngày ĐĐ $ngayDD", style: text14Bold400, textAlign: TextAlign.start),
                                    ) ,
                                  ],
                                ),
                              )
                            ),
                            InkWell(
                              onTap: () async {
                                final results = await Navigator.push(
                                    context, new MaterialPageRoute(builder: (context) => ThongTinVanChuyenScreen(object: thongTinVanChuyen, trangThai: chiTietResponse.trangthai)));
                                if(results != null){
                                  setState(() {
                                     hopDong = thongTinVanChuyen.hdSo;
                                    phuongTien = thongTinVanChuyen.phuongTien;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 40.h, right: 40.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text("Thông tin vận chuyển".toUpperCase(), style: text14OBold600,)),
                                        Icon(Icons.post_add_outlined)
                                      ],
                                    ),
                                    nguoivchuyen == null || nguoivchuyen == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: Text("$nguoivchuyen" , style: text16Bold600, textAlign: TextAlign.start),
                                    ),
                                    hopDong == null || hopDong == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text("Hợp đồng: $hopDong", style: text14Bold400, textAlign: TextAlign.start,),
                                    ),
                                    phuongTien == null || phuongTien == "" ? SizedBox() :
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Text("Phương tiện vận chuyển: $phuongTien", style: text14Bold400, textAlign: TextAlign.start),
                                    ),
                                  ],
                                ),
                              ) ,
                            ),
                          ],
                        ),
                        SizedBox(height: 16,),

                        Container(
                          padding: EdgeInsets.only(left: 40.h, right: 40.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if(chiTietResponse.trangthai == "NEWR") {
                                    final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, isTraCuu: true,)));

                                    if(result != null){
                                      setState(() {
                                        // TODO loix khi them hang hoa va them moi
                                        Dsdvu hangHoaByMaResponse = result;
                                        // print("------------------- ${hangHoaByMaResponse.toJson()} - - ${hangHoaByMaResponse.t}");
                                        listHangHoa.add(hangHoaByMaResponse);
                                        tongTienDv = (double.parse(tongTienDv) + double.parse(hangHoaByMaResponse.thanhtientruocthue)).toString();
                                        tienGTGT = (double.parse(tienGTGT) + double.parse(hangHoaByMaResponse.tienthue)).toString();
                                        thanhTien = (double.parse(thanhTien) + double.parse(hangHoaByMaResponse.tongtienthanhtoan)).toString();
                                        if(chiTietResponse.adjustType == "-"){
                                          tongTToanGiam = thanhTien;
                                        }else{
                                          tongTToanTang = thanhTien;
                                        }
                                      });
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(child: Text("Thông tin hàng hóa".toUpperCase(), style: text14OBold600,)),
                                    chiTietResponse.trangthai == "NEWR" ? Icon(Icons.control_point_outlined) : SizedBox()
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  listHangHoa != null && listHangHoa.length > 0 ?
                                  ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: listHangHoa.length > 3 ? 3 : listHangHoa.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () async {
                                              final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, hangHoaByMaResponse: listHangHoa[index], isTraCuu: true, trangThai: chiTietResponse.trangthai,)));
                                              print("=======result: $result");

                                              if(result != null){
                                                setState(() {
                                                  listHangHoa[index] = result;
                                                  print("=======listHangHoa: ${listHangHoa[index].toJson()}");
                                                  tongTienDv = 0.toString();
                                                  tienGTGT = 0.toString();
                                                  thanhTien = 0.toString();
                                                  listHangHoa.forEach((element) {
                                                    tongTienDv = (double.parse(tongTienDv) + (element.thanhtientruocthue != null && element.thanhtientruocthue != "" ? double.parse(element.thanhtientruocthue) : 0.0)).toString();
                                                    tienGTGT = (double.parse(tienGTGT) + (element.tienthue != null && element.tienthue != "" ? double.parse(element.tienthue) : 0.0)).toString();
                                                    thanhTien = (double.parse(thanhTien) + (element.tongtienthanhtoan != null && element.tongtienthanhtoan != "" ? double.parse(element.tongtienthanhtoan) : element.thanhtientruocthue != null && element.thanhtientruocthue != "" ? double.parse(element.thanhtientruocthue) : "0")).toString();
                                                    // thanhTien = (double.parse(thanhTien) + (element.tongtienthanhtoan != null && element.tongtienthanhtoan != "" ? double.parse(element.tongtienthanhtoan) : 0.0)).toString();
                                                    if(chiTietResponse.adjustType == "-"){
                                                      tongTToanGiam = thanhTien;
                                                    }else{
                                                      tongTToanTang = thanhTien;
                                                    }

                                                  });
                                                });
                                              }
                                            },
                                            onLongPress: (){
                                              if(chiTietResponse.trangthai == "NEWR") {
                                                DialogAlert.showDialogInfo(context, "Bạn có muốn xóa hàng hóa không?", onSuccess: (){
                                                  setState(() {
                                                    String money = "${listHangHoa[index].thanhtientruocthue.isNotEmpty && listHangHoa[index].thanhtientruocthue == "0.0" && listHangHoa[index].tienthue.isNotEmpty && listHangHoa[index].tienthue == "0.0" ?
                                                    Utils.covertToMoney(double.parse(listHangHoa[index].thanhtientruocthue) + double.parse(listHangHoa[index].tienthue)) :
                                                    listHangHoa[index].thanhtientruocthue.isNotEmpty && listHangHoa[index].tienthue.isEmpty ?
                                                    Utils.covertToMoney(double.parse(listHangHoa[index].thanhtientruocthue)) :
                                                    listHangHoa[index].thanhtientruocthue.isEmpty && listHangHoa[index].tienthue.isEmpty && listHangHoa[index].tongtienthanhtoan.isNotEmpty ?
                                                    Utils.covertToMoney(double.parse(listHangHoa[index].tongtienthanhtoan)) :
                                                    listHangHoa[index].tongtienthanhtoan.isNotEmpty ? listHangHoa[index].tongtienthanhtoan : "0""0"}";
                                                    thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                                    if(chiTietResponse.adjustType == "-"){
                                                      tongTToanGiam = thanhTien;
                                                    }else{
                                                      tongTToanTang = thanhTien;
                                                    }
                                                    listHangHoa.removeAt(index);
                                                    Navigator.of(context).pop();
                                                  });

                                                });
                                              }
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("${index + 1}, ${listHangHoa[index].tendvu}" , style: text_action_Bold600,),
                                                            Padding(
                                                              padding: EdgeInsets.only(top: 10.h),
                                                              child: Text("${listHangHoa[index].dongia.isEmpty ? "0" : Utils.covertToMoney(double.parse(listHangHoa[index].dongia.replaceAll(',', '')))} ${listHangHoa[index].thuesuat.isEmpty ? "" : " + ${listHangHoa[index].thuesuat.replaceAll("%", "")} %"}" ,
                                                                style: text12OpacityBold400,),
                                                            ),
                                                            Wrap(
                                                              children: [
                                                                Container(
                                                                  padding:  EdgeInsets.only(top: 5.h, bottom: 5.h),
                                                                  margin: EdgeInsets.only(top: 10.h),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(62.h),

                                                                    ),
                                                                    border: Border.all(color: color_gray),
                                                                  ),
                                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Expanded(child: Text("-", style: text14Bold600, textAlign: TextAlign.center,), flex: 1, ),
                                                                      // them phan cach dau
                                                                      Expanded(child: Text("${listHangHoa[index].soluong.isEmpty ? "0" : Utils.formatNumberText(listHangHoa[index].soluong)}", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                                                      Expanded(child: Text("+", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )


                                                    ),

                                                    // TODO tam thoi fig de format code
                                                    Row(
                                                      children: [
                                                        Text("${
                                                            Utils.covertToMoney(
                                                                double.parse(
                                                                    (listHangHoa[index].thanhtientruocthue.isNotEmpty && listHangHoa[index].thanhtientruocthue == "0.0" && listHangHoa[index].tienthue.isNotEmpty && listHangHoa[index].tienthue == "0.0" )?
                                                                    Utils.covertToMoney(double.parse(listHangHoa[index].thanhtientruocthue) + double.parse(listHangHoa[index].tienthue)).replaceAll(',', '.'):
                                                                    listHangHoa[index].thanhtientruocthue.isNotEmpty && listHangHoa[index].tienthue.isEmpty ?
                                                                    Utils.covertToMoney(double.parse(listHangHoa[index].thanhtientruocthue)).replaceAll(',', '.') :
                                                                    listHangHoa[index].thanhtientruocthue.isEmpty && listHangHoa[index].tienthue.isEmpty && listHangHoa[index].tongtienthanhtoan.isNotEmpty ?
                                                                    Utils.covertToMoney(double.parse(listHangHoa[index].tongtienthanhtoan)).replaceAll(',', '.') :
                                                                    listHangHoa[index].tongtienthanhtoan.isNotEmpty ? listHangHoa[index].tongtienthanhtoan.replaceAll(',', '.') : "0"))
                                                        }" + " ${chiTietResponse.matte.isNotEmpty ? chiTietResponse.matte : "đ"}", textAlign: TextAlign.end, style: text14Red600,),

                                                        (chiTietResponse.trangthai != "SUCC") ? Container(
                                                          margin: EdgeInsets.only(left: 30.h),
                                                          // Xoa hoa don
                                                          child: InkWell(child: Icon(Icons.delete),
                                                            onTap: (){
                                                              DialogAlert.showDialogInfo(context, "Bạn có muốn xóa hàng hóa không?", onSuccess: (){
                                                                setState(() {
                                                                  // String money = "${listHangHoa[index].thanhTien != null ? Utils.covertToMoney(listHangHoa[index].thanhTien) : 0.0}";
                                                                  // String moneyDV = "${listHangHoa[index].tongTienDV != null ? Utils.covertToMoney(listHangHoa[index].tongTienDV) : 0.0}";
                                                                  // String moneyGTGT = "${listHangHoa[index].tienGTGT != null ? Utils.covertToMoney(listHangHoa[index].tienGTGT) : 0.0}";
                                                                  //
                                                                  // thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                                                  // tongTienDv = (double.parse(tongTienDv.replaceAll(",", "")) - double.parse(moneyDV.replaceAll(",", ""))).toString();
                                                                  // tienGTGT = (double.parse(tienGTGT.replaceAll(",", "")) - double.parse(moneyGTGT.replaceAll(",", ""))).toString();

                                                                  listHangHoa.removeAt(index);
                                                                  Navigator.of(context).pop();
                                                                });

                                                              });
                                                            },
                                                          ),
                                                        ) : Container()
                                                      ],
                                                    )
                                                  ],
                                                ),

                                                listHangHoa.length - 1 == index  ? SizedBox() :
                                                Padding(
                                                  padding: EdgeInsets.only(top: 20.h,  bottom: 20.h),
                                                  child: Divider(),
                                                )
                                              ],
                                            )
                                        );
                                      }) : Container(),
                                  listHangHoa.length > 3 ?
                                  InkWell(
                                    onTap: () async {
                                      final result = await Navigator.push(
                                          context, new MaterialPageRoute(builder: (context) => DanhSachThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, listHangHoa: listHangHoa, isTraCuu: true, trangThai: chiTietResponse.trangthai,)));
                                      if(result != null){
                                        setState(() {
                                          listHangHoa = result;
                                          tongTienDv = 0.toString();
                                          tienGTGT = 0.toString();
                                          thanhTien = 0.toString();
                                          listHangHoa.forEach((element) {
                                            tongTienDv = (double.parse(tongTienDv) + double.parse(element.thanhtientruocthue)).toString();
                                            tienGTGT = (double.parse(tienGTGT) + double.parse(element.tienthue)).toString();
                                            thanhTien = (double.parse(thanhTien) + double.parse(element.tongtienthanhtoan)).toString();
                                          });
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Xem tiếp", textAlign: TextAlign.center, style: text_action_font14,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.h),
                                          child: Icon(Icons.east_outlined),
                                        )
                                        // Icon(Icons.re)
                                      ],
                                    ),
                                  ) : SizedBox(),
                                ],
                              )
                            ],
                          ),
                        ) ,
                        chiTietResponse.tinhchat == "04"?
                        Container(
                            margin: EdgeInsets.only(top: 40.h),
                            padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 40.h, bottom: 62.h),
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.all(Radius.circular(12.h)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  )
                                ]
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Text("Chênh lệnh", style: text18Bold500, textAlign: TextAlign.start,),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h,  bottom: 20.h),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Tổng tiền tăng")),
                                      Text("${tongTToanTang.isNotEmpty ? Utils.covertToMoney(double.parse(tongTToanTang)) : "0"}", style: text14Bold400,),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h,  bottom: 20.h),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Tổng tiền giảm")),
                                      Text("${tongTToanGiam.isNotEmpty ? Utils.covertToMoney(double.parse(tongTToanGiam)) : "0"}", style: text14Bold400,),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            )

                        ) : Container(),

                      ],
                    ),
                    // Content2(context, type, invoiceType, listHangHoa),


                  ],

                )
              ],
            )
                : SizedBox(),

            if(loading)
            LoadingWidget(),

          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 55.sp),
          icon: Icons.add,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: lstSpeedDialChild,
        ),
    );

  }
// todo getData

  void getData() async {

    registerHandler((HoaDonBanHangModel x) => x.lstHDXoaBo, (context, List<HoaDonXoaBoResponse> list, cancel) {
      setState(() {
        this.lstHDXoaBo = list;
        print("------------rrlstHDXoaBo" + this.lstHDXoaBo.length.toString());
      });
    });

    registerHandler((HoaDonBanHangModel x) => x.lstTraCuuHDTT, (context, List<TraCuuHdttResponse> list, cancel) {
      setState(() {
        this.lstHDThayThe = list;
        print("------------------lstHDThayThe" + this.lstHDXoaBo.length.toString());
      });
    });

    registerHandler((HoaDonBanHangModel x) => x.lstTraCuuHDDC, (context, List<TraCuuHddcResponse> list, cancel) {
      setState(() {
        this.lstHDDieuChinh = list;
        print("--------------lstHDDieuChinh" + this.lstHDXoaBo.length.toString());
      });
    });
    var date = new DateTime.now();
    await controller.hoaDonXoaBo(HoaDonXoaBoRequest(
      emailnmua: chiTietResponse.emailnmua,
      fromDate: new DateFormat('dd/MM/yyyy').format(new DateTime(date.year - 1, date.month, date.day)),
      kyhieuhdon: chiTietResponse.khieuhdon,
      loaihdon: chiTietResponse.loaihdon,
      sohdon: chiTietResponse.sohdon,
      page: 1,
      toDate: new DateFormat('dd/MM/yyyy').format(date),
      mstNguoiBan: chiTietResponse.mstnban,
      mstnmua: chiTietResponse.mstnmua,
      tinhchat: "-1",
    ));

    await controller.dieuChinhDinhDanh(DieuChinhDinhDanhRequest(
      emailnmua: chiTietResponse.emailnmua,
      fromDate: new DateFormat('dd/MM/yyyy').format(new DateTime(date.year - 1, date.month, date.day)),
      kyhieuhdon: chiTietResponse.khieuhdon,
      loaihdon: chiTietResponse.loaihdon,
      sohdon: chiTietResponse.sohdon,
      page: 1,
      toDate: new DateFormat('dd/MM/yyyy').format(date),
      mstNguoiBan: chiTietResponse.mstnban,
      mstnmua: chiTietResponse.mstnmua,
      tinhchat: chiTietResponse.tinhchat,

    ));

    await controller.traCuuHDDC(TraCuuHddcRequest(
      emailnmua: chiTietResponse.emailnmua,
      fromDate: new DateFormat('dd/MM/yyyy').format(new DateTime(date.year - 1, date.month, date.day)),
      mahdon: "",
      loaihdon: chiTietResponse.loaihdon,
      sohdon: chiTietResponse.sohdon,
      page: 1,
      toDate: new DateFormat('dd/MM/yyyy').format(date),
      mstnmua: chiTietResponse.mstnmua,
      tinhchat: "-1",
      kihieu: chiTietResponse.khieuhdon,
    ));

    await controller.traCuuHDTT(TraCuuHdttRequest(
      emailnmua: chiTietResponse.emailnmua,
      fromDate: new DateFormat('dd/MM/yyyy').format(new DateTime(date.year - 1, date.month, date.day)),
      kihieu: chiTietResponse.khieuhdon,
      loaihdon: chiTietResponse.loaihdon,
      sohdon: chiTietResponse.sohdon,
      page: 1,
      toDate: new DateFormat('dd/MM/yyyy').format(date),
      mahdon: "",
      mstnmua: chiTietResponse.mstnmua,
      tinhchat: "-1",
    ));

    addListSpeedDialChild(
        lstHDXoaBo: lstHDXoaBo,
        lstHDThayThe: lstHDThayThe,
        lstHDDieuChinh: lstHDDieuChinh
    );
    setState(() {});

  }
  // TODO addListSpeedDialChild
  void addListSpeedDialChild({
    List<HoaDonXoaBoResponse> lstHDXoaBo,
    List<TraCuuHdttResponse> lstHDThayThe,
    List<TraCuuHddcResponse> lstHDDieuChinh,
  }){

    // TODO
    lstSpeedDialChild.clear();
    if(lstHDXoaBo.isNotEmpty && _showAdjustErrors){
        lstSpeedDialChild.add(
          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: colorPrimary,
            label: 'Thông báo hóa đơn có sai sót (04/SS)',
            onTap: () {
             _showReplaceInvoice = false;
             addListSpeedDialChild(
                 lstHDXoaBo: lstHDXoaBo,
                 lstHDThayThe: lstHDThayThe,
                 lstHDDieuChinh: lstHDDieuChinh
             );
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => ChiTietThongBaoScreen(object: lstHDXoaBo.first, type: "TCHDXoBo",)));
            },
          ),
        );
    }

    if(lstHDThayThe.isNotEmpty && _showReplaceInvoice){
        lstSpeedDialChild.add(
          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: colorPrimary,
            label: 'Hóa đơn thay thế',
            onTap: () {
              // lstSpeedDialChild.clear();
                _showAdjustErrors = false;
                _showAdjust = false;
                addListSpeedDialChild(
                    lstHDXoaBo: lstHDXoaBo,
                    lstHDThayThe: lstHDThayThe,
                    lstHDDieuChinh: lstHDDieuChinh
                );
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => HoaDonDieuChinhChiTietScreen(object: lstHDThayThe, typeHD: "HDTT",)));

            },
          ),
        );
    }

    if(lstHDDieuChinh.isNotEmpty && _showAdjust){
        lstSpeedDialChild.add(
          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: colorPrimary,
            label: 'Hóa đơn điều chỉnh',
            onTap: () {
              _showReplaceInvoice = false;
              _showAdjustErrors = false;
              addListSpeedDialChild(
                  lstHDXoaBo: lstHDXoaBo,
                  lstHDThayThe: lstHDThayThe,
                  lstHDDieuChinh: lstHDDieuChinh
              );
              // _showAdjustErrors = false;
              // lstSpeedDialChild.clear();
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => HoaDonDieuChinhChiTietScreen(object: lstHDDieuChinh, typeHD: "HDDC",)));
            },
          ),
        );

    }

    if(chiTietResponse.trangthai == "NEWR"){
      lstSpeedDialChild.add(
        SpeedDialChild(
          child: Icon(Icons.edit),
          backgroundColor: colorPrimary,
          label: 'Ký hóa đơn',
          onTap: () {
            lapHdController.checkAmountHDon(
                CheckAmountHDonRequest(
                    hthuchdongoc: chiTietResponse.hthucHDonGoc,
                    tinhchat: chiTietResponse.tinhchat,
                    loaihdon: chiTietResponse.loaihdon,
                    mstnban: chiTietResponse.mstnban,
                    serviceType: chiTietResponse.serviceType,
                    tgia: "1",
                    id: chiTietResponse.id,
                    tongtienttoannte: thanhTien.replaceAll(".0", "")
                ));

          },
        ),
      );
      lstSpeedDialChild.add(

        SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: colorPrimary,
            label: 'Lưu hóa đơn',
            onTap: () {
              if (listHangHoa == null || listHangHoa.length == 0) {
                DialogAlert.showDialogAlertCancel(
                    context, "Bạn chưa chọn hàng hóa");
              }
              // else if((type == 0 || type == 1 || type == 2) && thongTinUser == null){
              //   DialogAlert.showDialogA
              //   lertCancel(context, "Bạn chưa chọn thông tin hàng hóa");
              // }
              else if ((type == 3 || type == 4 || type == 5) &&
                  objectHopdong == null) {
                DialogAlert.showDialogAlertCancel(context, type == 3
                    ? "Bạn chưa chọn hợp đồng đại lý"
                    : "Bạn chưa chọn căn cứ điều động");
              } else if ((type == 3 || type == 4 || type == 5) &&
                  thongTinVanChuyen == null) {
                DialogAlert.showDialogAlertCancel(
                    context, "Bạn chưa chọn thông tin vận chuyển");
              } else {
                isCheck = true;
                DialogAlert.showLoadding(context);

                // String matte = (thongTinUser.typeMoney != null) ? thongTinUser.typeMoney : chiTietResponse.matte ?? "VND";
                String matte = currencyMap[(thongTinUser.typeMoney != null) ? thongTinUser.typeMoney : chiTietResponse.matte ?? "VND"];
                lapHdController.luuHoaDon(LuuHoaDonRequest(
                  chitiethoadon: getChiTietHD(),
                  dchinmua: (thongTinUser.customerAddress != null) ? thongTinUser.customerAddress : chiTietResponse.dchinmua,
                  dthoainmua: (thongTinUser.customerTelephone != null) ? thongTinUser.customerTelephone : chiTietResponse.dthoainmua,
                  emailnmua:(thongTinUser.customerEmail != null) ? thongTinUser.customerEmail : chiTietResponse.emailnmua,
                  faxnmua: chiTietResponse.faxnmua,
                  relatedCustomer: thongTinUser.maKH != null ? thongTinUser.maKH : chiTietResponse.relatedCustomer,
                  cccDan: thongTinUser.personalID != null ? thongTinUser.personalID : chiTietResponse.cccDan,
                  hthuctoan: (thongTinUser.typePayment != null) ? thongTinUser.typePayment : chiTietResponse.hthuctoan,
                  kyhieu: chiTietResponse.khieuhdon,
                  loaihdon: chiTietResponse.loaihdon,
                  lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
                  // neu de binh thuong se la [[]]
                  lstInvOtherInfoCthd: (!chiTietResponse.lstInvOtherInfoCthd[0].isEmpty) ? chiTietResponse.lstInvOtherInfoCthd : [],
                  lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
                  lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
                  matte: (thongTinUser.typeMoney != null) ? thongTinUser.typeMoney : chiTietResponse.matte,
                  mauhdon: chiTietResponse.mauhdon,
                  mstNmua: (thongTinUser.customerTaxcode != null) ? thongTinUser.customerTaxcode : chiTietResponse.mstnmua,
                  ngaykyvanban: "",
                  serviceType: chiTietResponse.serviceType,
                  tendvinmua: (thongTinUser.customerCompany != null) ? thongTinUser.customerCompany : chiTietResponse.tendvinmua,
                  tenhdon: chiTietResponse.tenhdon,
                  tennmua: (thongTinUser.tenNguoiMua != null) ? thongTinUser.tenNguoiMua : chiTietResponse.tennmua,
                  tgia: "1",

                  tienbangchu: Utils.convertVietnameseNumberReader(
                      thanhTien) + " $matte",
                  tinhchat: chiTietResponse.tinhchat,
                  tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
                  tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
                  tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
                  tongtientruocthue0Nte: 0,
                  tongtientruocthue5Nte: 0,
                  tongtientruocthue10Nte: 0,
                  tongtientruocthuekchiuthuente: 0,
                  adjustType: chiTietResponse.adjustType,
                  id: chiTietResponse.id,
                  cdKhieuhdon: "",
                  cdMauhdon: "",
                  cdNgayHd: "",
                  cdSohdon: "",
                  lydoDc: "",
                  ngayCqThdongoc: "",
                  nhangnban: "",
                  nhangnmua: "",
                  sovban: "",
                  tkhoannban: "",
                  tkhoannmua: "",

                  lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.noiDung,
                  ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayDieuDong,
                  ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.ngayKy,
                  nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.dvDieuDong,
                  soLenhDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.lenh,

                  hDongVchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.hdSo,
                  nguoivchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.name,
                  ptienvchuyen: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.phuongTien,
                  sohdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong.hdKinhTeSo,

                  tenknhap: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoNhap,
                  tenkxuat: type == 0 || type == 1 || type == 2 ? "" : thongTinVanChuyen.khoXuat,
                  //
                ));
              }
            }
        ),
      );
    }
    lstSpeedDialChild.add(
      SpeedDialChild(
        child: Icon(Icons.send),
        backgroundColor: colorPrimary,
        label: 'Gửi khách hàng',
        onTap: () {
          controller.guiReview(GuiReviewHoaDonRequest(
            id: chiTietResponse.id,
            chitiethoadon: getChiTietHD(),
            dchinmua: chiTietResponse.dchinmua,
            dthoainmua: chiTietResponse.dthoainmua,
            emailnmua: chiTietResponse.emailnmua,
            faxnmua: chiTietResponse.faxnmua,
            hthuctoan: chiTietResponse.hthuctoan == "Tiền mặt" ? "TM" : "",
            kyhieu: chiTietResponse.khieuhdon,
            loaihdon: chiTietResponse.loaihdon,
            lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
            lstInvOtherInfoCthd: chiTietResponse.lstInvOtherInfoCthd,
            lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
            lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
            matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
            mauhdon: chiTietResponse.mauhdon,
            mstNmua: chiTietResponse.mstnmua,
            ngaykyvanban: "",
            serviceType: chiTietResponse.serviceType,
            tendvinmua: chiTietResponse.tendvinmua,
            tenhdon: chiTietResponse.tenhdon,
            tennmua: chiTietResponse.tennmua,
            tgia: "1",
            tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
            tinhchat: chiTietResponse.tinhchat,
            tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
            tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
            tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
            nhangnmua: "",
            tkhoannmua: "",
            tkhoannban: "",
            sovban: "",
            nhangnban: "",
            ngayCqThdongoc: "",
            cdSohdon: "",
            cdNgayHd: "",
            cdMauhdon: "",
            cdKhieuhdon: "",

          ));
        },
      ),
    );
    lstSpeedDialChild.add(
      SpeedDialChild(
          child: Icon(Icons.visibility),
          backgroundColor: colorPrimary,
          label: 'Xem chi tiết',
          onTap: () {
            controller.viewHoaDon(ViewHDonRequest(
                id: int.parse(chiTietResponse.id),
                loaiHoaDon: chiTietResponse.loaihdon,
                trangThai: chiTietResponse.trangthai,
                tinhChat: chiTietResponse.tinhchat
            ));
          }
      ),
    );

    setState(() {

    });

  }

  List<Chitiethoadon> getChiTietHD(){
    List<Chitiethoadon> listChiTietHD = [];

    listHangHoa.forEach((element) {
      listChiTietHD.add(Chitiethoadon(
        madvu: element.madvu,
        dongia: element.dongia.toString().replaceAll(".", ","),
        dvtinh: element.dvtinh,
        khuyenmai: element.khuyenmai,
        soluong: element.soluong.toString().replaceAll('.', ","),
        tendvu: element.tendvu,
        thanhtientruocthue: element.thanhtientruocthue.toString().replaceAll(".0", ""),
        thuesuat: element.thuesuat.replaceAll(" %", ""),
        tienchietkhau: element.tienchietkhau.toString(),
        tienthue: element.tienthue.toString().replaceAll(".0", ""),
        tongtienthanhtoan: element.tongtienthanhtoan.toString().replaceAll(".0", ""),

      ));
    });
    return listChiTietHD;
  }
}

