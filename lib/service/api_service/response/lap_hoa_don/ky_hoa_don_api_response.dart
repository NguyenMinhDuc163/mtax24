// To parse this JSON data, do
//
//     final kyHoaDonApiResponse = kyHoaDonApiResponseFromJson(jsonString);

import 'dart:convert';

KyHoaDonApiResponse kyHoaDonApiResponseFromJson(String str) => KyHoaDonApiResponse.fromJson(json.decode(str));

String kyHoaDonApiResponseToJson(KyHoaDonApiResponse data) => json.encode(data.toJson());

class KyHoaDonApiResponse {
  KyHoaDonApiResponse({
    this.iccinvhdr,
    this.txStatus,
    this.htmlContent,
    this.showWarning,
    this.countRemain,
  });

  final Iccinvhdr iccinvhdr;
  final TxStatus txStatus;
  final dynamic htmlContent;
  final bool showWarning;
  final dynamic countRemain;

  factory KyHoaDonApiResponse.fromJson(Map<String, dynamic> json) => KyHoaDonApiResponse(
    iccinvhdr: json["iccinvhdr"] == null ? null : Iccinvhdr.fromJson(json["iccinvhdr"]),
    txStatus: json["txStatus"] == null ? null : TxStatus.fromJson(json["txStatus"]),
    htmlContent: json["htmlContent"],
    showWarning: json["showWarning"] == null ? null : json["showWarning"],
    countRemain: json["countRemain"] == null ? null : json["countRemain"],
  );

  Map<String, dynamic> toJson() => {
    "iccinvhdr": iccinvhdr == null ? null : iccinvhdr.toJson(),
    "txStatus": txStatus == null ? null : txStatus.toJson(),
    "htmlContent": htmlContent,
    "showWarning": showWarning == null ? null : showWarning,
    "countRemain": countRemain == null ? null : countRemain,
  };
}

