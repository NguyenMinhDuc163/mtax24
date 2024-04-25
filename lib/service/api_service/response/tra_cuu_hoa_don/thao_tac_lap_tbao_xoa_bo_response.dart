// To parse this JSON data, do
//
//     final thaoTacLapTBaoXoaBoResponse = thaoTacLapTBaoXoaBoResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'chi_tiet_thong_bao_response.dart';

ThaoTacLapTBaoXoaBoResponse thaoTacLapTBaoXoaBoResponseFromJson(String str) => ThaoTacLapTBaoXoaBoResponse.fromJson(json.decode(str));

String thaoTacLapTBaoXoaBoResponseToJson(ThaoTacLapTBaoXoaBoResponse data) => json.encode(data.toJson());

class ThaoTacLapTBaoXoaBoResponse {
  ThaoTacLapTBaoXoaBoResponse({
    @required this.inReq,
    @required this.transtion,
    @required this.portal,
  });

  InReq inReq;
  String transtion;
  ThongBaoHdr portal;

  factory ThaoTacLapTBaoXoaBoResponse.fromJson(Map<String, dynamic> json) => ThaoTacLapTBaoXoaBoResponse(
    inReq: json["in"] == null ? null : InReq.fromJson(json["in"]),
    transtion: json["transtion"] == null ? null : json["transtion"],
    portal: json["portal"] == null ? null : ThongBaoHdr.fromJson(json["portal"]),
  );

  Map<String, dynamic> toJson() => {
    "in": inReq == null ? null : inReq.toJson(),
    "transtion": transtion == null ? null : transtion,
    "portal": portal == null ? null : portal.toJson(),
  };
}

class InReq {
  InReq({
    @required this.channelCode,
    @required this.typehdongoc,
    @required this.serviceType,
    @required this.lyDoXoaBo,
    @required this.dchinmua,
    @required this.dthoainmua,
    @required this.emailnmua,
    @required this.faxnmua,
    @required this.hthuctoan,
    @required this.hthuctoankhac,
    @required this.id,
    @required this.idGoc,
    @required this.khieuhdon,
    @required this.loaihdon,
    @required this.macqt,
    @required this.tencqt,
    @required this.maktra,
    @required this.matte,
    @required this.mauhdon,
    @required this.mstNban,
    @required this.mstNmua,
    @required this.ngayduyet,
    @required this.ngayhdcqt,
    @required this.ngayLap,
    @required this.ngayhdon,
    @required this.ngayhdong,
    @required this.ngayvban,
    @required this.ngayvbanStr,
    @required this.nguoiduyet,
    @required this.nguoilap,
    @required this.nguoivchuyen,
    @required this.nhangnmua,
    @required this.ptienvchuyen,
    @required this.sohdcqt,
    @required this.sohdon,
    @required this.sohdong,
    @required this.sohdongoc,
    @required this.ngayCqThdongoc,
    @required this.sovban,
    @required this.tendvinmua,
    @required this.tenhdon,
    @required this.tenhdong,
    @required this.tenknhap,
    @required this.tenkxuat,
    @required this.tennmua,
    @required this.tgia,
    @required this.tgiaStr,
    @required this.tkhoannmua,
    @required this.tongtienckhaunte,
    @required this.tongtienckhauvnd,
    @required this.tongtiennte,
    @required this.tongtienttoanbchu,
    @required this.tongtienttoannte,
    @required this.tongtienttoannteStr,
    @required this.tongtienttoanvnd,
    @required this.tongtienhangtruocthue,
    @required this.tongtienhangtruocthuevnd,
    @required this.tongtienttoanvndStr,
    @required this.tongtienvnd,
    @required this.trangthai,
    @required this.tinhChat,
    @required this.tennban,
    @required this.dchinban,
    @required this.dthoainban,
    @required this.tkhoannban,
    @required this.nhangnban,
    @required this.faxnban,
    @required this.emailnban,
    @required this.ghiChu,
    @required this.contentxml,
    @required this.barcode,
    @required this.mota,
    @required this.tongtienthuente,
    @required this.tongtienthuenteStr,
    @required this.confirm,
    @required this.check,
    @required this.flagFee,
    @required this.flagGiayTuin,
    @required this.maKeyGopExcel,
    @required this.trnRefNo,
    @required this.relatedCustomer,
    @required this.uniqueId,
    @required this.extRef,
    @required this.tongtienttoanbchuVnd,
    @required this.branchName,
    @required this.invoiceKey,
    @required this.adjustmentInvoice,
    @required this.sttHdUpload,
    @required this.mustToSign,
    @required this.hoadondacthu,
    @required this.tthaicqt,
    @required this.magdichthamchieu,
    @required this.macqtcap,
    @required this.userName,
    @required this.checkInChuyenDoi,
    @required this.tongtienthuevnd,
    @required this.tongtienthuevndStr,
    @required this.tongthuesuat5Nte,
    @required this.tongthuesuat5Vnd,
    @required this.tongthuesuat8Nte,
    @required this.tongthuesuat8Vnd,
    @required this.tongthuesuat10Nte,
    @required this.tongthuesuat10Vnd,
    @required this.tongthuesuatthuekhacnte,
    @required this.tongthuesuatthuekhacvnd,
    @required this.tongthuesuat0Nte,
    @required this.tongthuesuat0Vnd,
    @required this.khongchiuthuegtgt,
    @required this.mienthuegtgt,
    @required this.thueTang,
    @required this.thueGiam,
    @required this.tongTToanTang,
    @required this.tongTToanGiam,
    @required this.lyDoDChinh,
    @required this.tongtienthuedchinhtanggiam,
    @required this.tongtienttoandchinhtanggiam,
    @required this.tongtienthuedchinhtanggiamStr,
    @required this.tongtienttoandchinhtanggiamStr,
    @required this.pbanxml,
    @required this.messReceived,
    @required this.hDongVchuyen,
    @required this.idNguoilap,
    @required this.vanId,
    @required this.lydotuchoi,
    @required this.detail,
    @required this.listOfProduct,
    @required this.soLenhDDong,
    @required this.ngayDDong,
    @required this.nguoiDDong,
    @required this.lDoDDong,
    @required this.maGdich,
    @required this.tongtientruocthue10Nte,
    @required this.tongtientruocthue8Nte,
    @required this.tongtientruocthue5Nte,
    @required this.tongtientruocthue0Nte,
    @required this.tongtientruocthuekchiuthuente,
    @required this.tongtientruocthuemienthuente,
    @required this.tongtientruocthuethuekhacnte,
    @required this.tongtientruocthue10Vnd,
    @required this.tongtientruocthue8Vnd,
    @required this.tongtientruocthue5Vnd,
    @required this.tongtientruocthue0Vnd,
    @required this.tongtientruocthuekchiuthuevnd,
    @required this.tongtientruocthuemienthuevnd,
    @required this.tongtientruocthuethuekhacvnd,
    @required this.tongtiensauthue10Nte,
    @required this.tongtiensauthue8Nte,
    @required this.tongtiensauthue5Nte,
    @required this.tongtiensauthue0Nte,
    @required this.tongtiensauthuekchiuthuente,
    @required this.tongtiensauthuemienthuevnd,
    @required this.tongtiensauthuethuekhacvnd,
    @required this.tongtiensauthue10Vnd,
    @required this.tongtiensauthue8Vnd,
    @required this.tongtiensauthue5Vnd,
    @required this.tongtiensauthue0Vnd,
    @required this.tongtiensauthuekchiuthuevnd,
    @required this.tongtiensauthuemienthuente,
    @required this.tongtiensauthuethuekhacnte,
    @required this.updateTime,
    @required this.cdKhieuhdon,
    @required this.cdMauhdon,
    @required this.cdSohdon,
    @required this.hdongiay,
    @required this.tongTienTToanGiay,
    @required this.tongTienThueGtgtGiay,
    @required this.hThucHDon,
    @required this.kyDienTu,
    @required this.fee,
    @required this.feeVat,
    @required this.wfProcessId,
    @required this.wfStatus,
    @required this.wfUpdateTime,
    @required this.status,
    @required this.loaiDieuChinh,
    @required this.level,
    @required this.qrcode,
    @required this.lstInvOtherInfoBan,
    @required this.lstInvOtherInfoMua,
    @required this.lstInvOtherInfoTToan,
    @required this.lstInvOtherInfoLePhiKhac,
    @required this.lstInvOtherInfoCthd,
    @required this.tongcongthucxuat,
    @required this.isTt68,
    @required this.signDescError,
    @required this.job,
    @required this.tinhchatgoc,
    @required this.sluongdcdd,
    @required this.sluongdcCopy,
    @required this.checkBanNhap,
    @required this.ngayLapFormat,
    @required this.corpId,
    @required this.hthucHDonGoc,
  });

