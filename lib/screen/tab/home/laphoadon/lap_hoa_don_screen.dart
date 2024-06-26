import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/tab/home/laphoadon/hop_dong_dai_ly_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_nguoi_nhan_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_van_chuyen_screen.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_nguoi_mua_screen.dart';
import 'package:mtax24/service/api_service/request/check_amount_hdon_request.dart';
import 'package:mtax24/service/api_service/request/gui_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/request/ky_hoa_don_api_request.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';
import '../../../components/core/constants/currency_constants.dart';
import '../../../components/widget/input_widget/text_input.dart';
import '../../../init_view.dart';
import 'thong_tin_hang_hoa/danh_sach_hang_hoa_screen.dart';
import 'thong_tin_hang_hoa/them_moi_screen.dart';

class LapHoaDonScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  // final bool type;


  // LapHoaDonScreen(this.type);

  @override
  State<StatefulWidget> createState() => _LapHoaDonScreenScreenState();
}

class _LapHoaDonScreenScreenState extends State<LapHoaDonScreen> with GetItStateMixin{

  TextEditingController thongTinUserController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();
  TextEditingController exchangeRateController = TextEditingController();
  String  errorDenNgay;
  var dropDMuc, dropMauSo, dropKyHieu;
  List<String> lstDMuc = [];
  List<String> lstMauSo = [];
  List<String> lstKyHieu = [];
  var type = 0;
  List<DanhMucHoaDonResponse> lstDMucHoaDon = [];
  List<CorpSerialsResponse> lstPreLapHoaDon = [];
  List<String> lstDropTypeMoney = [];

  Key _refreshKey = UniqueKey();
  List<GetListHangHoaByMaResponse> listHangHoa = [];
  String timeToday = '', mst = "", id = "", invoiceType = "", idHD = "0";
  String maKH = "", htPayment = '';
  String tenDV = "", mstnmua = '', diachiNM = '', tenNMua = '', personalID = "";
  ObjectHopdong objectHopdong = ObjectHopdong();
  ThongTinVanChuyenModel thongTinVanChuyen = ThongTinVanChuyenModel();
  ThongTinNguoiNhanModel thongTinNguoiNhan = ThongTinNguoiNhanModel();
  CreateCustomerApiResponse thongTinUser = CreateCustomerApiResponse();

  String tongTienDv = "0";
  String tienGTGT = "0";
  String thanhTien = "0";
  bool isClickHD = false;
  bool isClickCanCu = false;
  bool isShowIcon = false;
  bool isKyHD = false;
  String isHsm = "";
  String dropTypeMoney;
  var controller = GetIt.I<LapHoaDonController>();
  // de lay tien te
  var controllerTT = GetIt.I<ThongTinNguoiMuaController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDMucHoaDon();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    timeToday = formatter.format(now);
    denNgayController.text = timeToday;
    exchangeRateController.text = '1';
    SharePreferUtils.getUserInfo().then((value) {
      mst = value.tin;
      id = value.userId;
    });
    // if(widget.type != null){
    //   isShowIcon = widget.type;
    // }
    controllerTT.getDMucNHangTTe(DMucNHangTTeRequest(
      isTraCuu: "isTraCuu",
      // mstNban: widget.mst,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((ThongTinNguoiMuaModel x) => x.lstDMucNH, (context, DMucNHangTTeResponse response, cancel) {
      if(response != null){
        if(response.dmucTTe.isNotEmpty){
          lstDropTypeMoney = response.dmucTTe;
        }
        dropTypeMoney = lstDropTypeMoney.first;
        print(lstDropTypeMoney);
    }});

    registerHandler((LapHoaDonModel x) => x.dMucHoaDon, (context, List<DanhMucHoaDonResponse> list, cancel) {
      setState(() {
        if(list.isNotEmpty){
          lstDMucHoaDon = list;
          lstDMuc.clear();
          // do api tra ve sai chinh ta => va test mong muon thay bang CQT
          final pattern = RegExp(r'cơ quan thuê|cơ quan thuế', caseSensitive: false);
          for(int  i = 0; i < list.length; i++){
            String name = list[i].invoiceName.replaceAll(pattern, "CQT");
            lstDMuc.add(list[i].invoiceCode + ": " + name);
          }
          dropDMuc = lstDMuc.first;
          invoiceType = lstDMucHoaDon.first.invoiceCode;
          controller.getPreLapHoaDon(PreLapHoaDonRequest(
            mauHDon: list.first.invoiceCode,
          ));
        }
      });
    });

    registerHandler((LapHoaDonModel x) => x.lstCorpSerials, (context, List<CorpSerialsResponse> list, cancel) {
      setState(() {
        if(list.isNotEmpty){
          lstPreLapHoaDon = list;
          if(list.first.lstCorpSerials.isNotEmpty) {
            lstMauSo.clear();
            list.first.lstCorpSerials.forEach((element) {
              lstMauSo.add(element.invoiceTemplate);
            });
            dropMauSo = lstMauSo.first;
            controller.getSerialInvoiceApi(SerialInvoiceRequest(
                taxCode: mst,
                invoiceType: list.first.loaiHDon,
                templateCode: list.first.lstCorpSerials.first.invoiceTemplate,
                isTraCuu: ""
            ));
          }
        }
      });
    });