class Iccinvhdr {
  Iccinvhdr({
    this.channelCode,
    this.typehdongoc,
    this.serviceType,
    this.lyDoXoaBo,
    this.dchinmua,
    this.dthoainmua,
    this.emailnmua,
    this.faxnmua,
    this.hthuctoan,
    this.hthuctoankhac,
    this.id,
    this.idGoc,
    this.khieuhdon,
    this.loaihdon,
    this.macqt,
    this.tencqt,
    this.maktra,
    this.matte,
    this.mauhdon,
    this.mstNban,
    this.mstNmua,
    this.ngayduyet,
    this.ngayhdcqt,
    this.ngayLap,
    this.ngayhdon,
    this.ngayhdong,
    this.ngayvban,
    this.ngayvbanStr,
    this.nguoiduyet,
    this.nguoilap,
    this.nguoivchuyen,
    this.nhangnmua,
    this.ptienvchuyen,
    this.sohdcqt,
    this.sohdon,
    this.sohdong,
    this.sohdongoc,
    this.ngayCqThdongoc,
    this.sovban,
    this.tendvinmua,
    this.tenhdon,
    this.tenhdong,
    this.tenknhap,
    this.tenkxuat,
    this.tennmua,
    this.tgia,
    this.tgiaStr,
    this.tkhoannmua,
    this.tongtienckhaunte,
    this.tongtienckhauvnd,
    this.tongtiennte,
    this.tongtienttoanbchu,
    this.tongtienttoannte,
    this.tongtienttoannteStr,
    this.tongtienttoanvnd,
    this.tongtienhangtruocthue,
    this.tongtienhangtruocthuevnd,
    this.tongtienttoanvndStr,
    this.tongtienvnd,
    this.trangthai,
    this.tinhChat,
    this.tennban,
    this.dchinban,
    this.dthoainban,
    this.tkhoannban,
    this.nhangnban,
    this.faxnban,
    this.emailnban,
    this.ghiChu,
    this.contentxml,
    this.barcode,
    this.mota,
    this.tongtienthuente,
    this.tongtienthuenteStr,
    this.confirm,
    this.check,
    this.flagFee,
    this.flagGiayTuin,
    this.maKeyGopExcel,
    this.trnRefNo,
    this.relatedCustomer,
    this.uniqueId,
    this.extRef,
    this.tongtienttoanbchuVnd,
    this.branchName,
    this.invoiceKey,
    this.adjustmentInvoice,
    this.sttHdUpload,
    this.mustToSign,
    this.hoadondacthu,
    this.userName,
    this.checkInChuyenDoi,
    this.tongtienthuevnd,
    this.tongtienthuevndStr,
    this.tongthuesuat5Nte,
    this.tongthuesuat5Vnd,
    this.tongthuesuat10Nte,
    this.tongthuesuat10Vnd,
    this.tongthuesuatthuekhacnte,
    this.tongthuesuatthuekhacvnd,
    this.tongthuesuat0Nte,
    this.tongthuesuat0Vnd,
    this.khongchiuthuegtgt,
    this.mienthuegtgt,
    this.thueTang,
    this.thueGiam,
    this.tongTToanTang,
    this.tongTToanGiam,
    this.lyDoDChinh,
    this.tongtienthuedchinhtanggiam,
    this.tongtienttoandchinhtanggiam,
    this.tongtienthuedchinhtanggiamStr,
    this.tongtienttoandchinhtanggiamStr,
    this.pbanxml,
    this.messReceived,
    this.hDongVchuyen,
    this.idNguoilap,
    this.vanId,
    this.lydotuchoi,
    this.detail,
    this.listOfProduct,
    this.soLenhDDong,
    this.ngayDDong,
    this.nguoiDDong,
    this.lDoDDong,
    this.maGdich,
    this.tongtientruocthue10Nte,
    this.tongtientruocthue5Nte,
    this.tongtientruocthue0Nte,
    this.tongtientruocthuekchiuthuente,
    this.tongtientruocthuemienthuente,
    this.tongtientruocthuethuekhacnte,
    this.tongtientruocthue10Vnd,
    this.tongtientruocthue5Vnd,
    this.tongtientruocthue0Vnd,
    this.tongtientruocthuekchiuthuevnd,
    this.tongtientruocthuemienthuevnd,
    this.tongtientruocthuethuekhacvnd,
    this.tongtiensauthue10Nte,
    this.tongtiensauthue5Nte,
    this.tongtiensauthue0Nte,
    this.tongtiensauthuekchiuthuente,
    this.tongtiensauthuemienthuevnd,
    this.tongtiensauthuethuekhacvnd,
    this.tongtiensauthue10Vnd,
    this.tongtiensauthue5Vnd,
    this.tongtiensauthue0Vnd,
    this.tongtiensauthuekchiuthuevnd,
    this.tongtiensauthuemienthuente,
    this.tongtiensauthuethuekhacnte,
    this.updateTime,
    this.cdKhieuhdon,
    this.cdMauhdon,
    this.cdSohdon,
    this.hdongiay,
    this.tongTienTToanGiay,
    this.tongTienThueGtgtGiay,
    this.hThucHDon,
    this.kyDienTu,
    this.fee,
    this.feeVat,
    this.wfProcessId,
    this.wfStatus,
    this.wfUpdateTime,
    this.status,
    this.loaiDieuChinh,
    this.level,
    this.qrcode,
    this.lstInvOtherInfoBan,
    this.lstInvOtherInfoMua,
    this.lstInvOtherInfoTToan,
    this.lstInvOtherInfoLePhiKhac,
    this.lstInvOtherInfoCthd,
    this.tongcongthucxuat,
    this.isTt68,
    this.signDescError,
    this.tinhchatgoc,
    this.sluongdcdd,
    this.sluongdcCopy,
    this.checkBanNhap,
    this.ngayLapFormat,
    this.corpId,
    this.hthucHDonGoc,
  });