  String channelCode;
  String typehdongoc;
  String serviceType;
  String lyDoXoaBo;
  String dchinmua;
  String dthoainmua;
  String emailnmua;
  String faxnmua;
  String hthuctoan;
  String hthuctoankhac;
  int id;
  int idGoc;
  String khieuhdon;
  String loaihdon;
  String macqt;
  String tencqt;
  String maktra;
  String matte;
  String mauhdon;
  String mstNban;
  String mstNmua;
  dynamic ngayduyet;
  dynamic ngayhdcqt;
  int ngayLap;
  int ngayhdon;
  dynamic ngayhdong;
  int ngayvban;
  String ngayvbanStr;
  String nguoiduyet;
  String nguoilap;
  String nguoivchuyen;
  String nhangnmua;
  String ptienvchuyen;
  String sohdcqt;
  String sohdon;
  String sohdong;
  String sohdongoc;
  String ngayCqThdongoc;
  String sovban;
  String tendvinmua;
  String tenhdon;
  String tenhdong;
  String tenknhap;
  String tenkxuat;
  String tennmua;
  int tgia;
  String tgiaStr;
  String tkhoannmua;
  int tongtienckhaunte;
  int tongtienckhauvnd;
  int tongtiennte;
  String tongtienttoanbchu;
  int tongtienttoannte;
  String tongtienttoannteStr;
  int tongtienttoanvnd;
  int tongtienhangtruocthue;
  int tongtienhangtruocthuevnd;
  String tongtienttoanvndStr;
  int tongtienvnd;
  String trangthai;
  String tinhChat;
  String tennban;
  String dchinban;
  String dthoainban;
  String tkhoannban;
  String nhangnban;
  String faxnban;
  String emailnban;
  String ghiChu;
  dynamic contentxml;
  String barcode;
  String mota;
  int tongtienthuente;
  String tongtienthuenteStr;
  String confirm;
  String check;
  String flagFee;
  String flagGiayTuin;
  dynamic maKeyGopExcel;
  dynamic trnRefNo;
  dynamic relatedCustomer;
  dynamic uniqueId;
  dynamic extRef;
  String tongtienttoanbchuVnd;
  dynamic branchName;
  dynamic invoiceKey;
  dynamic adjustmentInvoice;
  dynamic sttHdUpload;
  dynamic mustToSign;
  dynamic hoadondacthu;
  dynamic tthaicqt;
  dynamic magdichthamchieu;
  dynamic macqtcap;
  dynamic userName;
  String checkInChuyenDoi;
  int tongtienthuevnd;
  String tongtienthuevndStr;
  int tongthuesuat5Nte;
  int tongthuesuat5Vnd;
  int tongthuesuat8Nte;
  int tongthuesuat8Vnd;
  int tongthuesuat10Nte;
  int tongthuesuat10Vnd;
  int tongthuesuatthuekhacnte;
  int tongthuesuatthuekhacvnd;
  int tongthuesuat0Nte;
  int tongthuesuat0Vnd;
  int khongchiuthuegtgt;
  int mienthuegtgt;
  int thueTang;
  int thueGiam;
  int tongTToanTang;
  int tongTToanGiam;
  String lyDoDChinh;
  int tongtienthuedchinhtanggiam;
  int tongtienttoandchinhtanggiam;
  dynamic tongtienthuedchinhtanggiamStr;
  dynamic tongtienttoandchinhtanggiamStr;
  String pbanxml;
  String messReceived;
  String hDongVchuyen;
  int idNguoilap;
  String vanId;
  String lydotuchoi;
  dynamic detail;
  dynamic listOfProduct;
  String soLenhDDong;
  dynamic ngayDDong;
  String nguoiDDong;
  String lDoDDong;
  String maGdich;
  int tongtientruocthue10Nte;
  int tongtientruocthue8Nte;
  int tongtientruocthue5Nte;
  int tongtientruocthue0Nte;
  int tongtientruocthuekchiuthuente;
  int tongtientruocthuemienthuente;
  int tongtientruocthuethuekhacnte;
  int tongtientruocthue10Vnd;
  int tongtientruocthue8Vnd;
  int tongtientruocthue5Vnd;
  int tongtientruocthue0Vnd;
  int tongtientruocthuekchiuthuevnd;
  int tongtientruocthuemienthuevnd;
  int tongtientruocthuethuekhacvnd;
  int tongtiensauthue10Nte;
  int tongtiensauthue8Nte;
  int tongtiensauthue5Nte;
  int tongtiensauthue0Nte;
  int tongtiensauthuekchiuthuente;
  int tongtiensauthuemienthuevnd;
  int tongtiensauthuethuekhacvnd;
  int tongtiensauthue10Vnd;
  int tongtiensauthue8Vnd;
  int tongtiensauthue5Vnd;
  int tongtiensauthue0Vnd;
  int tongtiensauthuekchiuthuevnd;
  int tongtiensauthuemienthuente;
  int tongtiensauthuethuekhacnte;
  int updateTime;
  String cdKhieuhdon;
  String cdMauhdon;
  String cdSohdon;
  String hdongiay;
  int tongTienTToanGiay;
  int tongTienThueGtgtGiay;
  String hThucHDon;
  String kyDienTu;
  int fee;
  int feeVat;
  dynamic wfProcessId;
  String wfStatus;
  dynamic wfUpdateTime;
  String status;
  dynamic loaiDieuChinh;
  int level;
  dynamic qrcode;
  dynamic lstInvOtherInfoBan;
  dynamic lstInvOtherInfoMua;
  dynamic lstInvOtherInfoTToan;
  dynamic lstInvOtherInfoLePhiKhac;
  dynamic lstInvOtherInfoCthd;
  dynamic tongcongthucxuat;
  String isTt68;
  dynamic signDescError;
  dynamic job;
  String tinhchatgoc;
  int sluongdcdd;
  int sluongdcCopy;
  dynamic checkBanNhap;
  dynamic ngayLapFormat;
  dynamic corpId;
  String hthucHDonGoc;

