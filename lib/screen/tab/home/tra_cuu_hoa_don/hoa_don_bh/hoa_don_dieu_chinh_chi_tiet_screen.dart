import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/laphoadon/hop_dong_dai_ly_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_hang_hoa/danh_sach_hang_hoa_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_hang_hoa/them_moi_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_van_chuyen_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/hoa_don_bh/tra_cuu_hoa_don_bh_screen.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../../../../components/widget/input_widget/dropdown_input.dart';
import '../../../../init_view.dart';
import '../../laphoadon/thong_tin_nguoi_nhan_screen.dart';
import 'thong_tin_tt_dc_screen.dart';


class HoaDonDieuChinhChiTietScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final List<dynamic> object;
  final String typeHD;

  HoaDonDieuChinhChiTietScreen({this.object, this.typeHD});

  @override
  State<StatefulWidget> createState() => _HoaDonChiTietScreenState();
}

class _HoaDonChiTietScreenState extends State<HoaDonDieuChinhChiTietScreen> with GetItStateMixin{
  TextEditingController mstController = TextEditingController();
  TextEditingController exchangeRateController = TextEditingController();
  var type = 0;
  List<Dsdvu> listHangHoa = [];
  List<String> lstDropTypeMoney = [];
  String tenhdon = "", ngaylap = "", tenDV = "";
  ObjectHopdong objectHopdong = ObjectHopdong();
  ThongTinVanChuyenModel thongTinVanChuyen = ThongTinVanChuyenModel();
  CreateCustomerApiResponse thongTinUser = CreateCustomerApiResponse();
  ThongTinNguoiNhanModel thongTinNguoiNhan = ThongTinNguoiNhanModel();
  String tongTienDv = "0";
  String tienGTGT = "0";
  String thanhTien = "0";
  String trangthaiHD = "";
  var controller = GetIt.I<HoaDonDieuChinhThayTheController>();
  TraCuuHoaDonChiTietResponse chiTietResponse;
  List<SpeedDialChild> lstSpeedDial = [];
  List<TraCuuHdttResponse> lstHDThayThe = [];
  List<TraCuuHddcResponse> lstHDDieuChinh = [];
  LstCorpSerial corpSerial = LstCorpSerial();
  String tinhChat = '', trangThai = '', id = '', loaiHd = '', idHD = '0', tinhChatHd_DC_TT = '';
  String adjustType = '', lyDo = '', ngaykyvanban = '', sovban = '', serial = '', templateCode = '';
  String dropTypeMoney;
  bool isKyHD = false;
  String isHsm = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null && widget.object.length > 0){

      if(widget.typeHD == "HDTT"){
        lstHDThayThe = widget.object;
        tinhChat = lstHDThayThe.first.tinhChat;
        trangThai = lstHDThayThe.first.trangthai;
        id = lstHDThayThe.first.id.toString();
        loaiHd = lstHDThayThe.first.loaihdon;
        serial = lstHDThayThe.first.khieuhdon;
        templateCode = lstHDThayThe.first.mauhdon;
        tinhChatHd_DC_TT = "02";
      }else {
        lstHDDieuChinh = widget.object;
        tinhChat = lstHDDieuChinh.first.tinhChat;
        trangThai = lstHDDieuChinh.first.status;
        id = lstHDDieuChinh.first.id.toString();
        loaiHd = lstHDDieuChinh.first.loaihdon;
        serial = lstHDDieuChinh.first.khieuhdon;
        templateCode = lstHDDieuChinh.first.mauhdon;
        tinhChatHd_DC_TT = "04";
      }
      controller.hoaDonChiTiet(TraCuuHoaDonChiTietRequest(
        tinhChat: tinhChat,
        trangThai: trangThai,
        id: id,
        loaiHoaDon: loaiHd,
      ));
      SharePreferUtils.getUserInfo().then((value) => {
        controller.getCorpInvoiceSerialApi(CorpInvoiceSerialRequest(
          invoiceType: loaiHd,
          serial: serial,
          taxCode: value.tin,
          templateCode: templateCode,
        ))
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    registerHandler((HoaDonDieuChinhThayTheModel x) => x.hoaDonChiTiet, (context, TraCuuHoaDonChiTietResponse response, cancel) {
      if(response != null){
        setState(() {
          chiTietResponse = response;
          adjustType = chiTietResponse.adjustType;
          tenDV = chiTietResponse.tendvinmua;
          tenhdon = Utils.convertTinhChatHoaDon(chiTietResponse.tinhchat);
          ngaylap = chiTietResponse.ngaylap;
          listHangHoa = chiTietResponse.dsdvu;
          thanhTien = chiTietResponse.tongtienttoannte;
          switch(chiTietResponse.loaihdon){
            case "01GTKT" :
            case "02GTTT":
            case "07KPTQ":
            case "05KHAC":
              type = chiTietResponse.loaihdon == "01GTKT" ? 0 :
                      chiTietResponse.loaihdon == "02GTTT" ? 1 :
                      chiTietResponse.loaihdon == "07KPTQ" ? 2 : 5;
              mstController.text = chiTietResponse.mstnmua;
              break;
            case "03XKNB":
              type = 3;
              break;
            case "04HGDL":
              type = 4;
              break;
            default:
              type = 1;
              break;
          }

        });
        trangthaiHD = chiTietResponse.trangthai;

        lstSpeedDial.add(
          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: colorPrimary,
            label: 'Ký hóa đơn',
            onTap: () {
              bool isCallCheckAmountHD = true;
              if(widget.typeHD == "HDDC"){
                if(lyDo == ""){
                  isCallCheckAmountHD = false;
                  DialogAlert.showDialogAlert(context, "Bạn phải nhập đầy đủ thông tin số văn bản thỏa thuân và lý do điều chỉnh ");
                }
              }
              // else if(widget.typeHD == "HDTT"){
              //   if(sovban == ""){
              //     DialogAlert.showDialogAlert(context, "Bạn chưa nhập số văn bản thỏa thuận");
              //   }else{
              //     isCallCheckAmountHD = true;
              //   }
              // }
              if(isCallCheckAmountHD) {
                print("thanhTien: $thanhTien");
                isHsm = "N";
                controller.checkAmountHDon(
                    CheckAmountHDonRequest(
                        hthuchdongoc: chiTietResponse.hthucHDonGoc,
                        tinhchat: tinhChatHd_DC_TT,
                        loaihdon: chiTietResponse.loaihdon,
                        mstnban: chiTietResponse.mstnban,
                        serviceType: widget.typeHD == "HDTT" ? "R" : widget.typeHD == "HDDC" ? "A" : chiTietResponse.serviceType,
                        tgia: "1",
                        id: idHD,
                        tongtienttoannte: thanhTien.replaceAll(".0", "")
                    ));
              }

            },
          ),
        );
        lstSpeedDial.add(
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
                //   DialogAlert.showDialogAlertCancel(context, "Bạn chưa chọn thông tin hàng hóa");
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
                  controller.luuHoaDon(LuuHoaDonRequest(

                    ngayhdon: chiTietResponse.ngayhdon,
                    chitiethoadon: getChiTietHD(),
                    dchinmua: chiTietResponse.dchinmua,
                    dthoainmua: chiTietResponse.dthoainmua,
                    emailnmua: chiTietResponse.emailnmua,
                    faxnmua: chiTietResponse.faxnmua,
                    hthuctoan: chiTietResponse.hthuctoan,
                    kyhieu: chiTietResponse.khieuhdon,
                    loaihdon: chiTietResponse.loaihdon,
                    lstInvOtherInfoBan: chiTietResponse.lstInvOtherInfoBan,
                    lstInvOtherInfoCthd: (!chiTietResponse.lstInvOtherInfoCthd[0].isEmpty) ? chiTietResponse.lstInvOtherInfoCthd : [],
                    lstInvOtherInfoMua: chiTietResponse.lstInvOtherInfoMua,
                    lstInvOtherInfoTToan: chiTietResponse.lstInvOtherInfoTToan,
                    matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
                    mauhdon: chiTietResponse.mauhdon,
                    mstNmua: chiTietResponse.mstnmua,

                    serviceType: widget.typeHD == "HDTT" ? "R" : widget.typeHD == "HDDC" ? "A" : chiTietResponse.serviceType,
                    tendvinmua: chiTietResponse.tendvinmua,
                    tenhdon: chiTietResponse.tenhdon,
                    tennmua: chiTietResponse.tennmua,
                    tgia: "1",
                    tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
                    tinhchat: tinhChatHd_DC_TT,
                    tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
                    tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
                    tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
                    tongtientruocthue0Nte: 0,
                    tongtientruocthue5Nte: 0,
                    tongtientruocthue10Nte: 0,
                    tongtientruocthuekchiuthuente: 0,

                    ngaykyvanban: ngaykyvanban,
                    adjustType: adjustType,
                    id: "0",
                    cdKhieuhdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.khieuhdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.khieuhdon : "",
                    cdMauhdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.mauhdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.mauhdon : "",
                    cdNgayHd: widget.typeHD == "HDTT" ? lstHDThayThe.first.ngayhdon != null ? Utils.convertTimestamp(lstHDThayThe.first.ngayhdon) : "" : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.ngayhdon != null ? Utils.convertTimestamp(lstHDDieuChinh.first.ngayhdon) : "" : "",
                    cdSohdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.sohdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.sohdon : "",
                    lydoDc: lyDo,
                    ngayCqThdongoc: widget.typeHD == "HDTT" ? lstHDThayThe.first.ngayhdon != null ? Utils.convertTimestamp(lstHDThayThe.first.ngayhdon) : "" : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.ngayhdon != null ? Utils.convertTimestamp(lstHDDieuChinh.first.ngayhdon) : "" : "",
                    sovban: sovban,

                    nhangnban: "",
                    nhangnmua: "",

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
                    sohdongoc: chiTietResponse.sohdon
                  ));
                }
              }
          ),
        );

        lstSpeedDial.add(
          SpeedDialChild(
            child: Icon(Icons.edit),
            backgroundColor: colorPrimary,
            label: 'Gửi khách hàng',
            onTap: () {
              // DialogAlert.showDialogAlertCancel(context, "${chiTietResponse.emailnmua}");
              controller.guiReview(GuiReviewHoaDonRequest(
                id: idHD == "0" ? chiTietResponse.id : idHD,
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
                ngaykyvanban: ngaykyvanban,
                cdKhieuhdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.khieuhdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.khieuhdon : "",
                cdMauhdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.mauhdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.mauhdon : "",
                cdNgayHd: widget.typeHD == "HDTT" ? lstHDThayThe.first.ngayhdon != null ? Utils.convertTimestamp(lstHDThayThe.first.ngayhdon) : "" : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.ngayhdon != null ? Utils.convertTimestamp(lstHDDieuChinh.first.ngayhdon) : "" : "",
                cdSohdon: widget.typeHD == "HDTT" ? lstHDThayThe.first.sohdon : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.sohdon : "",
                ngayCqThdongoc: widget.typeHD == "HDTT" ? lstHDThayThe.first.ngayhdon != null ? Utils.convertTimestamp(lstHDThayThe.first.ngayhdon) : "" : widget.typeHD == "HDDC" ? lstHDDieuChinh.first.ngayhdon != null ? Utils.convertTimestamp(lstHDDieuChinh.first.ngayhdon) : "" : "",
                sovban: sovban,

                mauhdon: chiTietResponse.mauhdon,
                mstNmua: chiTietResponse.mstnmua,
                serviceType: chiTietResponse.serviceType,
                tendvinmua: chiTietResponse.tendvinmua,
                tenhdon: chiTietResponse.tenhdon,
                tennmua: chiTietResponse.tennmua,
                tgia: "1",
                tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
                tinhchat: "01",
                tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
                tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
                tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
                nhangnmua: "",
                tkhoannmua: "",
                tkhoannban: "",
                nhangnban: "",

              ));
            },
          ),
        );
        lstSpeedDial.add(
          SpeedDialChild(
              child: Icon(Icons.visibility),
              backgroundColor: colorPrimary,
              label: 'Xem chi tiết',
              onTap: () {
                controller.viewHoaDon(ViewHDonRequest(
                    id: idHD == "0" ? int.parse(chiTietResponse.id) : int.parse(idHD),
                    loaiHoaDon: chiTietResponse.loaihdon,
                    trangThai: chiTietResponse.trangthai,
                    tinhChat: chiTietResponse.tinhchat
                ));
              }
          ),
        );

      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.corpSerial, (context, LstCorpSerial response, cancel) {
      if(response != null){
        corpSerial = response;
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.viewHoaDon, (context, ViewHDonResponse response, cancel) {
      if(response != null){
        ReadOpenFile(response.htmlContent, chiTietResponse.tenhdon);
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.checkAmountHoaDon, (context, BaseResponse response, cancel) async {
      if(response != null){
        if(corpSerial.isHsm == "Y"){
          isHsm = "Y";
          bool isSavePinCode = await SharePreferUtils.getStatusPIN();
          String pinCode = await SharePreferUtils.getPIN();
          DialogAlert.showMDialogOTP("", context, (values) =>  kiHoaDon(values), pinCode: pinCode,
              flag: (isSavePinCode == true) ? 'Y': "N");
        }else {
          isKyHD = true;
          DialogAlert.showLoadding(context);
          controller.kyHoaDonAPI(KyHoaDonApiRequest(
              check_savepass: "Y",
            id: idHD,
            ngaykyvanban: ngaykyvanban,
            sovban: sovban,
            cd_khieuhdon: chiTietResponse.khieuhdon,
            cd_mauhdon: chiTietResponse.mauhdon,
            cd_ngayHD: chiTietResponse.ngayhdon,
            cd_sohdon: chiTietResponse.sohdon,
            ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,
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
            matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
            mauhdon: chiTietResponse.mauhdon,
            mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                .mstnmua : "",
            serviceType: widget.typeHD == "HDTT" ? "R" : widget.typeHD == "HDDC" ? "A" : chiTietResponse.serviceType,
            tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                .tendvinmua : "",
            tenhdon: chiTietResponse.tenhdon,
            tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
                .tennmua : "",
            tgia: "1",
            tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
            tinhchat: tinhChatHd_DC_TT,
            tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
            tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
            tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
            nhangnmua: "",
            tkhoannmua: "",
            lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                .noiDung,
            ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                .ngayDieuDong,
            ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                .ngayKy,
            nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
                .dvDieuDong,
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
            adjustType: adjustType,
            lydoDC: lyDo,
            kyDienTu: "Y",
            sohdongoc: chiTietResponse.sohdon
          ));
        }
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.kyHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        if(isHsm == "Y") {
          isKyHD = true;
          DialogAlert.showLoadding(context);
        }
        controller.guiHoaDonAPI(GuiHoaDonApiRequest(
          id: response.iccinvhdr.id,
          pincode: 111111,
          sovban: sovban,
          cd_khieuhdon: chiTietResponse.khieuhdon,
          cd_mauhdon: chiTietResponse.mauhdon,
          cd_ngayHD: chiTietResponse.ngayhdon,
          cd_sohdon: chiTietResponse.sohdon,
          ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,
          ngaykyvanban: ngaykyvanban,
          adjustType: adjustType,
          lydoDC: lyDo,
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
          serviceType: widget.typeHD == "HDTT" ? "R" : widget.typeHD == "HDDC" ? "A" : chiTietResponse.serviceType,
          tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tendvinmua : "",
          tenhdon: chiTietResponse.tenhdon,
          tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse.tennmua :"",
          tgia: "1",
          tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
          tinhchat: tinhChatHd_DC_TT,
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

        ));
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.guiHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      if(isKyHD) {
        DialogAlert.dissmissLoadingDialog(context, GlobalKey());
      }
      isKyHD = false;
      if(response != null && response.htmlContent != null){
        DialogAlert.showDialogInfo(context, "Ký điện tử thành công \n bạn có muốn xem hóa đơn đã ký không", onSuccess: (){
          ReadOpenFile(response.htmlContent, response.iccinvhdr.id.toString());
          Navigator.of(context).pop();
        });
      }else {
        Navigator.of(context).pop();
        DialogAlert.showDialogAlertCancel(context, "Ký điện tử thành công");
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.luuHoaDon, (context, KyHoaDonApiResponse response, cancel) async {
      if(response != null){
        idHD = response.iccinvhdr.id.toString();
        DialogAlert.showDialogInfo(context, "Lưu thành công số hóa đơn ${response.iccinvhdr.sohdon}", onSuccess: (){
          if(response.htmlContent != null && response.htmlContent != ""){
            Utils.saveAndOpenBase64ByPDF(response.htmlContent, nameFile: response.iccinvhdr.id.toString()).then((value) {
              Navigator.of(context).pop();
            });
          }else{
            Navigator.of(context).pop();
          }
        }).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TraCuuHoaDonBHScreen())));

  }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.guiReview, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        DialogAlert.showDialogAlertCancel(context, 'Gửi khách hàng thành công');
      }
    });

    registerHandler((HoaDonDieuChinhThayTheModel x) => x.error, (context, error, cancel) {
      if(isKyHD) {
        DialogAlert.dissmissLoadingDialog(context, GlobalKey());
        isKyHD = false;
      }
      DialogAlert.showDialogAlertCancel(context, error == null || error == "" ?  "Có lỗi xảy ra !" : error);
    });
    final loading = watchX((HoaDonDieuChinhThayTheModel x) => x.loading);
    return Scaffold(
        body: Stack(
          children: [
            chiTietResponse != null ?
            AppbarScreen(title: widget.typeHD == "HDTT" ? 'Hóa đơn thay thế' : "Hóa đơn điều chỉnh", isShowBack: true, isShowHome: false,
              heightTop: EdgeInsets.only(top: 650.h),
              trangThai: chiTietResponse.trangthai != null ? Utils.convertStatusThongBao(chiTietResponse.trangthai) : "",
              childrenAppBar: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ItemFilterTB("Ký hiệu: ", chiTietResponse.khieuhdon != null ? chiTietResponse.khieuhdon : "", textAlign: TextAlign.start),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: ItemFilterTB("Mẫu số: ", chiTietResponse.mauhdon != null ? chiTietResponse.mauhdon : "", textAlign: TextAlign.start),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: ItemFilterTB("Ngày lập", ngaylap != null ? ngaylap : "", textAlign: TextAlign.start,
                              // onTap: () async {
                              //   DateTime selectedDate = DateTime.now();
                              //   final DateTime picked = await showDatePicker(
                              //       context: context,
                              //       initialDate: Utils.convertStringToDateTime(ngaylap),
                              //       firstDate: DateTime(1900, 1),
                              //       lastDate: DateTime(2100));
                              //   if (picked != null && picked != selectedDate) {
                              //     selectedDate = picked;
                              //     setState(() {
                              //       ngaylap = Utils.convertDateTime(selectedDate);
                              //     });
                              //   }
                              // }
                            ),
                          ),
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
                            Text("Tổng tiền thanh toán ", style: text14OBold400,),
                            Text("${Utils.covertToMoney(double.parse(thanhTien))}", style: text24Red600,),
                            Text("${chiTietResponse.matte.isNotEmpty ? chiTietResponse.matte : "VND"}", style: text14OBold400,),

                          ],
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                )
              ],
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        widget.typeHD == "HDTT" ?
                        InkWell(
                          onTap: ()async{
                            final resuls = await Navigator.push(
                                context, new MaterialPageRoute(builder: (context) => ThongTinTTDCScreen(object: lstHDThayThe.first, typeHD: widget.typeHD, sovban: sovban, ngayvb: ngaykyvanban,)));
                            if(resuls != null){
                              setState(() {
                                sovban = resuls[0].toString();
                                ngaykyvanban = resuls[1].toString();
                                if(resuls.length > 3){
                                  lyDo = resuls[2].toString() ?? "";
                                  adjustType = resuls[3].toString() ?? 'Giảm';
                                }
                              });
                            }

                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h, bottom: 20.h),
                              width: MediaQuery.of(context).size.width ,
                              decoration: BoxDecoration(
                                color: colorWhite,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text("Thông tin thay thế".toUpperCase(), style: text14OBold600,)),
                                      Icon(Icons.post_add_outlined)
                                    ],
                                  ),
                                ],
                              )

                          ),
                        ) :
                        InkWell(
                          onTap: ()async{
                            print('-----------sovban $sovban ngayvb $ngaykyvanban lydo $lyDo adjustType $adjustType ');
                            final resuls = await Navigator.push(
                                context, new MaterialPageRoute(builder: (context) => ThongTinTTDCScreen(object: lstHDDieuChinh.first, typeHD: widget.typeHD, sovban: sovban, ngayvb: ngaykyvanban, lydo: lyDo, adjustType: adjustType,)));
                            print('----------------- $resuls');
                            if(resuls != null){
                              setState(() {
                                sovban = resuls[0].toString();
                                ngaykyvanban = resuls[1].toString();
                                lyDo = resuls[2].toString();
                                adjustType = resuls[3].toString();
                              });
                            }

                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h, bottom: 20.h),
                              width: MediaQuery.of(context).size.width ,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text("Thông tin điều chỉnh".toUpperCase(), style: text14OBold600,)),
                                      Icon(Icons.post_add_outlined)
                                    ],
                                  ),
                                ],
                              )

                          ),
                        ),


                        Visibility(
                          visible: type == 3,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  final result = await Navigator.push(
                                      context, new MaterialPageRoute(builder: (context) => HopDongDaiLyScreen(type: 4, object: objectHopdong,)));
                                  if(result != null){
                                    setState(() {
                                      // if(type == 3){
                                      //   isClickHD = true;
                                      // }else{
                                      //   isClickCanCu = true;
                                      // }
                                      objectHopdong = result;
                                    });
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 40.h, bottom: 40.h),
                                  width: MediaQuery.of(context).size.width ,
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text( "Căn cứ điều động".toUpperCase(), style: text14OBold600,)),
                                          Icon(Icons.post_add_outlined)
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          objectHopdong.lenh != "" && objectHopdong.lenh != null ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 30.h),
                                            child: Text("${objectHopdong.lenh}", style: text16Bold600, textAlign: TextAlign.start),
                                          ) : SizedBox(),
                                          objectHopdong.dvDieuDong != "" && objectHopdong.dvDieuDong != null  ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("Đơn vị: ${objectHopdong.dvDieuDong}", style: text14Bold400, textAlign: TextAlign.start,),
                                          ) : SizedBox(),
                                          objectHopdong.ngayDieuDong != "" && objectHopdong.ngayDieuDong != null  ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("Ngày điều động: ${objectHopdong.ngayDieuDong}", style: text14Bold400, textAlign: TextAlign.start),
                                          ) : SizedBox(),
                                        ],
                                      )

                                    ],
                                  )

                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final results = await Navigator.push(
                                      context, new MaterialPageRoute(builder: (context) => ThongTinVanChuyenScreen(object: thongTinVanChuyen,)));
                                  if(results != null){
                                    setState(() {
                                      thongTinVanChuyen = results;
                                    });
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  padding: EdgeInsets.only(left: 20.h, right: 20.h, top:  40.h, bottom: 40.h),
                                  width: MediaQuery.of(context).size.width ,
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
                                      thongTinVanChuyen.name != "" && thongTinVanChuyen.name != null ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 30.h),
                                        child: Text("${thongTinVanChuyen.name}", style: text16Bold600, textAlign: TextAlign.start),
                                      ) : SizedBox(),
                                      thongTinVanChuyen.hdSo != "" && thongTinVanChuyen.hdSo != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text("Hợp đồng số: ${thongTinVanChuyen.hdSo}", style: text14Bold400, textAlign: TextAlign.start,),
                                      ) : SizedBox(),
                                      thongTinVanChuyen.phuongTien != "" && thongTinVanChuyen.phuongTien != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text("Phương tiện vận chuyển: ${thongTinVanChuyen.phuongTien}", style: text14Bold400, textAlign: TextAlign.start),
                                      ) : SizedBox(),

                                    ],
                                  ),

                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final results = await Navigator.push(
                                      context, new MaterialPageRoute(builder: (context) => ThongTinNguoiNhanScreen(object: thongTinNguoiNhan,)));
                                  if(results != null){
                                    setState(() {
                                      thongTinNguoiNhan = results;
                                    });
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  padding: EdgeInsets.only(left: 20.h, right: 20.h, top:  40.h, bottom: 40.h),
                                  width: MediaQuery.of(context).size.width ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text("Thông tin người nhận".toUpperCase(), style: text14OBold600,)),
                                          Icon(Icons.post_add_outlined)
                                        ],
                                      ),
                                      thongTinNguoiNhan.name != "" && thongTinNguoiNhan.name != null ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 30.h),
                                        child: Text("${thongTinNguoiNhan.name}", style: text16Bold600, textAlign: TextAlign.start),
                                      ) : SizedBox(),
                                      thongTinNguoiNhan.unit != "" && thongTinNguoiNhan.unit  != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text("Tên đơn vị nhận hàng: ${thongTinNguoiNhan.unit}", style: text14Bold400, textAlign: TextAlign.start,),
                                      ) : SizedBox(),
                                      thongTinNguoiNhan.warehouseAddress != "" && thongTinNguoiNhan.warehouseAddress != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text("Địa chỉ kho nhận hàng ${thongTinNguoiNhan.warehouseAddress}", style: text14Bold400, textAlign: TextAlign.start),
                                      ) : SizedBox(),

                                    ],
                                  ),

                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Divider(height: 1,),
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         // color: Colors.red,
                              //         height: 60.0, // Đặt chiều cao cố định cho cả hai widget
                              //         child: DropdownInput(
                              //           value: dropTypeMoney,
                              //           onChangedCustom: (String value) {
                              //             setState(() {
                              //               dropTypeMoney = value;
                              //             });
                              //           },
                              //           hint: "Loại tiền",
                              //           itemsDropdown: lstDropTypeMoney,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(width: 16), // Khoảng cách giữa DropdownInput và TextInput
                              //     Expanded(
                              //       child: Container(
                              //         // color: Colors.blue,
                              //         height:47.0, // Đặt chiều cao cố định cho cả hai widget
                              //         // child: TextInput(
                              //         //   haveBorder: true,
                              //         //   hintText: "Tỷ giá",
                              //         //   textInputType: TextInputType.phone,
                              //         //   maxLength: 16,
                              //         // ),
                              //         child: TextField(
                              //           controller: exchangeRateController,
                              //           keyboardType: TextInputType.number,
                              //           decoration: InputDecoration(
                              //             hintText: "Tỷ giá",
                              //             border: OutlineInputBorder(),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Divider(height: 1,),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 20.h, right: 20.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, isTraCuu: true,)));
                                  if(result != null){
                                    setState(() {
                                      Dsdvu hangHoaByMaResponse = result;
                                      listHangHoa.add(hangHoaByMaResponse);
                                      tongTienDv = (double.parse(tongTienDv) + (hangHoaByMaResponse.thanhtientruocthue != null && hangHoaByMaResponse.thanhtientruocthue != "" ? double.parse(hangHoaByMaResponse.thanhtientruocthue) : 0.0)).toString();
                                      tienGTGT = (double.parse(tienGTGT) + (hangHoaByMaResponse.tienthue != null && hangHoaByMaResponse.tienthue != "" ? double.parse(hangHoaByMaResponse.tienthue) : 0.0)).toString();
                                      thanhTien = (double.parse(thanhTien) + double.parse(hangHoaByMaResponse.tongtienthanhtoan)).toString();

                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(child: Text("Thông tin hàng hóa".toUpperCase(), style: text14OBold600,)),
                                    Icon(Icons.control_point_outlined)
                                  ],
                                ),
                              ),
                              listHangHoa != null && listHangHoa.length > 0 ?
                              Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: listHangHoa.length > 3 ? 3 : listHangHoa.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(

                                            onTap: () async {
                                              final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, hangHoaByMaResponse: listHangHoa[index], isTraCuu: true,)));
                                              if(result != null){
                                                setState(() {

                                                  listHangHoa[index] = result;
                                                  tongTienDv = 0.toString();
                                                  tienGTGT = 0.toString();
                                                  thanhTien = 0.toString();
                                                  listHangHoa.forEach((element) {
                                                    tongTienDv = (double.parse(tongTienDv) + (element.thanhtientruocthue != null && element.thanhtientruocthue != "" ? double.parse(element.thanhtientruocthue) : 0.0)).toString();
                                                    tienGTGT = (double.parse(tienGTGT) + (element.tienthue != null && element.tienthue != "" ? double.parse(element.tienthue) : 0.0)).toString();
                                                    thanhTien = (double.parse(thanhTien) + (element.tongtienthanhtoan != null && element.tongtienthanhtoan != "" ? double.parse(element.tongtienthanhtoan) : element.thanhtientruocthue != null && element.thanhtientruocthue != "" ? double.parse(element.thanhtientruocthue) : "0")).toString();
                                                  });
                                                });
                                              }
                                            },
                                            onLongPress: (){
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
                                                  listHangHoa.removeAt(index);
                                                  Navigator.of(context).pop();
                                                });
                                              });
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
                                                            Text("${index + 1} ${listHangHoa[index].tendvu}" , style: text_action_Bold600,),
                                                            Padding(
                                                              padding: EdgeInsets.only(top: 10.h),
                                                              child: Text("${listHangHoa[index].dongia.isEmpty ? "0" : Utils.covertToMoney(double.parse(listHangHoa[index].dongia))} ${listHangHoa[index].thuesuat.isEmpty ? "" : " + ${listHangHoa[index].thuesuat.replaceAll("%", "")} %"}" ,
                                                                style: text12OpacityBold400,),
                                                            ),
                                                            Wrap(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
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

                                                                      Expanded(child: Text("${Utils.formatNumberText(listHangHoa[index].soluong)}", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                                                      Expanded(child: Text("+", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )


                                                    ),
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
                                                                  String money = "${listHangHoa[index].tongtienthanhtoan != null ? Utils.covertToMoney(double.parse(listHangHoa[index].tongtienthanhtoan)) : 0.0}";
                                                                  String moneyDV = "${listHangHoa[index].thanhtientruocthue != null ? Utils.covertToMoney(double.parse(listHangHoa[index].thanhtientruocthue)) : 0.0}";
                                                                  String moneyGTGT = "${listHangHoa[index].tienthue != null ? Utils.covertToMoney(double.parse(listHangHoa[index].tienthue)) : 0.0}";

                                                                  thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                                                  tongTienDv = (double.parse(tongTienDv.replaceAll(",", "")) - double.parse(moneyDV.replaceAll(",", ""))).toString();
                                                                  tienGTGT = (double.parse(tienGTGT.replaceAll(",", "")) - double.parse(moneyGTGT.replaceAll(",", ""))).toString();

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
                                                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                                                  child: Divider(),
                                                )
                                              ],
                                            ),
                                        );
                                      }),
                                  listHangHoa.length > 3 ?
                                  InkWell(
                                    onTap: () async {
                                      final result = await Navigator.push(
                                          context, new MaterialPageRoute(builder: (context) => DanhSachThemMoiScreen(type: type, invoiceType: chiTietResponse.loaihdon, listHangHoa: listHangHoa, isTraCuu: true,)));
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
                              ) : Container()
                            ],
                          ),
                        ) ,
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Divider(height: 1,),
                        ),
                        Container(
                            padding: EdgeInsets.all(40.h),
                            // height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                color: colorF4FAFF,

                            ),
                            // child: Row(
                            //   children: [
                                // Expanded(child: Text("Tổng tiền thanh toán VND")),
                                // Text("${Utils.covertToMoney(double.parse(thanhTien))}"),
                            //   ],
                            // )
                            child: containerButton(context, type),

                        ),
                        chiTietResponse.tinhchat == "04" ?
                        Container(
                            padding: EdgeInsets.only( bottom: 40.h),
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                color: colorWhite,
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(height: 1,),
                                Padding(
                                  padding: EdgeInsets.only(top: 40.h, bottom: 40.h, left: 20.h, right: 20.h),
                                  child: Text("Chênh lệnh", style: text18Bold500, textAlign: TextAlign.start,),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.h),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Tổng tiền tăng")),
                                      Text("${chiTietResponse.tongTToanTang}", style: text14Bold400,),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.all(20.h),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Tổng tiền giảm")),
                                      Text("${chiTietResponse.tongTToanGiam}", style: text14Bold400,),
                                    ],
                                  ),
                                ),
                              ],
                            )

                        ) : Container(),

                      ],
                    ),
                    // Content2(context, type, invoiceType, listHangHoa),


                  ],

                )
              ],
            ): Container(),
            loading ? LoadingWidget() : Container(),
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
          children: lstSpeedDial,
        ) ,
    );
  }

  List<Chitiethoadon> getChiTietHD(){
    List<Chitiethoadon> listChiTietHD = [];
    listHangHoa.forEach((element) {
      listChiTietHD.add(Chitiethoadon(
        madvu: element.madvu,
        dongia: element.dongia.toString().replaceAll(".0", ""),
        dvtinh: element.dvtinh,
        khuyenmai: element.khuyenmai,
        soluong: element.soluong.toString(),
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
  
  void kiHoaDon(String pinCode){
    controller.kyHoaDonAPI(KyHoaDonApiRequest(
        check_savepass: "Y",
        id: idHD,
        ngaykyvanban: ngaykyvanban,
        sovban: sovban,
        cd_khieuhdon: chiTietResponse.khieuhdon,
        cd_mauhdon: chiTietResponse.mauhdon,
        cd_ngayHD: chiTietResponse.ngayhdon,
        cd_sohdon: chiTietResponse.sohdon,
        ngayCQThdongoc: chiTietResponse.ngayCqThdongoc == null || chiTietResponse.ngayCqThdongoc == "" ? chiTietResponse.ngayhdon : chiTietResponse.ngayCqThdongoc,
        pincode: int.parse(pinCode),
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
        matte: chiTietResponse.matte != null ? chiTietResponse.matte : "VND",
        mauhdon: chiTietResponse.mauhdon,
        mstNmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
            .mstnmua : "",
        serviceType: widget.typeHD == "HDTT" ? "R" : widget.typeHD == "HDDC" ? "A" : chiTietResponse.serviceType,
        tendvinmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
            .tendvinmua : "",
        tenhdon: chiTietResponse.tenhdon,
        tennmua: type == 0 || type == 1 || type == 2 ? chiTietResponse
            .tennmua : "",
        tgia: "1",
        tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
        tinhchat: tinhChatHd_DC_TT,
        tongtiennte: Utils.covertToMoney(double.parse(tongTienDv.replaceAll(",", ""))).toString().replaceAll(",", ""),
        tongtienthuente: Utils.covertToMoney(double.parse(tienGTGT.replaceAll(",", ""))).toString().replaceAll(",", ""),
        tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien.replaceAll(",", ""))).toString().replaceAll(",", ""),
        nhangnmua: "",
        tkhoannmua: "",
        lDoDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
            .noiDung,
        ngayDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
            .ngayDieuDong,
        ngayhdong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
            .ngayKy,
        nguoiDDong: type == 0 || type == 1 || type == 2 ? "" : objectHopdong
            .dvDieuDong,
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
        adjustType: adjustType,
        lydoDC: lyDo,
        kyDienTu: "Y",
        sohdongoc: chiTietResponse.sohdon
    ));
  }
  Widget containerButton(BuildContext context, int type){
    tongTienDv = 0.toString();
    tienGTGT = 0.toString();
    thanhTien = 0.toString();
    listHangHoa.forEach((element) {
      tongTienDv = (double.parse(tongTienDv) + double.parse(element.thanhtientruocthue)).toString();
      tienGTGT = (double.parse(tienGTGT) + double.parse(element.tienthue)).toString();
      thanhTien = (double.parse(thanhTien) + double.parse(element.tongtienthanhtoan)).toString();
    });
    return Column(
      children: [
        type == 3 || type == 4 || type == 5 ? Container() :
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Divider(height: 1,),
            ),
            Container(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  color: colorF4FAFF,
                  // borderRadius:
                  // BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Tổng tiền dịch vụ")),
                    Text("${Utils.covertToMoney(double.parse(tongTienDv))} đ", style: text14Bold600,),

                  ],
                )

            ),
            type == 2 ? SizedBox() : Divider(height: 1,),
            type == 2 ? Container() :
            Container(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  color: colorF4FAFF,
                  // borderRadius:
                  // BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Tiền thuế GTGT")),
                    Text("${Utils.covertToMoney(double.parse(tienGTGT))} đ", style: text14Bold600,),
                  ],
                )
            ),
          ],
        ),
        Divider(height: 1,),
        Container(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorF4FAFF,
              // borderRadius:
              // BorderRadius.all(Radius.circular(5))
            ),
            child: Row(
              children: [
                Expanded(child: Text("Thành tiền")),
                Text("${Utils.covertToMoney(double.parse(thanhTien))} đ", style: text14Bold600,),
              ],
            )
        ),
      ],
    );
  }
}