  final String channelCode;
  final String typehdongoc;
  final String serviceType;
  final String lyDoXoaBo;
  final String dchinmua;
  final String dthoainmua;
  final String emailnmua;
  final String faxnmua;
  final String hthuctoan;
  final String hthuctoankhac;
  final dynamic id;
  final dynamic idGoc;
  final String khieuhdon;
  final String loaihdon;
  final String macqt;
  final String tencqt;
  final String maktra;
  final String matte;
  final String mauhdon;
  final String mstNban;
  final String mstNmua;
  final dynamic ngayduyet;
  final dynamic ngayhdcqt;
  final dynamic ngayLap;
  final dynamic ngayhdon;
  final dynamic ngayhdong;
  final dynamic ngayvban;
  final String ngayvbanStr;
  final String nguoiduyet;
  final String nguoilap;
  final String nguoivchuyen;
  final String nhangnmua;
  final String ptienvchuyen;
  final String sohdcqt;
  final String sohdon;
  final String sohdong;
  final String sohdongoc;
  final String ngayCqThdongoc;
  final String sovban;
  final String tendvinmua;
  final String tenhdon;
  final String tenhdong;
  final String tenknhap;
  final String tenkxuat;
  final String tennmua;
  final dynamic tgia;
  final String tgiaStr;
  final String tkhoannmua;
  final dynamic tongtienckhaunte;
  final dynamic tongtienckhauvnd;
  final dynamic tongtiennte;
  final String tongtienttoanbchu;
  final dynamic tongtienttoannte;
  final String tongtienttoannteStr;
  final dynamic tongtienttoanvnd;
  final dynamic tongtienhangtruocthue;
  final dynamic tongtienhangtruocthuevnd;
  final String tongtienttoanvndStr;
  final dynamic tongtienvnd;
  final String trangthai;
  final String tinhChat;
  final String tennban;
  final String dchinban;
  final String dthoainban;
  final String tkhoannban;
  final String nhangnban;
  final String faxnban;
  final String emailnban;
  final String ghiChu;
  final String contentxml;
  final String barcode;
  final String mota;
  final dynamic tongtienthuente;
  final String tongtienthuenteStr;
  final String confirm;
  final String check;
  final String flagFee;
  final String flagGiayTuin;
  final dynamic maKeyGopExcel;
  final dynamic trnRefNo;
  final dynamic relatedCustomer;
  final dynamic uniqueId;
  final dynamic extRef;
  final String tongtienttoanbchuVnd;
  final dynamic branchName;
  final dynamic invoiceKey;
  final dynamic adjustmentInvoice;
  final dynamic sttHdUpload;
  final dynamic mustToSign;
  final dynamic hoadondacthu;
  final dynamic userName;
  final dynamic checkInChuyenDoi;
  final dynamic tongtienthuevnd;
  final String tongtienthuevndStr;
  final dynamic tongthuesuat5Nte;
  final dynamic tongthuesuat5Vnd;
  final dynamic tongthuesuat10Nte;
  final dynamic tongthuesuat10Vnd;
  final dynamic tongthuesuatthuekhacnte;
  final dynamic tongthuesuatthuekhacvnd;
  final dynamic tongthuesuat0Nte;
  final dynamic tongthuesuat0Vnd;
  final dynamic khongchiuthuegtgt;
  final dynamic mienthuegtgt;
  final dynamic thueTang;
  final dynamic thueGiam;
  final dynamic tongTToanTang;
  final dynamic tongTToanGiam;
  final String lyDoDChinh;
  final dynamic tongtienthuedchinhtanggiam;
  final dynamic tongtienttoandchinhtanggiam;
  final dynamic tongtienthuedchinhtanggiamStr;
  final dynamic tongtienttoandchinhtanggiamStr;
  final String pbanxml;
  final String messReceived;
  final String hDongVchuyen;
  final dynamic idNguoilap;
  final String vanId;
  final String lydotuchoi;
  final List<Detail> detail;
  final dynamic listOfProduct;
  final String soLenhDDong;
  final dynamic ngayDDong;
  final String nguoiDDong;
  final String lDoDDong;
  final String maGdich;
  final dynamic tongtientruocthue10Nte;
  final dynamic tongtientruocthue5Nte;
  final dynamic tongtientruocthue0Nte;
  final dynamic tongtientruocthuekchiuthuente;
  final dynamic tongtientruocthuemienthuente;
  final dynamic tongtientruocthuethuekhacnte;
  final dynamic tongtientruocthue10Vnd;
  final dynamic tongtientruocthue5Vnd;
  final dynamic tongtientruocthue0Vnd;
  final dynamic tongtientruocthuekchiuthuevnd;
  final dynamic tongtientruocthuemienthuevnd;
  final dynamic tongtientruocthuethuekhacvnd;
  final dynamic tongtiensauthue10Nte;
  final dynamic tongtiensauthue5Nte;
  final dynamic tongtiensauthue0Nte;
  final dynamic tongtiensauthuekchiuthuente;
  final dynamic tongtiensauthuemienthuevnd;
  final dynamic tongtiensauthuethuekhacvnd;
  final dynamic tongtiensauthue10Vnd;
  final dynamic tongtiensauthue5Vnd;
  final dynamic tongtiensauthue0Vnd;
  final dynamic tongtiensauthuekchiuthuevnd;
  final dynamic tongtiensauthuemienthuente;
  final dynamic tongtiensauthuethuekhacnte;
  final dynamic updateTime;
  final String cdKhieuhdon;
  final String cdMauhdon;
  final String cdSohdon;
  final String hdongiay;
  final dynamic tongTienTToanGiay;
  final dynamic tongTienThueGtgtGiay;
  final String hThucHDon;
  final String kyDienTu;
  final dynamic fee;
  final dynamic feeVat;
  final dynamic wfProcessId;
  final dynamic wfStatus;
  final dynamic wfUpdateTime;
  final String status;
  final dynamic loaiDieuChinh;
  final dynamic level;
  final dynamic qrcode;
  final List<dynamic> lstInvOtherInfoBan;
  final List<LstInvOtherInfo> lstInvOtherInfoMua;
  final List<LstInvOtherInfo> lstInvOtherInfoTToan;
  final dynamic lstInvOtherInfoLePhiKhac;
  final dynamic lstInvOtherInfoCthd;
  final dynamic tongcongthucxuat;
  final String isTt68;
  final dynamic signDescError;
  final String tinhchatgoc;
  final dynamic sluongdcdd;
  final dynamic sluongdcCopy;
  final dynamic checkBanNhap;
  final dynamic ngayLapFormat;
  final dynamic corpId;
  final String hthucHDonGoc;