  factory InReq.fromJson(Map<String, dynamic> json) => InReq(
    channelCode: json["channelCode"] == null ? null : json["channelCode"],
    typehdongoc: json["typehdongoc"] == null ? null : json["typehdongoc"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    lyDoXoaBo: json["lyDoXoaBo"] == null ? null : json["lyDoXoaBo"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    faxnmua: json["faxnmua"] == null ? null : json["faxnmua"],
    hthuctoan: json["hthuctoan"] == null ? null : json["hthuctoan"],
    hthuctoankhac: json["hthuctoankhac"] == null ? null : json["hthuctoankhac"],
    id: json["id"] == null ? null : json["id"],
    idGoc: json["idGoc"] == null ? null : json["idGoc"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    macqt: json["macqt"] == null ? null : json["macqt"],
    tencqt: json["tencqt"] == null ? null : json["tencqt"],
    maktra: json["maktra"] == null ? null : json["maktra"],
    matte: json["matte"] == null ? null : json["matte"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    mstNban: json["mstNban"] == null ? null : json["mstNban"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    ngayduyet: json["ngayduyet"],
    ngayhdcqt: json["ngayhdcqt"],
    ngayLap: json["ngayLap"] == null ? null : json["ngayLap"],
    ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
    ngayhdong: json["ngayhdong"],
    ngayvban: json["ngayvban"] == null ? null : json["ngayvban"],
    ngayvbanStr: json["ngayvbanStr"] == null ? null : json["ngayvbanStr"],
    nguoiduyet: json["nguoiduyet"] == null ? null : json["nguoiduyet"],
    nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
    nguoivchuyen: json["nguoivchuyen"] == null ? null : json["nguoivchuyen"],
    nhangnmua: json["nhangnmua"] == null ? null : json["nhangnmua"],
    ptienvchuyen: json["ptienvchuyen"] == null ? null : json["ptienvchuyen"],
    sohdcqt: json["sohdcqt"] == null ? null : json["sohdcqt"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    sohdong: json["sohdong"] == null ? null : json["sohdong"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    ngayCqThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
    sovban: json["sovban"] == null ? null : json["sovban"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    tenhdong: json["tenhdong"] == null ? null : json["tenhdong"],
    tenknhap: json["tenknhap"] == null ? null : json["tenknhap"],
    tenkxuat: json["tenkxuat"] == null ? null : json["tenkxuat"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    tgia: json["tgia"] == null ? null : json["tgia"],
    tgiaStr: json["tgiaStr"] == null ? null : json["tgiaStr"],
    tkhoannmua: json["tkhoannmua"] == null ? null : json["tkhoannmua"],
    tongtienckhaunte: json["tongtienckhaunte"] == null ? null : json["tongtienckhaunte"],
    tongtienckhauvnd: json["tongtienckhauvnd"] == null ? null : json["tongtienckhauvnd"],
    tongtiennte: json["tongtiennte"] == null ? null : json["tongtiennte"],
    tongtienttoanbchu: json["tongtienttoanbchu"] == null ? null : json["tongtienttoanbchu"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    tongtienttoannteStr: json["tongtienttoannteStr"] == null ? null : json["tongtienttoannteStr"],
    tongtienttoanvnd: json["tongtienttoanvnd"] == null ? null : json["tongtienttoanvnd"],
    tongtienhangtruocthue: json["tongtienhangtruocthue"] == null ? null : json["tongtienhangtruocthue"],
    tongtienhangtruocthuevnd: json["tongtienhangtruocthuevnd"] == null ? null : json["tongtienhangtruocthuevnd"],
    tongtienttoanvndStr: json["tongtienttoanvndStr"] == null ? null : json["tongtienttoanvndStr"],
    tongtienvnd: json["tongtienvnd"] == null ? null : json["tongtienvnd"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    tennban: json["tennban"] == null ? null : json["tennban"],
    dchinban: json["dchinban"] == null ? null : json["dchinban"],
    dthoainban: json["dthoainban"] == null ? null : json["dthoainban"],
    tkhoannban: json["tkhoannban"] == null ? null : json["tkhoannban"],
    nhangnban: json["nhangnban"] == null ? null : json["nhangnban"],
    faxnban: json["faxnban"] == null ? null : json["faxnban"],
    emailnban: json["emailnban"] == null ? null : json["emailnban"],
    ghiChu: json["ghiChu"] == null ? null : json["ghiChu"],
    contentxml: json["contentxml"],
    barcode: json["barcode"] == null ? null : json["barcode"],
    mota: json["mota"] == null ? null : json["mota"],
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienthuenteStr: json["tongtienthuenteStr"] == null ? null : json["tongtienthuenteStr"],
    confirm: json["confirm"] == null ? null : json["confirm"],
    check: json["check"] == null ? null : json["check"],
    flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
    flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
    maKeyGopExcel: json["maKeyGopExcel"],
    trnRefNo: json["trn_ref_no"],
    relatedCustomer: json["related_customer"],
    uniqueId: json["unique_id"],
    extRef: json["ext_ref"],
    tongtienttoanbchuVnd: json["tongtienttoanbchu_vnd"] == null ? null : json["tongtienttoanbchu_vnd"],
    branchName: json["branch_name"],
    invoiceKey: json["invoice_key"],
    adjustmentInvoice: json["adjustmentInvoice"],
    sttHdUpload: json["sttHDUpload"],
    mustToSign: json["must_to_sign"],
    hoadondacthu: json["hoadondacthu"],
    tthaicqt: json["tthaicqt"],
    magdichthamchieu: json["magdichthamchieu"],
    macqtcap: json["macqtcap"],
    userName: json["user_name"],
    checkInChuyenDoi: json["checkInChuyenDoi"] == null ? null : json["checkInChuyenDoi"],
    tongtienthuevnd: json["tongtienthuevnd"] == null ? null : json["tongtienthuevnd"],
    tongtienthuevndStr: json["tongtienthuevndStr"] == null ? null : json["tongtienthuevndStr"],
    tongthuesuat5Nte: json["tongthuesuat5nte"] == null ? null : json["tongthuesuat5nte"],
    tongthuesuat5Vnd: json["tongthuesuat5vnd"] == null ? null : json["tongthuesuat5vnd"],
    tongthuesuat8Nte: json["tongthuesuat8nte"] == null ? null : json["tongthuesuat8nte"],
    tongthuesuat8Vnd: json["tongthuesuat8vnd"] == null ? null : json["tongthuesuat8vnd"],
    tongthuesuat10Nte: json["tongthuesuat10nte"] == null ? null : json["tongthuesuat10nte"],
    tongthuesuat10Vnd: json["tongthuesuat10vnd"] == null ? null : json["tongthuesuat10vnd"],
    tongthuesuatthuekhacnte: json["tongthuesuatthuekhacnte"] == null ? null : json["tongthuesuatthuekhacnte"],
    tongthuesuatthuekhacvnd: json["tongthuesuatthuekhacvnd"] == null ? null : json["tongthuesuatthuekhacvnd"],
    tongthuesuat0Nte: json["tongthuesuat0nte"] == null ? null : json["tongthuesuat0nte"],
    tongthuesuat0Vnd: json["tongthuesuat0vnd"] == null ? null : json["tongthuesuat0vnd"],
    khongchiuthuegtgt: json["khongchiuthuegtgt"] == null ? null : json["khongchiuthuegtgt"],
    mienthuegtgt: json["mienthuegtgt"] == null ? null : json["mienthuegtgt"],
    thueTang: json["thueTang"] == null ? null : json["thueTang"],
    thueGiam: json["thueGiam"] == null ? null : json["thueGiam"],
    tongTToanTang: json["tongTToanTang"] == null ? null : json["tongTToanTang"],
    tongTToanGiam: json["tongTToanGiam"] == null ? null : json["tongTToanGiam"],
    lyDoDChinh: json["lyDoDChinh"] == null ? null : json["lyDoDChinh"],
    tongtienthuedchinhtanggiam: json["tongtienthuedchinhtanggiam"] == null ? null : json["tongtienthuedchinhtanggiam"],
    tongtienttoandchinhtanggiam: json["tongtienttoandchinhtanggiam"] == null ? null : json["tongtienttoandchinhtanggiam"],
    tongtienthuedchinhtanggiamStr: json["tongtienthuedchinhtanggiamStr"],
    tongtienttoandchinhtanggiamStr: json["tongtienttoandchinhtanggiamStr"],
    pbanxml: json["pbanxml"] == null ? null : json["pbanxml"],
    messReceived: json["messReceived"] == null ? null : json["messReceived"],
    hDongVchuyen: json["hDongVchuyen"] == null ? null : json["hDongVchuyen"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    vanId: json["van_id"] == null ? null : json["van_id"],
    lydotuchoi: json["lydotuchoi"] == null ? null : json["lydotuchoi"],
    detail: json["detail"],
    listOfProduct: json["listOfProduct"],
    soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],
    ngayDDong: json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
    lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
    maGdich: json["ma_gdich"] == null ? null : json["ma_gdich"],
    tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
    tongtientruocthue8Nte: json["tongtientruocthue8nte"] == null ? null : json["tongtientruocthue8nte"],
    tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
    tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
    tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
    tongtientruocthuemienthuente: json["tongtientruocthuemienthuente"] == null ? null : json["tongtientruocthuemienthuente"],
    tongtientruocthuethuekhacnte: json["tongtientruocthuethuekhacnte"] == null ? null : json["tongtientruocthuethuekhacnte"],
    tongtientruocthue10Vnd: json["tongtientruocthue10vnd"] == null ? null : json["tongtientruocthue10vnd"],
    tongtientruocthue8Vnd: json["tongtientruocthue8vnd"] == null ? null : json["tongtientruocthue8vnd"],
    tongtientruocthue5Vnd: json["tongtientruocthue5vnd"] == null ? null : json["tongtientruocthue5vnd"],
    tongtientruocthue0Vnd: json["tongtientruocthue0vnd"] == null ? null : json["tongtientruocthue0vnd"],
    tongtientruocthuekchiuthuevnd: json["tongtientruocthuekchiuthuevnd"] == null ? null : json["tongtientruocthuekchiuthuevnd"],
    tongtientruocthuemienthuevnd: json["tongtientruocthuemienthuevnd"] == null ? null : json["tongtientruocthuemienthuevnd"],
    tongtientruocthuethuekhacvnd: json["tongtientruocthuethuekhacvnd"] == null ? null : json["tongtientruocthuethuekhacvnd"],
    tongtiensauthue10Nte: json["tongtiensauthue10nte"] == null ? null : json["tongtiensauthue10nte"],
    tongtiensauthue8Nte: json["tongtiensauthue8nte"] == null ? null : json["tongtiensauthue8nte"],
    tongtiensauthue5Nte: json["tongtiensauthue5nte"] == null ? null : json["tongtiensauthue5nte"],
    tongtiensauthue0Nte: json["tongtiensauthue0nte"] == null ? null : json["tongtiensauthue0nte"],
    tongtiensauthuekchiuthuente: json["tongtiensauthuekchiuthuente"] == null ? null : json["tongtiensauthuekchiuthuente"],
    tongtiensauthuemienthuevnd: json["tongtiensauthuemienthuevnd"] == null ? null : json["tongtiensauthuemienthuevnd"],
    tongtiensauthuethuekhacvnd: json["tongtiensauthuethuekhacvnd"] == null ? null : json["tongtiensauthuethuekhacvnd"],
    tongtiensauthue10Vnd: json["tongtiensauthue10vnd"] == null ? null : json["tongtiensauthue10vnd"],
    tongtiensauthue8Vnd: json["tongtiensauthue8vnd"] == null ? null : json["tongtiensauthue8vnd"],
    tongtiensauthue5Vnd: json["tongtiensauthue5vnd"] == null ? null : json["tongtiensauthue5vnd"],
    tongtiensauthue0Vnd: json["tongtiensauthue0vnd"] == null ? null : json["tongtiensauthue0vnd"],
    tongtiensauthuekchiuthuevnd: json["tongtiensauthuekchiuthuevnd"] == null ? null : json["tongtiensauthuekchiuthuevnd"],
    tongtiensauthuemienthuente: json["tongtiensauthuemienthuente"] == null ? null : json["tongtiensauthuemienthuente"],
    tongtiensauthuethuekhacnte: json["tongtiensauthuethuekhacnte"] == null ? null : json["tongtiensauthuethuekhacnte"],
    updateTime: json["update_time"] == null ? null : json["update_time"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    cdSohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
    hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
    tongTienTToanGiay: json["tongTienTToanGiay"] == null ? null : json["tongTienTToanGiay"],
    tongTienThueGtgtGiay: json["tongTienThueGTGTGiay"] == null ? null : json["tongTienThueGTGTGiay"],
    hThucHDon: json["hThucHDon"] == null ? null : json["hThucHDon"],
    kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
    fee: json["fee"] == null ? null : json["fee"],
    feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
    wfProcessId: json["wf_process_id"],
    wfStatus: json["wf_status"] == null ? null : json["wf_status"],
    wfUpdateTime: json["wf_update_time"],
    status: json["status"] == null ? null : json["status"],
    loaiDieuChinh: json["loai_dieu_chinh"],
    level: json["level"] == null ? null : json["level"],
    qrcode: json["qrcode"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"],
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"],
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"],
    lstInvOtherInfoLePhiKhac: json["lstInvOtherInfoLePhiKhac"],
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"],
    tongcongthucxuat: json["tongcongthucxuat"],
    isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
    signDescError: json["sign_desc_error"],
    job: json["job"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    sluongdcdd: json["sluongdcdd"] == null ? null : json["sluongdcdd"],
    sluongdcCopy: json["sluongdcCopy"] == null ? null : json["sluongdcCopy"],
    checkBanNhap: json["checkBanNhap"],
    ngayLapFormat: json["ngayLapFormat"],
    corpId: json["corpID"],
    hthucHDonGoc: json["hthucHDonGoc"] == null ? null : json["hthucHDonGoc"],
  );

  Map<String, dynamic> toJson() => {
    "channelCode": channelCode == null ? null : channelCode,
    "typehdongoc": typehdongoc == null ? null : typehdongoc,
    "serviceType": serviceType == null ? null : serviceType,
    "lyDoXoaBo": lyDoXoaBo == null ? null : lyDoXoaBo,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "dthoainmua": dthoainmua == null ? null : dthoainmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "faxnmua": faxnmua == null ? null : faxnmua,
    "hthuctoan": hthuctoan == null ? null : hthuctoan,
    "hthuctoankhac": hthuctoankhac == null ? null : hthuctoankhac,
    "id": id == null ? null : id,
    "idGoc": idGoc == null ? null : idGoc,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "macqt": macqt == null ? null : macqt,
    "tencqt": tencqt == null ? null : tencqt,
    "maktra": maktra == null ? null : maktra,
    "matte": matte == null ? null : matte,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "mstNban": mstNban == null ? null : mstNban,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "ngayduyet": ngayduyet,
    "ngayhdcqt": ngayhdcqt,
    "ngayLap": ngayLap == null ? null : ngayLap,
    "ngayhdon": ngayhdon == null ? null : ngayhdon,
    "ngayhdong": ngayhdong,
    "ngayvban": ngayvban == null ? null : ngayvban,
    "ngayvbanStr": ngayvbanStr == null ? null : ngayvbanStr,
    "nguoiduyet": nguoiduyet == null ? null : nguoiduyet,
    "nguoilap": nguoilap == null ? null : nguoilap,
    "nguoivchuyen": nguoivchuyen == null ? null : nguoivchuyen,
    "nhangnmua": nhangnmua == null ? null : nhangnmua,
    "ptienvchuyen": ptienvchuyen == null ? null : ptienvchuyen,
    "sohdcqt": sohdcqt == null ? null : sohdcqt,
    "sohdon": sohdon == null ? null : sohdon,
    "sohdong": sohdong == null ? null : sohdong,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "ngayCQThdongoc": ngayCqThdongoc == null ? null : ngayCqThdongoc,
    "sovban": sovban == null ? null : sovban,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "tenhdong": tenhdong == null ? null : tenhdong,
    "tenknhap": tenknhap == null ? null : tenknhap,
    "tenkxuat": tenkxuat == null ? null : tenkxuat,
    "tennmua": tennmua == null ? null : tennmua,
    "tgia": tgia == null ? null : tgia,
    "tgiaStr": tgiaStr == null ? null : tgiaStr,
    "tkhoannmua": tkhoannmua == null ? null : tkhoannmua,
    "tongtienckhaunte": tongtienckhaunte == null ? null : tongtienckhaunte,
    "tongtienckhauvnd": tongtienckhauvnd == null ? null : tongtienckhauvnd,
    "tongtiennte": tongtiennte == null ? null : tongtiennte,
    "tongtienttoanbchu": tongtienttoanbchu == null ? null : tongtienttoanbchu,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "tongtienttoannteStr": tongtienttoannteStr == null ? null : tongtienttoannteStr,
    "tongtienttoanvnd": tongtienttoanvnd == null ? null : tongtienttoanvnd,
    "tongtienhangtruocthue": tongtienhangtruocthue == null ? null : tongtienhangtruocthue,
    "tongtienhangtruocthuevnd": tongtienhangtruocthuevnd == null ? null : tongtienhangtruocthuevnd,
    "tongtienttoanvndStr": tongtienttoanvndStr == null ? null : tongtienttoanvndStr,
    "tongtienvnd": tongtienvnd == null ? null : tongtienvnd,
    "trangthai": trangthai == null ? null : trangthai,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "tennban": tennban == null ? null : tennban,
    "dchinban": dchinban == null ? null : dchinban,
    "dthoainban": dthoainban == null ? null : dthoainban,
    "tkhoannban": tkhoannban == null ? null : tkhoannban,
    "nhangnban": nhangnban == null ? null : nhangnban,
    "faxnban": faxnban == null ? null : faxnban,
    "emailnban": emailnban == null ? null : emailnban,
    "ghiChu": ghiChu == null ? null : ghiChu,
    "contentxml": contentxml,
    "barcode": barcode == null ? null : barcode,
    "mota": mota == null ? null : mota,
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienthuenteStr": tongtienthuenteStr == null ? null : tongtienthuenteStr,
    "confirm": confirm == null ? null : confirm,
    "check": check == null ? null : check,
    "flag_fee": flagFee == null ? null : flagFee,
    "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
    "maKeyGopExcel": maKeyGopExcel,
    "trn_ref_no": trnRefNo,
    "related_customer": relatedCustomer,
    "unique_id": uniqueId,
    "ext_ref": extRef,
    "tongtienttoanbchu_vnd": tongtienttoanbchuVnd == null ? null : tongtienttoanbchuVnd,
    "branch_name": branchName,
    "invoice_key": invoiceKey,
    "adjustmentInvoice": adjustmentInvoice,
    "sttHDUpload": sttHdUpload,
    "must_to_sign": mustToSign,
    "hoadondacthu": hoadondacthu,
    "tthaicqt": tthaicqt,
    "magdichthamchieu": magdichthamchieu,
    "macqtcap": macqtcap,
    "user_name": userName,
    "checkInChuyenDoi": checkInChuyenDoi == null ? null : checkInChuyenDoi,
    "tongtienthuevnd": tongtienthuevnd == null ? null : tongtienthuevnd,
    "tongtienthuevndStr": tongtienthuevndStr == null ? null : tongtienthuevndStr,
    "tongthuesuat5nte": tongthuesuat5Nte == null ? null : tongthuesuat5Nte,
    "tongthuesuat5vnd": tongthuesuat5Vnd == null ? null : tongthuesuat5Vnd,
    "tongthuesuat8nte": tongthuesuat8Nte == null ? null : tongthuesuat8Nte,
    "tongthuesuat8vnd": tongthuesuat8Vnd == null ? null : tongthuesuat8Vnd,
    "tongthuesuat10nte": tongthuesuat10Nte == null ? null : tongthuesuat10Nte,
    "tongthuesuat10vnd": tongthuesuat10Vnd == null ? null : tongthuesuat10Vnd,
    "tongthuesuatthuekhacnte": tongthuesuatthuekhacnte == null ? null : tongthuesuatthuekhacnte,
    "tongthuesuatthuekhacvnd": tongthuesuatthuekhacvnd == null ? null : tongthuesuatthuekhacvnd,
    "tongthuesuat0nte": tongthuesuat0Nte == null ? null : tongthuesuat0Nte,
    "tongthuesuat0vnd": tongthuesuat0Vnd == null ? null : tongthuesuat0Vnd,
    "khongchiuthuegtgt": khongchiuthuegtgt == null ? null : khongchiuthuegtgt,
    "mienthuegtgt": mienthuegtgt == null ? null : mienthuegtgt,
    "thueTang": thueTang == null ? null : thueTang,
    "thueGiam": thueGiam == null ? null : thueGiam,
    "tongTToanTang": tongTToanTang == null ? null : tongTToanTang,
    "tongTToanGiam": tongTToanGiam == null ? null : tongTToanGiam,
    "lyDoDChinh": lyDoDChinh == null ? null : lyDoDChinh,
    "tongtienthuedchinhtanggiam": tongtienthuedchinhtanggiam == null ? null : tongtienthuedchinhtanggiam,
    "tongtienttoandchinhtanggiam": tongtienttoandchinhtanggiam == null ? null : tongtienttoandchinhtanggiam,
    "tongtienthuedchinhtanggiamStr": tongtienthuedchinhtanggiamStr,
    "tongtienttoandchinhtanggiamStr": tongtienttoandchinhtanggiamStr,
    "pbanxml": pbanxml == null ? null : pbanxml,
    "messReceived": messReceived == null ? null : messReceived,
    "hDongVchuyen": hDongVchuyen == null ? null : hDongVchuyen,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "van_id": vanId == null ? null : vanId,
    "lydotuchoi": lydotuchoi == null ? null : lydotuchoi,
    "detail": detail,
    "listOfProduct": listOfProduct,
    "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,
    "ngayDDong": ngayDDong,
    "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
    "lDoDDong": lDoDDong == null ? null : lDoDDong,
    "ma_gdich": maGdich == null ? null : maGdich,
    "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
    "tongtientruocthue8nte": tongtientruocthue8Nte == null ? null : tongtientruocthue8Nte,
    "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
    "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
    "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
    "tongtientruocthuemienthuente": tongtientruocthuemienthuente == null ? null : tongtientruocthuemienthuente,
    "tongtientruocthuethuekhacnte": tongtientruocthuethuekhacnte == null ? null : tongtientruocthuethuekhacnte,
    "tongtientruocthue10vnd": tongtientruocthue10Vnd == null ? null : tongtientruocthue10Vnd,
    "tongtientruocthue8vnd": tongtientruocthue8Vnd == null ? null : tongtientruocthue8Vnd,
    "tongtientruocthue5vnd": tongtientruocthue5Vnd == null ? null : tongtientruocthue5Vnd,
    "tongtientruocthue0vnd": tongtientruocthue0Vnd == null ? null : tongtientruocthue0Vnd,
    "tongtientruocthuekchiuthuevnd": tongtientruocthuekchiuthuevnd == null ? null : tongtientruocthuekchiuthuevnd,
    "tongtientruocthuemienthuevnd": tongtientruocthuemienthuevnd == null ? null : tongtientruocthuemienthuevnd,
    "tongtientruocthuethuekhacvnd": tongtientruocthuethuekhacvnd == null ? null : tongtientruocthuethuekhacvnd,
    "tongtiensauthue10nte": tongtiensauthue10Nte == null ? null : tongtiensauthue10Nte,
    "tongtiensauthue8nte": tongtiensauthue8Nte == null ? null : tongtiensauthue8Nte,
    "tongtiensauthue5nte": tongtiensauthue5Nte == null ? null : tongtiensauthue5Nte,
    "tongtiensauthue0nte": tongtiensauthue0Nte == null ? null : tongtiensauthue0Nte,
    "tongtiensauthuekchiuthuente": tongtiensauthuekchiuthuente == null ? null : tongtiensauthuekchiuthuente,
    "tongtiensauthuemienthuevnd": tongtiensauthuemienthuevnd == null ? null : tongtiensauthuemienthuevnd,
    "tongtiensauthuethuekhacvnd": tongtiensauthuethuekhacvnd == null ? null : tongtiensauthuethuekhacvnd,
    "tongtiensauthue10vnd": tongtiensauthue10Vnd == null ? null : tongtiensauthue10Vnd,
    "tongtiensauthue8vnd": tongtiensauthue8Vnd == null ? null : tongtiensauthue8Vnd,
    "tongtiensauthue5vnd": tongtiensauthue5Vnd == null ? null : tongtiensauthue5Vnd,
    "tongtiensauthue0vnd": tongtiensauthue0Vnd == null ? null : tongtiensauthue0Vnd,
    "tongtiensauthuekchiuthuevnd": tongtiensauthuekchiuthuevnd == null ? null : tongtiensauthuekchiuthuevnd,
    "tongtiensauthuemienthuente": tongtiensauthuemienthuente == null ? null : tongtiensauthuemienthuente,
    "tongtiensauthuethuekhacnte": tongtiensauthuethuekhacnte == null ? null : tongtiensauthuethuekhacnte,
    "update_time": updateTime == null ? null : updateTime,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "cd_sohdon": cdSohdon == null ? null : cdSohdon,
    "hdongiay": hdongiay == null ? null : hdongiay,
    "tongTienTToanGiay": tongTienTToanGiay == null ? null : tongTienTToanGiay,
    "tongTienThueGTGTGiay": tongTienThueGtgtGiay == null ? null : tongTienThueGtgtGiay,
    "hThucHDon": hThucHDon == null ? null : hThucHDon,
    "kyDienTu": kyDienTu == null ? null : kyDienTu,
    "fee": fee == null ? null : fee,
    "fee_vat": feeVat == null ? null : feeVat,
    "wf_process_id": wfProcessId,
    "wf_status": wfStatus == null ? null : wfStatus,
    "wf_update_time": wfUpdateTime,
    "status": status == null ? null : status,
    "loai_dieu_chinh": loaiDieuChinh,
    "level": level == null ? null : level,
    "qrcode": qrcode,
    "lstInvOtherInfoBan": lstInvOtherInfoBan,
    "lstInvOtherInfoMua": lstInvOtherInfoMua,
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan,
    "lstInvOtherInfoLePhiKhac": lstInvOtherInfoLePhiKhac,
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd,
    "tongcongthucxuat": tongcongthucxuat,
    "is_tt68": isTt68 == null ? null : isTt68,
    "sign_desc_error": signDescError,
    "job": job,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "sluongdcdd": sluongdcdd == null ? null : sluongdcdd,
    "sluongdcCopy": sluongdcCopy == null ? null : sluongdcCopy,
    "checkBanNhap": checkBanNhap,
    "ngayLapFormat": ngayLapFormat,
    "corpID": corpId,
    "hthucHDonGoc": hthucHDonGoc == null ? null : hthucHDonGoc,
  };
}