    registerHandler((LapHoaDonModel x) => x.lstSerialInvoice, (context, List<SerialInvoiceResponse> list, cancel) {
      setState(() {
        if(list.isNotEmpty){
          lstKyHieu.clear();
          list.forEach((element) {
            lstKyHieu.add(element.invoiceSerial);
          });
          dropKyHieu = lstKyHieu.first;
        }
      });
    });

    registerHandler((LapHoaDonModel x) => x.luuHoaDon, (context, KyHoaDonApiResponse response, cancel) {
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
        }).then((value) {
          setState(() {
            thongTinUser = CreateCustomerApiResponse();
            thongTinVanChuyen = ThongTinVanChuyenModel();
            thongTinNguoiNhan = ThongTinNguoiNhanModel();
            objectHopdong = ObjectHopdong();
            exchangeRateController.text = '';
            tenDV = ""; mstnmua = ''; diachiNM = ''; tenNMua = ''; mst = '';
            maKH = ''; personalID = ''; htPayment = ''; dropTypeMoney = lstDropTypeMoney.first;
            tongTienDv = "0";
            tienGTGT = "0";
            thanhTien = "0";
            listHangHoa = [];
          });
        });
      }
    });

    registerHandler((LapHoaDonModel x) => x.checkAmountHoaDon, (context, BaseResponse response, cancel) async {
      if(response != null){
        if(response?.object != null && response?.object != ""){
          final objectConverted = jsonDecode(response?.object);
          CheckAmountHDonResponse checkAmountHDonResponse = CheckAmountHDonResponse.fromJson(objectConverted);
          // isKyHD = true;
          // DialogAlert.showLoadding(context);

          bool isSavePinCodeLocal = await SharePreferUtils.getStatusPIN();
          String pinCodeLocal = await SharePreferUtils.getPIN();

          String isSavePinCode = checkAmountHDonResponse.check_savepass;
          String pinCode = checkAmountHDonResponse.pinHSM;
          print('isSavePinCode: $isSavePinCode - pinCode: $pinCode isSavePinCodeLocal $isSavePinCodeLocal');
          if(checkAmountHDonResponse.isHsm == "Y"){
            isHsm = "Y";

            DialogAlert.showMDialogOTP("", context, (values) =>  kiHoaDon(values, isSavePinCodeLocal ?'Y' :'N'), pinCode: pinCode,
                flag: isSavePinCode);
          }else {
            print('-------------------------------- da di qua day');
            controller.kyHoaDonAPI(KyHoaDonApiRequest(
              ngayhdon: denNgayController.text,
              id: idHD,
              pincode: 111111,
              chitiethoadon: getChiTietHD(),
              dchinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerAddress : "",
              dthoainmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerTelephone : "",
              emailnmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerEmail : "",
              hthuctoan: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .typePayment == "Tiền mặt" ? "TM" : "" : "",
              kyhieu: dropKyHieu,
              loaihdon: invoiceType,
              lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
              lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
              lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
              lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,
              matte: "VND",
              mauhdon: dropMauSo,
              mstNmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerTaxcode : "",
              ngaykyvanban: "",
              serviceType: "N",
              tendvinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerCompany : "",
              tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
              tennmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                  .customerName : "",
              tgia: "1",
              tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
              tinhchat: "01",
              tongtiennte: tongTienDv.replaceAll(".0", ""),
              tongtienthuente: tienGTGT.replaceAll(".0", ""),
              tongtienttoannte: thanhTien.replaceAll(".0", ""),
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
                check_savepass: "Y"
            ));
          }
        }else {
          isKyHD = true;
          DialogAlert.showLoadding(context);
          controller.kyHoaDonAPI(KyHoaDonApiRequest(
            ngayhdon: denNgayController.text,
            id: idHD,
            pincode: 111111,
            chitiethoadon: getChiTietHD(),
            dchinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerAddress : "",
            dthoainmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerTelephone : "",
            emailnmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerEmail : "",
            hthuctoan: type == 0 || type == 1 || type == 2 ? thongTinUser
                .typePayment == "Tiền mặt" ? "TM" : "" : "",
            kyhieu: dropKyHieu,
            loaihdon: invoiceType,
            lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
            lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
            lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
            lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,
            matte: "VND",
            mauhdon: dropMauSo,
            mstNmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerTaxcode : "",
            ngaykyvanban: "",
            serviceType: "N",
            tendvinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerCompany : "",
            tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
            tennmua: type == 0 || type == 1 || type == 2 ? thongTinUser
                .customerName : "",
            tgia: "1",
            tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
            tinhchat: "01",
            tongtiennte: tongTienDv.replaceAll(".0", ""),
            tongtienthuente: tienGTGT.replaceAll(".0", ""),
            tongtienttoannte: thanhTien.replaceAll(".0", ""),
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
              check_savepass: "Y"
          ));
        }
      }
    });

    registerHandler((LapHoaDonModel x) => x.kyHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        idHD = response.iccinvhdr.id.toString();
        if(isHsm == "Y") {
          isKyHD = true;
          DialogAlert.showLoadding(context);
        }
        controller.guiHoaDonAPI(GuiHoaDonApiRequest(
          id: response.iccinvhdr.id,
          pincode: 111111,
          chitiethoadon: getChiTietHD(),
          dchinmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerAddress : "",
          dthoainmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerTelephone : "",
          emailnmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerEmail : "",
          // faxnmua: thongTinUser.customerFax,
          hthuctoan: type == 0 || type == 1 || type == 2 ? htPayment : "",
          kyhieu: dropKyHieu,
          loaihdon: invoiceType,
          lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
          lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
          lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
          lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,

          // lstInvOtherInfoTToan: [""],
          matte: "VND",
          mauhdon: dropMauSo,
          mstNmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerTaxcode : "",
          ngaykyvanban: "",
          serviceType: "N",
          tendvinmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerCompany : "",
          tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
          tennmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerName : "",
          tgia: "1",
          tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
          tinhchat: "01",
          tongtiennte: tongTienDv.replaceAll(".0", ""),
          tongtienthuente: tienGTGT.replaceAll(".0", ""),
          tongtienttoannte: thanhTien.replaceAll(".0", ""),
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

    registerHandler((LapHoaDonModel x) => x.guiHoaDonAPI, (context, KyHoaDonApiResponse response, cancel) {
      if(isKyHD == true){
        DialogAlert.dissmissLoadingDialog(context, GlobalKey());
      }
      isKyHD = false;
      if(response != null && response.htmlContent != null){
        DialogAlert.showDialogInfo(context, "Ký điện tử thành công \n bạn có muốn xem hóa đơn đã ký không", onSuccess: (){
          Utils.saveAndOpenBase64ByPDF(response.htmlContent, nameFile: response.iccinvhdr.id.toString()).then((value) {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                new MaterialPageRoute(
                    builder: (context) => MenuPage()));
          });
        });
      }else {
        DialogAlert.showDialogInfo(context, "Ký điện tử thành công ${response.iccinvhdr.sohdon}", onSuccess: (){
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => MenuPage()));

        });
      }
    });

    registerHandler((LapHoaDonModel x) => x.guiReview, (context, KyHoaDonApiResponse response, cancel) {
      if(response != null){
        idHD = response.iccinvhdr.id.toString();
        DialogAlert.showDialogAlertCancel(context, 'Gửi khách hàng thành công', onSuccess: (){
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => MenuPage()));
          // GetIt.I<MenuPageController>().setInterfaceMenuPage(0);
        });

      }
    });

    registerHandler((LapHoaDonModel x) => x.error, (context, String error, cancel) {
      if(isKyHD) {
        DialogAlert.dissmissLoadingDialog(context, GlobalKey());
        isKyHD = false;
      }
      DialogAlert.showDialogAlertCancel(context, error == null || error == "" ?  "Có lỗi xảy ra !" : error);
    });
    
    final loading = watchX((LapHoaDonModel x) => x.loading);

    return Scaffold(
        // appBar: widget.type ? null : buildAppBarMenuCustom(context, 'Lập hóa đơn', showHome: true ),
      key: _refreshKey,
        body: Stack(
          children: [
            TabAppbarScreen(title: "", image: "assets/images/bg_lap_hoa_don.png", isShowBack: false, isShowHome: false,
              children: [
                Padding(
                  padding: EdgeInsets.all(36.h),
                  child: Text("Lập hóa đơn", textAlign: TextAlign.start, style: text20Bold500,),
                ),

                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownInput(
                          value: dropDMuc,
                          onChangedCustom: (String value){
                            setState(() {
                              dropDMuc = value;
                              for(int i = 0; i < lstDMuc.length; i ++){
                                if(dropDMuc == lstDMuc[i].toString()){
                                  type = i;
                                  isClickCanCu = false;
                                  isClickHD = false;
                                  listHangHoa.clear();
                                  tongTienDv = "0";
                                  tienGTGT = "0";
                                  thanhTien = "0";
                                  objectHopdong = null;
                                  invoiceType = lstDMucHoaDon[i].invoiceCode;
                                  controller.getPreLapHoaDon(PreLapHoaDonRequest(
                                    mauHDon: lstDMucHoaDon[i].invoiceCode,
                                  ));
                                }
                              }
                            });
                          },
                          hint: "Danh mục",
                          itemsDropdown: lstDMuc,
                        ),
                        DropdownInput(
                          value: dropMauSo,
                          onChangedCustom: (String value){
                            setState(() {
                              dropMauSo = value;
                              for(int i = 0; i < lstMauSo.length; i ++){
                                if(dropMauSo == lstMauSo[i].toString()){
                                  // trangThai = listTrangThai[i].maTthai;
                                  controller.getSerialInvoiceApi(SerialInvoiceRequest(
                                      taxCode: mst,
                                      invoiceType: lstPreLapHoaDon.first.loaiHDon,
                                      templateCode: lstPreLapHoaDon.first.lstCorpSerials[i].invoiceTemplate,
                                      isTraCuu: ""
                                  ));
                                }
                              }
                            });
                          },
                          hint: "Mẫu số",
                          itemsDropdown: lstMauSo,
                        ),
                        DropdownInput(
                          value: dropKyHieu,
                          onChangedCustom: (String value){
                            setState(() {
                              dropKyHieu = value;
                            });
                          },
                          hint: "Ký hiệu",
                          itemsDropdown: lstKyHieu,
                        ),

                        CalendarInput(
                          textDateController: denNgayController,
                          haveBorder: true,
                          canSelectDate: true,
                          title: "Thời gian",
                          onClickChooseDate: (selectedDate){
                            setState(() {
                              if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                errorDenNgay = "Ngày không hợp lệ";
                              } else {
                                errorDenNgay = null;
                                denNgayController.text = selectedDate;
                              }
                            });
                          },
                          errorText: errorDenNgay,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        //   child: Text(timeToday, ),
                        // ),
                        Divider(),
                        type == 0 || type == 1 || type == 2|| type == 6 || type == 7 ?
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {

                                final resuls = await Navigator.push(
                                    context, new MaterialPageRoute(builder: (context) => ThongTinNguoiMuaScreen(maKH: thongTinUserController.text, flag: "GIP", idHD: "0", thongTinUser: thongTinUser,
                                              statusCreateUser: true,
                                  personalID: (type == 6 || type == 7)  ? true : false,)));
                                if(resuls != null){
                                  setState(() {
                                    thongTinUser = resuls;
                                    maKH = thongTinUser.maKH;
                                    tenNMua = thongTinUser.customerName;
                                    htPayment = thongTinUser.typePayment;
                                    tenDV = thongTinUser.customerCompany;
                                    mstnmua = thongTinUser.maKH != null && thongTinUser.maKH != "" ? thongTinUser.maKH : thongTinUser.customerTaxcode;
                                    diachiNM = thongTinUser.customerAddress;
                                    thongTinUserController.text = thongTinUser.maKH != null && thongTinUser.maKH != "" ? thongTinUser.maKH : thongTinUser.customerTaxcode;
                                    personalID = thongTinUser.personalID;
                                  });
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  padding: EdgeInsets.all(20.h),
                                  width: MediaQuery.of(context).size.width ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text("Thông tin người mua".toUpperCase(), style: text14OBold600,)),
                                          Icon(Icons.post_add_outlined)
                                        ],
                                      ),
                                      tenNMua != "" && tenNMua != null ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 30.h),
                                        child: Text("$tenNMua", style: text16Bold600, textAlign: TextAlign.start),
                                      ) : SizedBox(),

                                      tenDV != "" && tenDV != null ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 30.h),
                                        child: Text("$tenDV", style: text16Bold600, textAlign: TextAlign.start),
                                      ) : SizedBox(),
                                      mstnmua != "" && mstnmua != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text(thongTinUser.maKH != null && thongTinUser.maKH != "" ? "Mã KH: $mstnmua" : "Mst: $mstnmua", style: text14Bold400, textAlign: TextAlign.start,),
                                      ) : SizedBox(),
                                      diachiNM != "" && diachiNM != null  ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text("Đc: $diachiNM", style: text14Bold400, textAlign: TextAlign.start),
                                      ) : SizedBox(),


                                    ],
                                  ),

                              ),
                            ),
                          ],
                        )
                            :
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final result = await Navigator.push(
                                    context, new MaterialPageRoute(builder: (context) => HopDongDaiLyScreen(type: type, object: objectHopdong,)));
                                if(result != null){
                                  setState(() {
                                    if(type == 3){
                                      isClickHD = true;
                                    }else{
                                      isClickCanCu = true;
                                    }
                                    objectHopdong = result;
                                  });
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 40.h, bottom: 40.h),
                                  width: MediaQuery.of(context).size.width ,
                                  child: objectHopdong != null && (isClickHD || isClickCanCu) ?
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text(type == 3 ? "Hợp đồng đại lý".toUpperCase() : "Căn cứ điều động".toUpperCase(), style: text14OBold600,)),
                                          Icon(Icons.post_add_outlined)
                                        ],
                                      ),

                                      type == 3 ? Column(
                                        children: [
                                          objectHopdong.tcCaNhan != "" && objectHopdong.tcCaNhan != null ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 30.h),
                                            child: Text("${objectHopdong.tcCaNhan}", style: text16Bold600, textAlign: TextAlign.start),
                                          ) : SizedBox(),
                                          objectHopdong.mst != "" && objectHopdong.mst != null  ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("Mst: ${objectHopdong.mst}", style: text14Bold400, textAlign: TextAlign.start,),
                                          ) : SizedBox(),
                                          objectHopdong.ngayKy != "" && objectHopdong.ngayKy != null  ?
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("Ngày ký: ${objectHopdong.ngayKy}", style: text14Bold400, textAlign: TextAlign.start),
                                          ) : SizedBox(),
                                        ],
                                      ): Column(
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
                                  ) : Row(
                                    children: [
                                      Expanded(child: Text(type == 3 ? "Hợp đồng đại lý".toUpperCase() : "Căn cứ điều động ".toUpperCase(), style: text14OBold600,)),
                                      Icon(Icons.post_add_outlined)
                                    ],
                                  ),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Divider(height: 1,),
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
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Divider(height: 1,),
                        ),


                        Visibility(
                          visible: type == 4,
                          child: Column(
                            children: [
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      // color: Colors.red,
                                      height: 60.0, // Đặt chiều cao cố định cho cả hai widget
                                      child: DropdownInput(
                                        value: dropTypeMoney,
                                        onChangedCustom: (String value) {
                                          setState(() {
                                            dropTypeMoney = value;
                                          });
                                        },
                                        hint: "Loại tiền",
                                        itemsDropdown: lstDropTypeMoney,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16), // Khoảng cách giữa DropdownInput và TextInput
                                  Expanded(
                                    child: Container(
                                      // color: Colors.blue,
                                      height:47.0, // Đặt chiều cao cố định cho cả hai widget
                                      // child: TextInput(
                                      //   haveBorder: true,
                                      //   hintText: "Tỷ giá",
                                      //   textInputType: TextInputType.phone,
                                      //   maxLength: 16,
                                      // ),
                                      child: TextField(
                                        controller: exchangeRateController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text("Tỷ giá"),
                                          labelStyle: TextStyle(color: Colors.grey.shade800),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Divider(height: 1,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Divider(height: 1,),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20.h),
                            padding: EdgeInsets.only(left: 20.h, right: 20.h, top:  40.h, bottom: 40.h),
                            width: MediaQuery.of(context).size.width ,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: invoiceType, isTraCuu: false,)));
                                    if(result != null){
                                      setState(() {
                                        GetListHangHoaByMaResponse hangHoaByMaResponse = result;
                                        listHangHoa.add(hangHoaByMaResponse);
                                        tongTienDv = (double.parse(tongTienDv) + hangHoaByMaResponse.tongTienDV).toString();
                                        tienGTGT = (double.parse(tienGTGT) + hangHoaByMaResponse.tienGTGT).toString();
                                        thanhTien = (double.parse(thanhTien) + hangHoaByMaResponse.thanhTien).toString();
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
                                ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: listHangHoa.length > 3 ? 3 :listHangHoa.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () async {
                                            final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: type, invoiceType: invoiceType, hangHoaByMaResponse: listHangHoa[index], isTraCuu: false)));
                                            if(result != null){
                                              setState(() {
                                                listHangHoa[index] = result;
                                                tongTienDv = 0.toString();
                                                tienGTGT = 0.toString();
                                                thanhTien = 0.toString();
                                                listHangHoa.forEach((element) {
                                                  tongTienDv = (double.parse(tongTienDv) + element.tongTienDV).toString();
                                                  tienGTGT = (double.parse(tienGTGT) + element.tienGTGT).toString();
                                                  thanhTien = (double.parse(thanhTien) + element.thanhTien).toString();
                                                });
                                              });
                                            }
                                          },
                                          onLongPress: (){
                                            DialogAlert.showDialogInfo(context, "Bạn có muốn xóa hàng hóa không?", onSuccess: (){
                                              setState(() {
                                                String money = "${listHangHoa[index].thanhTien != null ? Utils.covertToMoney(listHangHoa[index].thanhTien) : 0.0}";
                                                String moneyDV = "${listHangHoa[index].tongTienDV != null ? Utils.covertToMoney(listHangHoa[index].tongTienDV) : 0.0}";
                                                String moneyGTGT = "${listHangHoa[index].tienGTGT != null ? Utils.covertToMoney(listHangHoa[index].tienGTGT) : 0.0}";

                                                thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                                tongTienDv = (double.parse(tongTienDv.replaceAll(",", "")) - double.parse(moneyDV.replaceAll(",", ""))).toString();
                                                tienGTGT = (double.parse(tienGTGT.replaceAll(",", "")) - double.parse(moneyGTGT.replaceAll(",", ""))).toString();

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
                                                          Text("${index + 1} ${listHangHoa[index].tenHHoa}" , style: text_action_Bold600,),
                                                          Padding(
                                                            padding: EdgeInsets.only(top: 10.h),
                                                            child: Text("${listHangHoa[index].donGia != null ? Utils.covertToMoney(listHangHoa[index].donGia): 0.0} + ${listHangHoa[index].thueSuat}" ,
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

                                                                    Expanded(child: Text("${listHangHoa[index].number}", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

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
                                                    Text("${listHangHoa[index].thanhTien != null ? Utils.covertToMoney(listHangHoa[index].thanhTien) : 0.0}" + " đ",
                                                      textAlign: TextAlign.end, style: text14Red600,),
                                                    Container(
                                                      margin: EdgeInsets.only(left: 30.h),
                                                      // Xoa hoa don
                                                      child: InkWell(child: Icon(Icons.delete),
                                                        onTap: (){
                                                          DialogAlert.showDialogInfo(context, "Bạn có muốn xóa hàng hóa không?", onSuccess: (){
                                                            setState(() {
                                                              String money = "${listHangHoa[index].thanhTien != null ? Utils.covertToMoney(listHangHoa[index].thanhTien) : 0.0}";
                                                              String moneyDV = "${listHangHoa[index].tongTienDV != null ? Utils.covertToMoney(listHangHoa[index].tongTienDV) : 0.0}";
                                                              String moneyGTGT = "${listHangHoa[index].tienGTGT != null ? Utils.covertToMoney(listHangHoa[index].tienGTGT) : 0.0}";

                                                              thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                                              tongTienDv = (double.parse(tongTienDv.replaceAll(",", "")) - double.parse(moneyDV.replaceAll(",", ""))).toString();
                                                              tienGTGT = (double.parse(tienGTGT.replaceAll(",", "")) - double.parse(moneyGTGT.replaceAll(",", ""))).toString();

                                                              listHangHoa.removeAt(index);
                                                              Navigator.of(context).pop();
                                                            });

                                                          });
                                                        },
                                                      ),
                                                    )
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
                                          )
                                      );
                                    }) : SizedBox(),
                                listHangHoa.length > 3 ?
                                InkWell(
                                  onTap: () async {
                                    final result = await Navigator.push(
                                        context, new MaterialPageRoute(builder: (context) => DanhSachThemMoiScreen(type: type, invoiceType: invoiceType, listHangHoa: listHangHoa, isTraCuu: false,)));
                                    if(result != null){
                                      setState(() {
                                        listHangHoa = result;
                                        tongTienDv = 0.toString();
                                        tienGTGT = 0.toString();
                                        thanhTien = 0.toString();
                                        listHangHoa.forEach((element) {
                                          tongTienDv = (double.parse(tongTienDv) + element.tongTienDV).toString();
                                          tienGTGT = (double.parse(tienGTGT) + element.tienGTGT).toString();
                                          thanhTien = (double.parse(thanhTien) + element.thanhTien).toString();
                                        });
                                      });
                                    }

                                  },


                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
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
                                  ),
                                ) : SizedBox()
                              ],
                            )

                        ),
                        type == 0 || type == 6?
                        Column(
                          children: [
                            Divider(height: 1,),
                            Container(
                                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                                height: MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width ,
                                color: colorF4FAFF,
                                // decoration: BoxDecoration(
                                //     color: colorBorderInputCombobox,
                                //     borderRadius:
                                //     BorderRadius.all(Radius.circular(5))),
                                child: Row(
                                  children: [
                                    Expanded(child: Text("Tổng tiền dịch vụ ")),
                                    Text("${Utils.covertToMoney(double.parse(tongTienDv))} đ", style: text14Bold600,),

                                  ],
                                )

                            ),
                            Divider(height: 1,),
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
                        ) : SizedBox(),
                        Divider(height: 1,),
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
                                Expanded(child: Text(type == 0 ? "Tổng cộng VND" : "Tổng tiền thanh toán VND")),
                                Text("${Utils.covertToMoney(double.parse(thanhTien))} đ", style: text14Bold600,),

                              ],
                            )

                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ButtonBottomNotStackWidget(
                                title: "Lưu",
                                onPressed: () async {
                                  // String tienThanhChu = VietnameseNumberReader.readNumber(int.parse(Utils.covertToMoney(double.parse(thanhTien)).toString()));
                                  if(listHangHoa == null || listHangHoa.length == 0){
                                    DialogAlert.showDialogAlertCancel(context, "Bạn chưa chọn hàng hóa");
                                  }else if((type == 0 || type == 1 || type == 2) && thongTinUser == null){
                                    DialogAlert.showDialogAlertCancel(context, "Bạn chưa chọn thông tin hàng hóa");
                                  }else if((type == 3 || type == 4 || type == 5) && objectHopdong == null){
                                    DialogAlert.showDialogAlertCancel(context, type == 3 ? "Bạn chưa chọn hợp đồng đại lý" : "Bạn chưa chọn căn cứ điều động");
                                  }else if((type == 3 || type == 4 || type == 5) && thongTinVanChuyen == null){
                                    DialogAlert.showDialogAlertCancel(context, "Bạn chưa chọn thông tin vận chuyển");
                                  }else {
                                    thanhTien = Utils.covertToMoney(double.parse(thanhTien)).toString().replaceAll(",", "");

                                    if((double.parse(thanhTien) > 20000000 && (htPayment == 'TM' || htPayment == ""))){
                                      DialogAlert.showDialogAlertCancel(context, "Không được phép chọn “Tiền mặt” đối với hóa đơn có giá trị thanh toán lớn hơn 20 triệu VNĐ");
                                      return;
                                    }
                                    String matte = currencyMap[thongTinUser.typeMoney ?? "VND"];

                                    controller.luuHoaDon(LuuHoaDonRequest(
                                      // ngayhdon: (ngayhdon.millisecondsSinceEpoch / 1000).round().toString(),
                                      ngayhdon: denNgayController.text,
                                      chitiethoadon: getChiTietHD(),
                                      relatedCustomer: maKH,
                                      cccDan: personalID,
                                      issue_type: (type == 6 || type == 7 || type == 8) ? "MTT" : "",
                                      dchinmua: thongTinUser.customerAddress,
                                      dthoainmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerTelephone : "",
                                      emailnmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerEmail : "",
                                      faxnmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerFax : "",
                                      hthuctoan: type == 0 || type == 1 || type == 2 ? htPayment : "",
                                      kyhieu: dropKyHieu,
                                      loaihdon: invoiceType,
                                      lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
                                      lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
                                      lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
                                      lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,
                                      matte: (thongTinUser.typeMoney != null) ? thongTinUser.typeMoney : "VND",
                                      mauhdon: dropMauSo,
                                      mstNmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerTaxcode : "",
                                      ngaykyvanban: "",
                                      serviceType: "N",
                                      tendvinmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerCompany : "",
                                      // Do o tren yeu cau co ma => khi gui di phai xoa ma
                                      tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
                                      tennmua: type == 0 || type == 1 || type == 2 ? thongTinUser.customerName : "",
                                      tgia: "1",
                                      tienbangchu: Utils.convertVietnameseNumberReader(thanhTien) + " $matte",
                                      tinhchat: "01",
                                      tongtiennte: tongTienDv.replaceAll(".0", ""),
                                      tongtienthuente: tienGTGT.replaceAll(".0", ""),
                                      tongtienttoannte: thanhTien.replaceAll(".0", ""),
                                      tongtientruocthue0Nte: 0,
                                      tongtientruocthue5Nte: 0,
                                      tongtientruocthue10Nte: 0,
                                      tongtientruocthuekchiuthuente: 0,
                                      adjustType: "",
                                      id: "0",
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

                                      // Tam thoi chua dung type = 6, 7 = > de nen cho bang rong
                                      lDoDDong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.noiDung,
                                      ngayDDong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.ngayDieuDong,
                                      ngayhdong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.ngayKy,
                                      nguoiDDong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.dvDieuDong,
                                      soLenhDDong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.lenh,

                                      hDongVchuyen: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : thongTinVanChuyen.hdSo,
                                      nguoivchuyen: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : thongTinVanChuyen.name,
                                      ptienvchuyen: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : thongTinVanChuyen.phuongTien,
                                      sohdong: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : objectHopdong.hdKinhTeSo,

                                      tenknhap: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : thongTinVanChuyen.khoNhap,
                                      tenkxuat: type == 0 || type == 1 || type == 2 || type == 6 || type == 7 ? "" : thongTinVanChuyen.khoXuat,


                                    ));

                                  }

                                },
                              ),
                            ),
                            SizedBox(width: 4,),
                            type == 0 || type == 1 || type == 2 ?
                            Expanded(
                              flex: 2,
                              child: ButtonBottomNotStackWidget(
                                title: "Gửi khách",
                                onPressed: () {
                                  if(listHangHoa.isEmpty){
                                    Toast.showLongTop('Vui lòng nhập tên hàng hóa');
                                    return;
                                  }
                                  else{
                                    for(int i = 0; i < listHangHoa.length; ++i){

                                        if(listHangHoa[i].tenHHoa == null || listHangHoa[i].tenHHoa == ""){
                                          Toast.showLongTop('Vui lòng nhập tên hàng hóa');
                                          return;
                                      }
                                      if(listHangHoa[i].thueSuat == "-1 %"){
                                        Toast.showLongTop('Vui lòng nhập thuế suất');
                                        return;
                                      }

                                    }
                                  }

                                  if(thongTinUser.customerEmail == null || thongTinUser.customerEmail == ""){
                                    Toast.showLongTop('Vui lòng nhập email');
                                    return;
                                  }

                                  if((double.parse(thanhTien) > 20000000 && (htPayment == 'TM' || htPayment == ""))){
                                    DialogAlert.showDialogAlertCancel(context, "Không được phép chọn “Tiền mặt” đối với hóa đơn có giá trị thanh toán lớn hơn 20 triệu VNĐ");
                                    return;
                                  }
                                  controller.guiReview(GuiReviewHoaDonRequest(
                                    id: idHD,
                                    chitiethoadon: getChiTietHD(),
                                    dchinmua: thongTinUser.customerAddress,
                                    dthoainmua: thongTinUser.customerTelephone,
                                    emailnmua: thongTinUser.customerEmail,
                                    faxnmua: thongTinUser.customerFax,
                                    hthuctoan: htPayment,
                                    kyhieu: dropKyHieu,
                                    loaihdon: invoiceType,
                                    lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
                                    lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
                                    lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
                                    lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,
                                    matte: (thongTinUser.typeMoney != null && thongTinUser.typeMoney != "") ? thongTinUser.typeMoney : "VND",
                                    mauhdon: dropMauSo,
                                    mstNmua: thongTinUser.customerTaxcode,
                                    ngaykyvanban: "",
                                    serviceType: "N",
                                    tendvinmua: thongTinUser.customerCompany,
                                    tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
                                    tennmua: thongTinUser.customerName,
                                    tgia: "1",
                                    tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
                                    tinhchat: "01",
                                    tongtiennte: tongTienDv.replaceAll(".0", ""),
                                    tongtienthuente: tienGTGT.replaceAll(".0", ""),
                                    tongtienttoannte: thanhTien.replaceAll(".0", ""),
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
                            ) : SizedBox(),
                            SizedBox(width: 4,),
                            Expanded(
                              flex: 1,
                              child: ButtonBottomNotStackWidget(
                                title: "Ký",
                                onPressed: () {

                                  if((double.parse(thanhTien) > 20000000 && (htPayment == 'TM' || htPayment == ""))){
                                    DialogAlert.showDialogAlertCancel(context, "Không được phép chọn “Tiền mặt” đối với hóa đơn có giá trị thanh toán lớn hơn 20 triệu VNĐ");
                                    return;
                                  }
                                  if(listHangHoa == null || listHangHoa.length == 0){
                                    DialogAlert.showDialogAlertCancel(context, 'Vui lòng nhập thông tin hàng hóa');
                                  }else {
                                    setState(() {
                                      isHsm = "N";
                                      controller.checkAmountHDon(
                                          CheckAmountHDonRequest(
                                              hthuchdongoc: "01",
                                              tinhchat: "01",
                                              loaihdon: invoiceType,
                                              mstnban: mst,
                                              serviceType: "N",
                                              tgia: "1",
                                              id: id,
                                              tongtienttoannte: Utils.covertToMoney(double.parse(thanhTien)).toString().replaceAll(",", "")
                                          ));
                                    });

                                  }
                                },
                              ),)

                          ],
                        ),
                        SizedBox(height: 16,)
                      ],
                    ),
                  ],
                )
              ],
            ),
            loading ? LoadingWidget() : Container(),
          ],
        )
    );
  }

  List<Chitiethoadon> getChiTietHD(){
    List<Chitiethoadon> listChiTietHD = [];
    listHangHoa.forEach((element) {
      listChiTietHD.add(Chitiethoadon(
        madvu: element.maHHoa,
        dongia: Utils.covertToMoney(element.donGia).toString().replaceAll(",", "").replaceAll(".", ","),
        dvtinh: element.dvTinh,
        khuyenmai: element.type == 0 ? "N" : "Y",
        soluong: element.number.toString().replaceAll(",", "").replaceAll(".", ","),
        tendvu: element.tenHHoa,
        thanhtientruocthue: Utils.covertToMoney(element.tongTienDV).toString().replaceAll(",", "").replaceAll(".", ","),
        thuesuat: element.thueSuat.replaceAll(" %", ""),
        tienchietkhau: element.chietKhau.toString().replaceAll(",", "").replaceAll(".", ","),
        tienthue: Utils.covertToMoney(element.tienGTGT).toString().replaceAll(",", "").replaceAll(".", ","),
        tongtienthanhtoan: Utils.covertToMoney(element.thanhTien).toString().replaceAll(",", "").replaceAll(".", ","),

      ));
    });
    return listChiTietHD;
  }
  void kiHoaDon(String pinCode, String isSavePinCode){
    controller.kyHoaDonAPI(KyHoaDonApiRequest(
      ngayhdon: denNgayController.text,

      check_savepass: isSavePinCode,
      id: idHD,
      pincode: int.parse(pinCode),
      chitiethoadon: getChiTietHD(),
      dchinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerAddress : "",
      dthoainmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerTelephone : "",
      emailnmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerEmail : "",
      hthuctoan: type == 0 || type == 1 || type == 2 ? thongTinUser
          .typePayment == "Tiền mặt" ? "TM" : "" : "",
      kyhieu: dropKyHieu,
      loaihdon: invoiceType,
      lstInvOtherInfoBan: lstPreLapHoaDon.first.lstInvOtherInfoBan,
      lstInvOtherInfoCthd: lstPreLapHoaDon.first.lstInvOtherInfoCthd,
      lstInvOtherInfoMua: lstPreLapHoaDon.first.lstInvOtherInfoMua,
      lstInvOtherInfoTToan: lstPreLapHoaDon.first.lstInvOtherInfoTToan,
      matte: "VND",
      mauhdon: dropMauSo,
      mstNmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerTaxcode : "",
      ngaykyvanban: "",
      serviceType: "N",
      tendvinmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerCompany : "",
      tenhdon: dropDMuc.toString().split(' ').sublist(1).join(' ').trim(),
      tennmua: type == 0 || type == 1 || type == 2 ? thongTinUser
          .customerName : "",
      tgia: "1",
      tienbangchu: Utils.convertVietnameseNumberReader(thanhTien),
      tinhchat: "01",
      tongtiennte: tongTienDv.replaceAll(".0", ""),
      tongtienthuente: tienGTGT.replaceAll(".0", ""),
      tongtienttoannte: thanhTien.replaceAll(".0", ""),
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

    ));
  }

}