  factory Iccinvhdr.fromJson(Map<String, dynamic> json) => Iccinvhdr(
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
    ngayvban: json["ngayvban"],
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
    contentxml: json["contentxml"] == null ? null : json["contentxml"],
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
    userName: json["user_name"],
    checkInChuyenDoi: json["checkInChuyenDoi"],
    tongtienthuevnd: json["tongtienthuevnd"] == null ? null : json["tongtienthuevnd"],
    tongtienthuevndStr: json["tongtienthuevndStr"] == null ? null : json["tongtienthuevndStr"],
    tongthuesuat5Nte: json["tongthuesuat5nte"] == null ? null : json["tongthuesuat5nte"],
    tongthuesuat5Vnd: json["tongthuesuat5vnd"] == null ? null : json["tongthuesuat5vnd"],
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
    detail: json["detail"] == null ? null : List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
    listOfProduct: json["listOfProduct"],
    soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],
    ngayDDong: json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
    lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
    maGdich: json["ma_gdich"] == null ? null : json["ma_gdich"],
    tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
    tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
    tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
    tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
    tongtientruocthuemienthuente: json["tongtientruocthuemienthuente"] == null ? null : json["tongtientruocthuemienthuente"],
    tongtientruocthuethuekhacnte: json["tongtientruocthuethuekhacnte"] == null ? null : json["tongtientruocthuethuekhacnte"],
    tongtientruocthue10Vnd: json["tongtientruocthue10vnd"] == null ? null : json["tongtientruocthue10vnd"],
    tongtientruocthue5Vnd: json["tongtientruocthue5vnd"] == null ? null : json["tongtientruocthue5vnd"],
    tongtientruocthue0Vnd: json["tongtientruocthue0vnd"] == null ? null : json["tongtientruocthue0vnd"],
    tongtientruocthuekchiuthuevnd: json["tongtientruocthuekchiuthuevnd"] == null ? null : json["tongtientruocthuekchiuthuevnd"],
    tongtientruocthuemienthuevnd: json["tongtientruocthuemienthuevnd"] == null ? null : json["tongtientruocthuemienthuevnd"],
    tongtientruocthuethuekhacvnd: json["tongtientruocthuethuekhacvnd"] == null ? null : json["tongtientruocthuethuekhacvnd"],
    tongtiensauthue10Nte: json["tongtiensauthue10nte"] == null ? null : json["tongtiensauthue10nte"],
    tongtiensauthue5Nte: json["tongtiensauthue5nte"] == null ? null : json["tongtiensauthue5nte"],
    tongtiensauthue0Nte: json["tongtiensauthue0nte"] == null ? null : json["tongtiensauthue0nte"],
    tongtiensauthuekchiuthuente: json["tongtiensauthuekchiuthuente"] == null ? null : json["tongtiensauthuekchiuthuente"],
    tongtiensauthuemienthuevnd: json["tongtiensauthuemienthuevnd"] == null ? null : json["tongtiensauthuemienthuevnd"],
    tongtiensauthuethuekhacvnd: json["tongtiensauthuethuekhacvnd"] == null ? null : json["tongtiensauthuethuekhacvnd"],
    tongtiensauthue10Vnd: json["tongtiensauthue10vnd"] == null ? null : json["tongtiensauthue10vnd"],
    tongtiensauthue5Vnd: json["tongtiensauthue5vnd"] == null ? null : json["tongtiensauthue5vnd"],
    tongtiensauthue0Vnd: json["tongtiensauthue0vnd"] == null ? null : json["tongtiensauthue0vnd"],
    tongtiensauthuekchiuthuevnd: json["tongtiensauthuekchiuthuevnd"] == null ? null : json["tongtiensauthuekchiuthuevnd"],
    tongtiensauthuemienthuente: json["tongtiensauthuemienthuente"] == null ? null : json["tongtiensauthuemienthuente"],
    tongtiensauthuethuekhacnte: json["tongtiensauthuethuekhacnte"] == null ? null : json["tongtiensauthuethuekhacnte"],
    updateTime: json["update_time"],
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
    wfStatus: json["wf_status"],
    wfUpdateTime: json["wf_update_time"],
    status: json["status"] == null ? null : json["status"],
    loaiDieuChinh: json["loai_dieu_chinh"],
    level: json["level"] == null ? null : json["level"],
    qrcode: json["qrcode"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoBan"].map((x) => x)),
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"] == null ? null : List<LstInvOtherInfo>.from(json["lstInvOtherInfoMua"].map((x) => LstInvOtherInfo.fromJson(x))),
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"] == null ? null : List<LstInvOtherInfo>.from(json["lstInvOtherInfoTToan"].map((x) => LstInvOtherInfo.fromJson(x))),
    lstInvOtherInfoLePhiKhac: json["lstInvOtherInfoLePhiKhac"],
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"],
    tongcongthucxuat: json["tongcongthucxuat"],
    isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
    signDescError: json["sign_desc_error"],
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
    "ngayvban": ngayvban,
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
    "contentxml": contentxml == null ? null : contentxml,
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
    "user_name": userName,
    "checkInChuyenDoi": checkInChuyenDoi,
    "tongtienthuevnd": tongtienthuevnd == null ? null : tongtienthuevnd,
    "tongtienthuevndStr": tongtienthuevndStr == null ? null : tongtienthuevndStr,
    "tongthuesuat5nte": tongthuesuat5Nte == null ? null : tongthuesuat5Nte,
    "tongthuesuat5vnd": tongthuesuat5Vnd == null ? null : tongthuesuat5Vnd,
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
    "detail": detail == null ? null : List<dynamic>.from(detail.map((x) => x.toJson())),
    "listOfProduct": listOfProduct,
    "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,
    "ngayDDong": ngayDDong,
    "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
    "lDoDDong": lDoDDong == null ? null : lDoDDong,
    "ma_gdich": maGdich == null ? null : maGdich,
    "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
    "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
    "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
    "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
    "tongtientruocthuemienthuente": tongtientruocthuemienthuente == null ? null : tongtientruocthuemienthuente,
    "tongtientruocthuethuekhacnte": tongtientruocthuethuekhacnte == null ? null : tongtientruocthuethuekhacnte,
    "tongtientruocthue10vnd": tongtientruocthue10Vnd == null ? null : tongtientruocthue10Vnd,
    "tongtientruocthue5vnd": tongtientruocthue5Vnd == null ? null : tongtientruocthue5Vnd,
    "tongtientruocthue0vnd": tongtientruocthue0Vnd == null ? null : tongtientruocthue0Vnd,
    "tongtientruocthuekchiuthuevnd": tongtientruocthuekchiuthuevnd == null ? null : tongtientruocthuekchiuthuevnd,
    "tongtientruocthuemienthuevnd": tongtientruocthuemienthuevnd == null ? null : tongtientruocthuemienthuevnd,
    "tongtientruocthuethuekhacvnd": tongtientruocthuethuekhacvnd == null ? null : tongtientruocthuethuekhacvnd,
    "tongtiensauthue10nte": tongtiensauthue10Nte == null ? null : tongtiensauthue10Nte,
    "tongtiensauthue5nte": tongtiensauthue5Nte == null ? null : tongtiensauthue5Nte,
    "tongtiensauthue0nte": tongtiensauthue0Nte == null ? null : tongtiensauthue0Nte,
    "tongtiensauthuekchiuthuente": tongtiensauthuekchiuthuente == null ? null : tongtiensauthuekchiuthuente,
    "tongtiensauthuemienthuevnd": tongtiensauthuemienthuevnd == null ? null : tongtiensauthuemienthuevnd,
    "tongtiensauthuethuekhacvnd": tongtiensauthuethuekhacvnd == null ? null : tongtiensauthuethuekhacvnd,
    "tongtiensauthue10vnd": tongtiensauthue10Vnd == null ? null : tongtiensauthue10Vnd,
    "tongtiensauthue5vnd": tongtiensauthue5Vnd == null ? null : tongtiensauthue5Vnd,
    "tongtiensauthue0vnd": tongtiensauthue0Vnd == null ? null : tongtiensauthue0Vnd,
    "tongtiensauthuekchiuthuevnd": tongtiensauthuekchiuthuevnd == null ? null : tongtiensauthuekchiuthuevnd,
    "tongtiensauthuemienthuente": tongtiensauthuemienthuente == null ? null : tongtiensauthuemienthuente,
    "tongtiensauthuethuekhacnte": tongtiensauthuethuekhacnte == null ? null : tongtiensauthuethuekhacnte,
    "update_time": updateTime,
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
    "wf_status": wfStatus,
    "wf_update_time": wfUpdateTime,
    "status": status == null ? null : status,
    "loai_dieu_chinh": loaiDieuChinh,
    "level": level == null ? null : level,
    "qrcode": qrcode,
    "lstInvOtherInfoBan": lstInvOtherInfoBan == null ? null : List<dynamic>.from(lstInvOtherInfoBan.map((x) => x)),
    "lstInvOtherInfoMua": lstInvOtherInfoMua == null ? null : List<dynamic>.from(lstInvOtherInfoMua.map((x) => x.toJson())),
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan == null ? null : List<dynamic>.from(lstInvOtherInfoTToan.map((x) => x.toJson())),
    "lstInvOtherInfoLePhiKhac": lstInvOtherInfoLePhiKhac,
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd,
    "tongcongthucxuat": tongcongthucxuat,
    "is_tt68": isTt68 == null ? null : isTt68,
    "sign_desc_error": signDescError,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "sluongdcdd": sluongdcdd == null ? null : sluongdcdd,
    "sluongdcCopy": sluongdcCopy == null ? null : sluongdcCopy,
    "checkBanNhap": checkBanNhap,
    "ngayLapFormat": ngayLapFormat,
    "corpID": corpId,
    "hthucHDonGoc": hthucHDonGoc == null ? null : hthucHDonGoc,
  };
}

class Detail {
  Detail({
    this.id,
    this.pInvoiceId,
    this.productCode,
    this.productName,
    this.unitCode,
    this.unit,
    this.unitAmount,
    this.unitAmountImport,
    this.unitPrice,
    this.vat,
    this.amountWithoutVat,
    this.vatAmount,
    this.amountWithVat,
    this.promotion,
    this.isincreaseitem,
    this.adjustmentAmount,
    this.originalData,
    this.discountMoney,
    this.taxMoney,
    this.salesPromotion,
    this.currencyCode,
    this.taxCode,
    this.status,
    this.lstIccInvOtherInfoDtl,
    this.label1,
    this.value1,
    this.label2,
    this.value2,
    this.label3,
    this.value3,
    this.label4,
    this.value4,
    this.label5,
    this.value5,
    this.monthAmount,
    this.numberCode,
    this.lePhi,
    this.stt,
  });

  final dynamic id;
  final dynamic pInvoiceId;
  final String productCode;
  final String productName;
  final dynamic unitCode;
  final String unit;
  final dynamic unitAmount;
  final dynamic unitAmountImport;
  final dynamic unitPrice;
  final String vat;
  final dynamic amountWithoutVat;
  final dynamic vatAmount;
  final dynamic amountWithVat;
  final dynamic promotion;
  final dynamic isincreaseitem;
  final dynamic adjustmentAmount;
  final dynamic originalData;
  final dynamic discountMoney;
  final dynamic taxMoney;
  final dynamic salesPromotion;
  final String currencyCode;
  final String taxCode;
  final String status;
  final List<dynamic> lstIccInvOtherInfoDtl;
  final dynamic label1;
  final dynamic value1;
  final dynamic label2;
  final dynamic value2;
  final dynamic label3;
  final dynamic value3;
  final dynamic label4;
  final dynamic value4;
  final dynamic label5;
  final dynamic value5;
  final dynamic monthAmount;
  final dynamic numberCode;
  final dynamic lePhi;
  final dynamic stt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"] == null ? null : json["id"],
    pInvoiceId: json["p_invoice_id"] == null ? null : json["p_invoice_id"],
    productCode: json["product_code"] == null ? null : json["product_code"],
    productName: json["product_name"] == null ? null : json["product_name"],
    unitCode: json["unit_code"],
    unit: json["unit"] == null ? null : json["unit"],
    unitAmount: json["unit_amount"] == null ? null : json["unit_amount"],
    unitAmountImport: json["unit_amount_import"],
    unitPrice: json["unit_price"] == null ? null : json["unit_price"],
    vat: json["vat"] == null ? null : json["vat"],
    amountWithoutVat: json["amount_without_vat"] == null ? null : json["amount_without_vat"],
    vatAmount: json["vat_amount"] == null ? null : json["vat_amount"],
    amountWithVat: json["amount_with_vat"] == null ? null : json["amount_with_vat"],
    promotion: json["promotion"],
    isincreaseitem: json["isincreaseitem"],
    adjustmentAmount: json["adjustment_amount"],
    originalData: json["original_data"],
    discountMoney: json["discount_money"],
    taxMoney: json["tax_money"],
    salesPromotion: json["sales_promotion"],
    currencyCode: json["currencyCode"] == null ? null : json["currencyCode"],
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    status: json["status"] == null ? null : json["status"],
    lstIccInvOtherInfoDtl: json["lstIccInvOtherInfoDtl"] == null ? null : List<dynamic>.from(json["lstIccInvOtherInfoDtl"].map((x) => x)),
    label1: json["label1"],
    value1: json["value1"],
    label2: json["label2"],
    value2: json["value2"],
    label3: json["label3"],
    value3: json["value3"],
    label4: json["label4"],
    value4: json["value4"],
    label5: json["label5"],
    value5: json["value5"],
    monthAmount: json["month_amount"],
    numberCode: json["number_code"],
    lePhi: json["lePhi"],
    stt: json["stt"] == null ? null : json["stt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "p_invoice_id": pInvoiceId == null ? null : pInvoiceId,
    "product_code": productCode == null ? null : productCode,
    "product_name": productName == null ? null : productName,
    "unit_code": unitCode,
    "unit": unit == null ? null : unit,
    "unit_amount": unitAmount == null ? null : unitAmount,
    "unit_amount_import": unitAmountImport,
    "unit_price": unitPrice == null ? null : unitPrice,
    "vat": vat == null ? null : vat,
    "amount_without_vat": amountWithoutVat == null ? null : amountWithoutVat,
    "vat_amount": vatAmount == null ? null : vatAmount,
    "amount_with_vat": amountWithVat == null ? null : amountWithVat,
    "promotion": promotion,
    "isincreaseitem": isincreaseitem,
    "adjustment_amount": adjustmentAmount,
    "original_data": originalData,
    "discount_money": discountMoney,
    "tax_money": taxMoney,
    "sales_promotion": salesPromotion,
    "currencyCode": currencyCode == null ? null : currencyCode,
    "taxCode": taxCode == null ? null : taxCode,
    "status": status == null ? null : status,
    "lstIccInvOtherInfoDtl": lstIccInvOtherInfoDtl == null ? null : List<dynamic>.from(lstIccInvOtherInfoDtl.map((x) => x)),
    "label1": label1,
    "value1": value1,
    "label2": label2,
    "value2": value2,
    "label3": label3,
    "value3": value3,
    "label4": label4,
    "value4": value4,
    "label5": label5,
    "value5": value5,
    "month_amount": monthAmount,
    "number_code": numberCode,
    "lePhi": lePhi,
    "stt": stt == null ? null : stt,
  };
}

class LstInvOtherInfo {
  LstInvOtherInfo({
    this.id,
    this.pInvoiceId,
    this.label,
    this.value,
    this.dvi,
    this.isWordMoney,
    this.isEmail,
  });

  final dynamic id;
  final dynamic pInvoiceId;
  final String label;
  final String value;
  final String dvi;
  final dynamic isWordMoney;
  final dynamic isEmail;

  factory LstInvOtherInfo.fromJson(Map<String, dynamic> json) => LstInvOtherInfo(
    id: json["id"] == null ? null : json["id"],
    pInvoiceId: json["p_invoice_id"] == null ? null : json["p_invoice_id"],
    label: json["label"] == null ? null : json["label"],
    value: json["value"] == null ? null : json["value"],
    dvi: json["dvi"] == null ? null : json["dvi"],
    isWordMoney: json["is_word_money"],
    isEmail: json["is_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "p_invoice_id": pInvoiceId == null ? null : pInvoiceId,
    "label": label == null ? null : label,
    "value": value == null ? null : value,
    "dvi": dvi == null ? null : dvi,
    "is_word_money": isWordMoney,
    "is_email": isEmail,
  };
}

class TxStatus {
  TxStatus({
    this.code,
    this.desc,
    this.displayNameMap,
  });

  final String code;
  final String desc;
  final dynamic displayNameMap;

  factory TxStatus.fromJson(Map<String, dynamic> json) => TxStatus(
    code: json["code"] == null ? null : json["code"],
    desc: json["desc"] == null ? null : json["desc"],
    displayNameMap: json["displayNameMap"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "desc": desc == null ? null : desc,
    "displayNameMap": displayNameMap,
  };
}
