// To parse this JSON data, do
//
//     final traCuuHoaDonChiTietResponse = traCuuHoaDonChiTietResponseFromJson(jsonString);

import 'dart:convert';

TraCuuHoaDonChiTietResponse traCuuHoaDonChiTietResponseFromJson(String str) => TraCuuHoaDonChiTietResponse.fromJson(json.decode(str));

String traCuuHoaDonChiTietResponseToJson(TraCuuHoaDonChiTietResponse data) => json.encode(data.toJson());

class TraCuuHoaDonChiTietResponse {
  TraCuuHoaDonChiTietResponse({
    this.flagGiayTuin,
    this.sohdon,
    this.hthuchdon,
    this.tienbangchu,
    this.lstInvOtherInfoBan,
    this.lstInvOtherInfoMua,
    this.lstInvOtherInfoTToan,
    this.lstInvOtherInfoCthd,
    this.lstInvOtherInfoCthdDefault,
    this.id,
    this.tenhdon,
    this.loaihdon,
    this.mauhdon,
    this.khieuhdon,
    this.tennban,
    this.mstnban,
    this.dchinban,
    this.emailnban,
    this.mstnmua,
    this.tennmua,
    this.tendvinmua,
    this.dchinmua,
    this.emailnmua,
    this.dthoainmua,
    this.faxnmua,
    this.hthuctoan,
    this.matte,
    this.tgia,
    this.tkhoannban,
    this.nhangnban,
    this.tkhoannmua,
    this.nhangnmua,
    this.tongtiennte,
    this.tongtienthuente,
    this.tongtienttoannte,
    this.ngaylap,
    this.soLenhDDong,
    this.ngayDDong,
    this.nguoiDDong,
    this.lDoDDong,
    this.nguoivchuyen,
    this.hDongVchuyen,
    this.ptienvchuyen,
    this.tenkxuat,
    this.tenknhap,
    this.sohdong,
    this.ngayhdong,
    this.cdSohdon,
    this.ngayCqThdongoc,
    this.cdMauhdon,
    this.cdKhieuhdon,
    this.sohdongoc,
    this.sovban,
    this.ngayvban,
    this.tongTienThueGtgtGiay,
    this.tongTienTToanGiay,
    this.tongTToanTang,
    this.tongTToanGiam,
    this.lyDoDChinh,
    this.thueTang,
    this.thueGiam,
    this.corpInfo,
    this.transition,
    this.kyDienTu,
    this.idNguoilap,
    this.ngayhdon,
    this.confirm,
    this.corpInvoiceSerial,
    this.adjustType,
    this.dsdvu,
    this.trangthai,
    this.tinhchat,
    this.serviceType,
    this.hthucHDonGoc,
    this.relatedCustomer
  });

  final dynamic flagGiayTuin;
  final String sohdon;
  final String hthuchdon;
  final String tienbangchu;
  final List<dynamic> lstInvOtherInfoBan;
  final List<dynamic> lstInvOtherInfoMua;
  final List<dynamic> lstInvOtherInfoTToan;
  final List<List<dynamic>> lstInvOtherInfoCthd;
  final List<dynamic> lstInvOtherInfoCthdDefault;
  final String id;
  final String tenhdon;
  final String loaihdon;
  final String mauhdon;
  final String khieuhdon;
  final String tennban;
  final String mstnban;
  final String dchinban;
  final String emailnban;
  final String mstnmua;
  final String tennmua;
  final String tendvinmua;
  final String dchinmua;
  final String emailnmua;
  final String dthoainmua;
  final String faxnmua;
  final String hthuctoan;
  final String matte;
  final String tgia;
  final String tkhoannban;
  final String nhangnban;
  final String tkhoannmua;
  final String nhangnmua;
  final String tongtiennte;
  final String tongtienthuente;
  final String tongtienttoannte;
  final String ngaylap;
  final String soLenhDDong;
  final String ngayDDong;
  final String nguoiDDong;
  final String lDoDDong;
  final String nguoivchuyen;
  final String hDongVchuyen;
  final String ptienvchuyen;
  final String tenkxuat;
  final String tenknhap;
  final String sohdong;
  final String ngayhdong;
  final String cdSohdon;
  final String ngayCqThdongoc;
  final String cdMauhdon;
  final String cdKhieuhdon;
  final String sohdongoc;
  final String sovban;
  final String ngayvban;
  final dynamic tongTienThueGtgtGiay;
  final dynamic tongTienTToanGiay;
  final dynamic tongTToanTang;
  final dynamic tongTToanGiam;
  final String lyDoDChinh;
  final dynamic thueTang;
  final dynamic thueGiam;
  final CorpInfo corpInfo;
  final String transition;
  final String kyDienTu;
  final String idNguoilap;
  final String ngayhdon;
  final dynamic confirm;
  final CorpInvoiceSerial corpInvoiceSerial;
  final dynamic adjustType;
  final List<Dsdvu> dsdvu;
  final String trangthai;
  final String tinhchat;
  final String serviceType;
  final String hthucHDonGoc;
  final String relatedCustomer;

  factory TraCuuHoaDonChiTietResponse.fromJson(Map<String, dynamic> json) => TraCuuHoaDonChiTietResponse(
    flagGiayTuin: json["flagGiayTuin"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    hthuchdon: json["hthuchdon"] == null ? null : json["hthuchdon"],
    tienbangchu: json["tienbangchu"] == null ? null : json["tienbangchu"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoBan"].map((x) => x)),
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoMua"].map((x) => x)),
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoTToan"].map((x) => x)),
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"] == null ? null : List<List<dynamic>>.from(json["lstInvOtherInfoCTHD"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    lstInvOtherInfoCthdDefault: json["lstInvOtherInfoCTHDDefault"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoCTHDDefault"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    tennban: json["tennban"] == null ? null : json["tennban"],
    mstnban: json["mstnban"] == null ? null : json["mstnban"],
    dchinban: json["dchinban"] == null ? null : json["dchinban"],
    emailnban: json["emailnban"] == null ? null : json["emailnban"],
    mstnmua: json["mstnmua"] == null ? null : json["mstnmua"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
    faxnmua: json["faxnmua"] == null ? null : json["faxnmua"],
    hthuctoan: json["hthuctoan"] == null ? null : json["hthuctoan"],
    matte: json["matte"] == null ? null : json["matte"],
    tgia: json["tgia"] == null ? null : json["tgia"],
    tkhoannban: json["tkhoannban"] == null ? null : json["tkhoannban"],
    nhangnban: json["nhangnban"] == null ? null : json["nhangnban"],
    tkhoannmua: json["tkhoannmua"] == null ? null : json["tkhoannmua"],
    nhangnmua: json["nhangnmua"] == null ? null : json["nhangnmua"],
    tongtiennte: json["tongtiennte"] == null ? null : json["tongtiennte"],
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    ngaylap: json["ngaylap"] == null ? null : json["ngaylap"],
    soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],
    ngayDDong: json["ngayDDong"] == null ? null : json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
    lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
    nguoivchuyen: json["nguoivchuyen"] == null ? null : json["nguoivchuyen"],
    hDongVchuyen: json["hDongVchuyen"] == null ? null : json["hDongVchuyen"],
    ptienvchuyen: json["ptienvchuyen"] == null ? null : json["ptienvchuyen"],
    tenkxuat: json["tenkxuat"] == null ? null : json["tenkxuat"],
    tenknhap: json["tenknhap"] == null ? null : json["tenknhap"],
    sohdong: json["sohdong"] == null ? null : json["sohdong"],
    ngayhdong: json["ngayhdong"] == null ? null : json["ngayhdong"],
    cdSohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
    ngayCqThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    sovban: json["sovban"] == null ? null : json["sovban"],
    ngayvban: json["ngayvban"] == null ? null : json["ngayvban"],
    tongTienThueGtgtGiay: json["tongTienThueGTGTGiay"],
    tongTienTToanGiay: json["tongTienTToanGiay"] == null ? null : json["tongTienTToanGiay"],
    tongTToanTang: json["tongTToanTang"] == null ? null : json["tongTToanTang"],
    tongTToanGiam: json["tongTToanGiam"] == null ? null : json["tongTToanGiam"],
    lyDoDChinh: json["lyDoDChinh"] == null ? null : json["lyDoDChinh"],
    thueTang: json["thueTang"] == null ? null : json["thueTang"],
    thueGiam: json["thueGiam"] == null ? null : json["thueGiam"],
    corpInfo: json["corpInfo"] == null ? null : CorpInfo.fromJson(json["corpInfo"]),
    transition: json["transition"] == null ? null : json["transition"],
    kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
    confirm: json["confirm"],
    corpInvoiceSerial: json["corpInvoiceSerial"] == null ? null : CorpInvoiceSerial.fromJson(json["corpInvoiceSerial"]),
    adjustType: json["adjustType"],
    dsdvu: json["dsdvu"] == null ? null : List<Dsdvu>.from(json["dsdvu"].map((x) => Dsdvu.fromJson(x))),
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    tinhchat: json["tinhchat"] == null ? null : json["tinhchat"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    hthucHDonGoc: json["hthucHDonGoc"] == null ? null : json["hthucHDonGoc"],
    relatedCustomer: json["relatedCustomer"] == null ? null : json["relatedCustomer"],
  );

  Map<String, dynamic> toJson() => {
    "flagGiayTuin": flagGiayTuin,
    "sohdon": sohdon == null ? null : sohdon,
    "hthuchdon": hthuchdon == null ? null : hthuchdon,
    "tienbangchu": tienbangchu == null ? null : tienbangchu,
    "lstInvOtherInfoBan": lstInvOtherInfoBan == null ? null : List<dynamic>.from(lstInvOtherInfoBan.map((x) => x)),
    "lstInvOtherInfoMua": lstInvOtherInfoMua == null ? null : List<dynamic>.from(lstInvOtherInfoMua.map((x) => x)),
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan == null ? null : List<dynamic>.from(lstInvOtherInfoTToan.map((x) => x)),
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd == null ? null : List<dynamic>.from(lstInvOtherInfoCthd.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "lstInvOtherInfoCTHDDefault": lstInvOtherInfoCthdDefault == null ? null : List<dynamic>.from(lstInvOtherInfoCthdDefault.map((x) => x)),
    "id": id == null ? null : id,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "tennban": tennban == null ? null : tennban,
    "mstnban": mstnban == null ? null : mstnban,
    "dchinban": dchinban == null ? null : dchinban,
    "emailnban": emailnban == null ? null : emailnban,
    "mstnmua": mstnmua == null ? null : mstnmua,
    "tennmua": tennmua == null ? null : tennmua,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "dthoainmua": dthoainmua == null ? null : dthoainmua,
    "faxnmua": faxnmua == null ? null : faxnmua,
    "hthuctoan": hthuctoan == null ? null : hthuctoan,
    "matte": matte == null ? null : matte,
    "tgia": tgia == null ? null : tgia,
    "tkhoannban": tkhoannban == null ? null : tkhoannban,
    "nhangnban": nhangnban == null ? null : nhangnban,
    "tkhoannmua": tkhoannmua == null ? null : tkhoannmua,
    "nhangnmua": nhangnmua == null ? null : nhangnmua,
    "tongtiennte": tongtiennte == null ? null : tongtiennte,
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "ngaylap": ngaylap == null ? null : ngaylap,
    "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,
    "ngayDDong": ngayDDong == null ? null : ngayDDong,
    "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
    "lDoDDong": lDoDDong == null ? null : lDoDDong,
    "nguoivchuyen": nguoivchuyen == null ? null : nguoivchuyen,
    "hDongVchuyen": hDongVchuyen == null ? null : hDongVchuyen,
    "ptienvchuyen": ptienvchuyen == null ? null : ptienvchuyen,
    "tenkxuat": tenkxuat == null ? null : tenkxuat,
    "tenknhap": tenknhap == null ? null : tenknhap,
    "sohdong": sohdong == null ? null : sohdong,
    "ngayhdong": ngayhdong == null ? null : ngayhdong,
    "cd_sohdon": cdSohdon == null ? null : cdSohdon,
    "ngayCQThdongoc": ngayCqThdongoc == null ? null : ngayCqThdongoc,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "sovban": sovban == null ? null : sovban,
    "ngayvban": ngayvban == null ? null : ngayvban,
    "tongTienThueGTGTGiay": tongTienThueGtgtGiay,
    "tongTienTToanGiay": tongTienTToanGiay == null ? null : tongTienTToanGiay,
    "tongTToanTang": tongTToanTang == null ? null : tongTToanTang,
    "tongTToanGiam": tongTToanGiam == null ? null : tongTToanGiam,
    "lyDoDChinh": lyDoDChinh == null ? null : lyDoDChinh,
    "thueTang": thueTang == null ? null : thueTang,
    "thueGiam": thueGiam == null ? null : thueGiam,
    "corpInfo": corpInfo == null ? null : corpInfo.toJson(),
    "transition": transition == null ? null : transition,
    "kyDienTu": kyDienTu == null ? null : kyDienTu,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "ngayhdon": ngayhdon == null ? null : ngayhdon,
    "confirm": confirm,
    "corpInvoiceSerial": corpInvoiceSerial == null ? null : corpInvoiceSerial.toJson(),
    "adjustType": adjustType,
    "dsdvu": dsdvu == null ? null : List<dynamic>.from(dsdvu.map((x) => x.toJson())),
    "trangthai": trangthai == null ? null : trangthai,
    "tinhchat": tinhchat == null ? null : tinhchat,
    "serviceType": serviceType == null ? null : serviceType,
    "hthucHDonGoc": hthucHDonGoc == null ? null : hthucHDonGoc,
    "relatedCustomer": relatedCustomer == null ? null : relatedCustomer,
  };
}

class CorpInfo {
  CorpInfo({
    this.companyLogo,
    this.corpId,
    this.corpName,
    this.groupId,
    this.securityType,
    this.signOrg,
    this.certType,
    this.certName,
    this.certCode,
    this.certIssuedDate,
    this.certIssuedPlace,
    this.contactPerson,
    this.telephone,
    this.mobile,
    this.fax,
    this.address,
    this.postalCode,
    this.email,
    this.rprsName,
    this.rprsTitle,
    this.rprsId,
    this.rprsIssuedDate,
    this.rprsIssuedPlace,
    this.openAcctStmt,
    this.acctStmtFrq,
    this.acctStmtMethod,
    this.openMobile,
    this.serviceType,
    this.receiveSmSadv,
    this.remark,
    this.createBy,
    this.createByMng,
    this.createTime,
    this.updateBy,
    this.updateByMng,
    this.updateTime,
    this.status,
    this.isApproveSign,
    this.freezedStartTime,
    this.freezedEndTime,
    this.cifNo,
    this.cifAcctName,
    this.openIbs,
    this.openMbs,
    this.openSms,
    this.groupIdMbs,
    this.groupIdSms,
    this.regionCode,
    this.intro,
    this.introducer,
    this.internalCustomer,
    this.feeAccountNo,
    this.mngStatus,
    this.mngTime,
    this.taxCode,
    this.rejectReason,
    this.cusType,
    this.servicecode,
    this.validatedtiem,
    this.expriredtime,
    this.orgamout,
    this.availableamout,
    this.fixamoutinvoice,
    this.macqt,
    this.fixmonth,
    this.fromDate,
    this.toDate,
    this.serialCert,
    this.issuerCert,
    this.vanId,
    this.phuongthuchd,
    this.taxName,
    this.vanName,
    this.corpType,
    this.hinhthuchd,
    this.contactEmail,
    this.contactTelephone,
    this.bank,
    this.bankno,
    this.bankBranch,
    this.confirm,
    this.createTimeStr,
    this.flagDate,
    this.validatedTimeStr,
    this.expriredTimeStr,
    this.confirmAttachment,
    this.confirmSeller,
    this.decimalFmt,
    this.isInvoiceNumber,
    this.isSignerNew,
    this.isRegister,
    this.pCifNo,
    this.tenCqThue,
    this.addressShort,
    this.flagDcm,
    this.checkUpdateOnly,
    this.serviceCode,
    this.adhddt,
    this.mlhdsdung1,
    this.mlhdsdung2,
    this.mlhdsdung3,
    this.mlhdsdung4,
  });

  final dynamic companyLogo;
  final int corpId;
  final String corpName;
  final int groupId;
  final dynamic securityType;
  final String signOrg;
  final dynamic certType;
  final String certName;
  final dynamic certCode;
  final dynamic certIssuedDate;
  final dynamic certIssuedPlace;
  final String contactPerson;
  final String telephone;
  final String mobile;
  final String fax;
  final String address;
  final String postalCode;
  final String email;
  final dynamic rprsName;
  final dynamic rprsTitle;
  final dynamic rprsId;
  final dynamic rprsIssuedDate;
  final dynamic rprsIssuedPlace;
  final dynamic openAcctStmt;
  final dynamic acctStmtFrq;
  final dynamic acctStmtMethod;
  final dynamic openMobile;
  final String serviceType;
  final dynamic receiveSmSadv;
  final dynamic remark;
  final int createBy;
  final dynamic createByMng;
  final int createTime;
  final int updateBy;
  final dynamic updateByMng;
  final int updateTime;
  final String status;
  final String isApproveSign;
  final dynamic freezedStartTime;
  final dynamic freezedEndTime;
  final String cifNo;
  final String cifAcctName;
  final String openIbs;
  final String openMbs;
  final String openSms;
  final int groupIdMbs;
  final dynamic groupIdSms;
  final String regionCode;
  final dynamic intro;
  final dynamic introducer;
  final dynamic internalCustomer;
  final dynamic feeAccountNo;
  final dynamic mngStatus;
  final dynamic mngTime;
  final String taxCode;
  final dynamic rejectReason;
  final dynamic cusType;
  final String servicecode;
  final int validatedtiem;
  final int expriredtime;
  final dynamic orgamout;
  final int availableamout;
  final int fixamoutinvoice;
  final dynamic macqt;
  final dynamic fixmonth;
  final dynamic fromDate;
  final dynamic toDate;
  final dynamic serialCert;
  final dynamic issuerCert;
  final String vanId;
  final String phuongthuchd;
  final dynamic taxName;
  final dynamic vanName;
  final dynamic corpType;
  final String hinhthuchd;
  final String contactEmail;
  final String contactTelephone;
  final String bank;
  final String bankno;
  final String bankBranch;
  final String confirm;
  final dynamic createTimeStr;
  final dynamic flagDate;
  final dynamic validatedTimeStr;
  final dynamic expriredTimeStr;
  final String confirmAttachment;
  final String confirmSeller;
  final String decimalFmt;
  final String isInvoiceNumber;
  final String isSignerNew;
  final dynamic isRegister;
  final dynamic pCifNo;
  final dynamic tenCqThue;
  final dynamic addressShort;
  final String flagDcm;
  final dynamic checkUpdateOnly;
  final dynamic serviceCode;
  final String adhddt;
  final dynamic mlhdsdung1;
  final dynamic mlhdsdung2;
  final dynamic mlhdsdung3;
  final dynamic mlhdsdung4;

  factory CorpInfo.fromJson(Map<String, dynamic> json) => CorpInfo(
    companyLogo: json["companyLogo"],
    corpId: json["corpId"] == null ? null : json["corpId"],
    corpName: json["corpName"] == null ? null : json["corpName"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    securityType: json["securityType"],
    signOrg: json["signOrg"] == null ? null : json["signOrg"],
    certType: json["certType"],
    certName: json["certName"] == null ? null : json["certName"],
    certCode: json["certCode"],
    certIssuedDate: json["certIssuedDate"],
    certIssuedPlace: json["certIssuedPlace"],
    contactPerson: json["contactPerson"] == null ? null : json["contactPerson"],
    telephone: json["telephone"] == null ? null : json["telephone"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    fax: json["fax"] == null ? null : json["fax"],
    address: json["address"] == null ? null : json["address"],
    postalCode: json["postalCode"] == null ? null : json["postalCode"],
    email: json["email"] == null ? null : json["email"],
    rprsName: json["rprsName"],
    rprsTitle: json["rprsTitle"],
    rprsId: json["rprsId"],
    rprsIssuedDate: json["rprsIssuedDate"],
    rprsIssuedPlace: json["rprsIssuedPlace"],
    openAcctStmt: json["openAcctStmt"],
    acctStmtFrq: json["acctStmtFrq"],
    acctStmtMethod: json["acctStmtMethod"],
    openMobile: json["openMobile"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    receiveSmSadv: json["receiveSMSadv"],
    remark: json["remark"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    createByMng: json["createByMng"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    updateByMng: json["updateByMng"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    status: json["status"] == null ? null : json["status"],
    isApproveSign: json["is_approve_sign"] == null ? null : json["is_approve_sign"],
    freezedStartTime: json["freezedStartTime"],
    freezedEndTime: json["freezedEndTime"],
    cifNo: json["cifNo"] == null ? null : json["cifNo"],
    cifAcctName: json["cifAcctName"] == null ? null : json["cifAcctName"],
    openIbs: json["openIBS"] == null ? null : json["openIBS"],
    openMbs: json["openMBS"] == null ? null : json["openMBS"],
    openSms: json["openSMS"] == null ? null : json["openSMS"],
    groupIdMbs: json["groupIdMBS"] == null ? null : json["groupIdMBS"],
    groupIdSms: json["groupIdSMS"],
    regionCode: json["regionCode"] == null ? null : json["regionCode"],
    intro: json["intro"],
    introducer: json["introducer"],
    internalCustomer: json["internalCustomer"],
    feeAccountNo: json["feeAccountNo"],
    mngStatus: json["mngStatus"],
    mngTime: json["mngTime"],
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    rejectReason: json["rejectReason"],
    cusType: json["cusType"],
    servicecode: json["servicecode"] == null ? null : json["servicecode"],
    validatedtiem: json["validatedtiem"] == null ? null : json["validatedtiem"],
    expriredtime: json["expriredtime"] == null ? null : json["expriredtime"],
    orgamout: json["orgamout"],
    availableamout: json["availableamout"] == null ? null : json["availableamout"],
    fixamoutinvoice: json["fixamoutinvoice"] == null ? null : json["fixamoutinvoice"],
    macqt: json["macqt"],
    fixmonth: json["fixmonth"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    serialCert: json["serial_cert"],
    issuerCert: json["issuer_cert"],
    vanId: json["van_id"] == null ? null : json["van_id"],
    phuongthuchd: json["phuongthuchd"] == null ? null : json["phuongthuchd"],
    taxName: json["taxName"],
    vanName: json["vanName"],
    corpType: json["corpType"],
    hinhthuchd: json["hinhthuchd"] == null ? null : json["hinhthuchd"],
    contactEmail: json["contact_email"] == null ? null : json["contact_email"],
    contactTelephone: json["contact_telephone"] == null ? null : json["contact_telephone"],
    bank: json["bank"] == null ? null : json["bank"],
    bankno: json["bankno"] == null ? null : json["bankno"],
    bankBranch: json["bank_branch"] == null ? null : json["bank_branch"],
    confirm: json["confirm"] == null ? null : json["confirm"],
    createTimeStr: json["createTimeStr"],
    flagDate: json["flag_date"],
    validatedTimeStr: json["validatedTimeStr"],
    expriredTimeStr: json["expriredTimeStr"],
    confirmAttachment: json["confirm_attachment"] == null ? null : json["confirm_attachment"],
    confirmSeller: json["confirm_seller"] == null ? null : json["confirm_seller"],
    decimalFmt: json["decimalFmt"] == null ? null : json["decimalFmt"],
    isInvoiceNumber: json["is_invoice_number"] == null ? null : json["is_invoice_number"],
    isSignerNew: json["is_signer_new"] == null ? null : json["is_signer_new"],
    isRegister: json["is_register"],
    pCifNo: json["p_cif_no"],
    tenCqThue: json["ten_cq_thue"],
    addressShort: json["addressShort"],
    flagDcm: json["flag_dcm"] == null ? null : json["flag_dcm"],
    checkUpdateOnly: json["check_update_only"],
    serviceCode: json["service_code"],
    adhddt: json["adhddt"] == null ? null : json["adhddt"],
    mlhdsdung1: json["mlhdsdung1"],
    mlhdsdung2: json["mlhdsdung2"],
    mlhdsdung3: json["mlhdsdung3"],
    mlhdsdung4: json["mlhdsdung4"],
  );

  Map<String, dynamic> toJson() => {
    "companyLogo": companyLogo,
    "corpId": corpId == null ? null : corpId,
    "corpName": corpName == null ? null : corpName,
    "groupId": groupId == null ? null : groupId,
    "securityType": securityType,
    "signOrg": signOrg == null ? null : signOrg,
    "certType": certType,
    "certName": certName == null ? null : certName,
    "certCode": certCode,
    "certIssuedDate": certIssuedDate,
    "certIssuedPlace": certIssuedPlace,
    "contactPerson": contactPerson == null ? null : contactPerson,
    "telephone": telephone == null ? null : telephone,
    "mobile": mobile == null ? null : mobile,
    "fax": fax == null ? null : fax,
    "address": address == null ? null : address,
    "postalCode": postalCode == null ? null : postalCode,
    "email": email == null ? null : email,
    "rprsName": rprsName,
    "rprsTitle": rprsTitle,
    "rprsId": rprsId,
    "rprsIssuedDate": rprsIssuedDate,
    "rprsIssuedPlace": rprsIssuedPlace,
    "openAcctStmt": openAcctStmt,
    "acctStmtFrq": acctStmtFrq,
    "acctStmtMethod": acctStmtMethod,
    "openMobile": openMobile,
    "serviceType": serviceType == null ? null : serviceType,
    "receiveSMSadv": receiveSmSadv,
    "remark": remark,
    "createBy": createBy == null ? null : createBy,
    "createByMng": createByMng,
    "createTime": createTime == null ? null : createTime,
    "updateBy": updateBy == null ? null : updateBy,
    "updateByMng": updateByMng,
    "updateTime": updateTime == null ? null : updateTime,
    "status": status == null ? null : status,
    "is_approve_sign": isApproveSign == null ? null : isApproveSign,
    "freezedStartTime": freezedStartTime,
    "freezedEndTime": freezedEndTime,
    "cifNo": cifNo == null ? null : cifNo,
    "cifAcctName": cifAcctName == null ? null : cifAcctName,
    "openIBS": openIbs == null ? null : openIbs,
    "openMBS": openMbs == null ? null : openMbs,
    "openSMS": openSms == null ? null : openSms,
    "groupIdMBS": groupIdMbs == null ? null : groupIdMbs,
    "groupIdSMS": groupIdSms,
    "regionCode": regionCode == null ? null : regionCode,
    "intro": intro,
    "introducer": introducer,
    "internalCustomer": internalCustomer,
    "feeAccountNo": feeAccountNo,
    "mngStatus": mngStatus,
    "mngTime": mngTime,
    "taxCode": taxCode == null ? null : taxCode,
    "rejectReason": rejectReason,
    "cusType": cusType,
    "servicecode": servicecode == null ? null : servicecode,
    "validatedtiem": validatedtiem == null ? null : validatedtiem,
    "expriredtime": expriredtime == null ? null : expriredtime,
    "orgamout": orgamout,
    "availableamout": availableamout == null ? null : availableamout,
    "fixamoutinvoice": fixamoutinvoice == null ? null : fixamoutinvoice,
    "macqt": macqt,
    "fixmonth": fixmonth,
    "fromDate": fromDate,
    "toDate": toDate,
    "serial_cert": serialCert,
    "issuer_cert": issuerCert,
    "van_id": vanId == null ? null : vanId,
    "phuongthuchd": phuongthuchd == null ? null : phuongthuchd,
    "taxName": taxName,
    "vanName": vanName,
    "corpType": corpType,
    "hinhthuchd": hinhthuchd == null ? null : hinhthuchd,
    "contact_email": contactEmail == null ? null : contactEmail,
    "contact_telephone": contactTelephone == null ? null : contactTelephone,
    "bank": bank == null ? null : bank,
    "bankno": bankno == null ? null : bankno,
    "bank_branch": bankBranch == null ? null : bankBranch,
    "confirm": confirm == null ? null : confirm,
    "createTimeStr": createTimeStr,
    "flag_date": flagDate,
    "validatedTimeStr": validatedTimeStr,
    "expriredTimeStr": expriredTimeStr,
    "confirm_attachment": confirmAttachment == null ? null : confirmAttachment,
    "confirm_seller": confirmSeller == null ? null : confirmSeller,
    "decimalFmt": decimalFmt == null ? null : decimalFmt,
    "is_invoice_number": isInvoiceNumber == null ? null : isInvoiceNumber,
    "is_signer_new": isSignerNew == null ? null : isSignerNew,
    "is_register": isRegister,
    "p_cif_no": pCifNo,
    "ten_cq_thue": tenCqThue,
    "addressShort": addressShort,
    "flag_dcm": flagDcm == null ? null : flagDcm,
    "check_update_only": checkUpdateOnly,
    "service_code": serviceCode,
    "adhddt": adhddt == null ? null : adhddt,
    "mlhdsdung1": mlhdsdung1,
    "mlhdsdung2": mlhdsdung2,
    "mlhdsdung3": mlhdsdung3,
    "mlhdsdung4": mlhdsdung4,
  };
}

class CorpInvoiceSerial {
  CorpInvoiceSerial({
    this.serialId,
    this.taxCode,
    this.invoiceType,
    this.invoiceTypeName,
    this.invoiceTemplate,
    this.invoiceSerial,
    this.validatedTime,
    this.fromNumber,
    this.toNumber,
    this.currNumber,
    this.count,
    this.status,
    this.reportCode,
    this.isLogo,
    this.isBackGround,
    this.isHeader,
    this.invoiceDay,
    this.isDefault,
    this.pIssueId,
    this.companyLogo,
    this.trangThaiPhatHanh,
    this.hthuchdon,
    this.templateDocx,
    this.stt,
    this.doanhNghiepInMst,
    this.doanhNghiepInTen,
    this.hopDongDatInSo,
    this.hopDongDatInNgay,
    this.isKyDTu,
    this.companyLogoStr,
    this.flag,
    this.isTt68,
    this.isCoMaCqt,
    this.isHsm,
    this.isAdmin,
    this.inchuyendoinew,
    this.soConLai,
    this.tonghdon,
    this.sohdonbefor,
  });

  final int serialId;
  final String taxCode;
  final String invoiceType;
  final dynamic invoiceTypeName;
  final String invoiceTemplate;
  final String invoiceSerial;
  final int validatedTime;
  final int fromNumber;
  final int toNumber;
  final int currNumber;
  final dynamic count;
  final String status;
  final String reportCode;
  final dynamic isLogo;
  final dynamic isBackGround;
  final dynamic isHeader;
  final String invoiceDay;
  final String isDefault;
  final String pIssueId;
  final dynamic companyLogo;
  final String trangThaiPhatHanh;
  final String hthuchdon;
  final dynamic templateDocx;
  final int stt;
  final dynamic doanhNghiepInMst;
  final dynamic doanhNghiepInTen;
  final dynamic hopDongDatInSo;
  final dynamic hopDongDatInNgay;
  final dynamic isKyDTu;
  final dynamic companyLogoStr;
  final dynamic flag;
  final String isTt68;
  final String isCoMaCqt;
  final dynamic isHsm;
  final String isAdmin;
  final String inchuyendoinew;
  final int soConLai;
  final int tonghdon;
  final int sohdonbefor;

  factory CorpInvoiceSerial.fromJson(Map<String, dynamic> json) => CorpInvoiceSerial(
    serialId: json["serialId"] == null ? null : json["serialId"],
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    invoiceType: json["invoiceType"] == null ? null : json["invoiceType"],
    invoiceTypeName: json["invoiceTypeName"],
    invoiceTemplate: json["invoiceTemplate"] == null ? null : json["invoiceTemplate"],
    invoiceSerial: json["invoiceSerial"] == null ? null : json["invoiceSerial"],
    validatedTime: json["validatedTime"] == null ? null : json["validatedTime"],
    fromNumber: json["fromNumber"] == null ? null : json["fromNumber"],
    toNumber: json["toNumber"] == null ? null : json["toNumber"],
    currNumber: json["currNumber"] == null ? null : json["currNumber"],
    count: json["count"],
    status: json["status"] == null ? null : json["status"],
    reportCode: json["reportCode"] == null ? null : json["reportCode"],
    isLogo: json["isLogo"],
    isBackGround: json["isBackGround"],
    isHeader: json["isHeader"],
    invoiceDay: json["invoiceDay"] == null ? null : json["invoiceDay"],
    isDefault: json["isDefault"] == null ? null : json["isDefault"],
    pIssueId: json["p_issue_id"] == null ? null : json["p_issue_id"],
    companyLogo: json["companyLogo"],
    trangThaiPhatHanh: json["trangThaiPhatHanh"] == null ? null : json["trangThaiPhatHanh"],
    hthuchdon: json["hthuchdon"] == null ? null : json["hthuchdon"],
    templateDocx: json["templateDocx"],
    stt: json["stt"] == null ? null : json["stt"],
    doanhNghiepInMst: json["doanhNghiepIn_mst"],
    doanhNghiepInTen: json["doanhNghiepIn_ten"],
    hopDongDatInSo: json["hopDongDatIn_so"],
    hopDongDatInNgay: json["hopDongDatIn_ngay"],
    isKyDTu: json["isKyDTu"],
    companyLogoStr: json["companyLogoStr"],
    flag: json["flag"],
    isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
    isCoMaCqt: json["is_co_ma_cqt"] == null ? null : json["is_co_ma_cqt"],
    isHsm: json["isHSM"],
    isAdmin: json["is_admin"] == null ? null : json["is_admin"],
    inchuyendoinew: json["inchuyendoinew"] == null ? null : json["inchuyendoinew"],
    soConLai: json["so_con_lai"] == null ? null : json["so_con_lai"],
    tonghdon: json["tonghdon"] == null ? null : json["tonghdon"],
    sohdonbefor: json["sohdonbefor"] == null ? null : json["sohdonbefor"],
  );

  Map<String, dynamic> toJson() => {
    "serialId": serialId == null ? null : serialId,
    "taxCode": taxCode == null ? null : taxCode,
    "invoiceType": invoiceType == null ? null : invoiceType,
    "invoiceTypeName": invoiceTypeName,
    "invoiceTemplate": invoiceTemplate == null ? null : invoiceTemplate,
    "invoiceSerial": invoiceSerial == null ? null : invoiceSerial,
    "validatedTime": validatedTime == null ? null : validatedTime,
    "fromNumber": fromNumber == null ? null : fromNumber,
    "toNumber": toNumber == null ? null : toNumber,
    "currNumber": currNumber == null ? null : currNumber,
    "count": count,
    "status": status == null ? null : status,
    "reportCode": reportCode == null ? null : reportCode,
    "isLogo": isLogo,
    "isBackGround": isBackGround,
    "isHeader": isHeader,
    "invoiceDay": invoiceDay == null ? null : invoiceDay,
    "isDefault": isDefault == null ? null : isDefault,
    "p_issue_id": pIssueId == null ? null : pIssueId,
    "companyLogo": companyLogo,
    "trangThaiPhatHanh": trangThaiPhatHanh == null ? null : trangThaiPhatHanh,
    "hthuchdon": hthuchdon == null ? null : hthuchdon,
    "templateDocx": templateDocx,
    "stt": stt == null ? null : stt,
    "doanhNghiepIn_mst": doanhNghiepInMst,
    "doanhNghiepIn_ten": doanhNghiepInTen,
    "hopDongDatIn_so": hopDongDatInSo,
    "hopDongDatIn_ngay": hopDongDatInNgay,
    "isKyDTu": isKyDTu,
    "companyLogoStr": companyLogoStr,
    "flag": flag,
    "is_tt68": isTt68 == null ? null : isTt68,
    "is_co_ma_cqt": isCoMaCqt == null ? null : isCoMaCqt,
    "isHSM": isHsm,
    "is_admin": isAdmin == null ? null : isAdmin,
    "inchuyendoinew": inchuyendoinew == null ? null : inchuyendoinew,
    "so_con_lai": soConLai == null ? null : soConLai,
    "tonghdon": tonghdon == null ? null : tonghdon,
    "sohdonbefor": sohdonbefor == null ? null : sohdonbefor,
  };
}

class Dsdvu {
  Dsdvu({
    this.madvu,
    this.tendvu,
    this.dvtinh,
    this.soluong,
    this.dongia,
    this.khuyenmai,
    this.tienchietkhau,
    this.thuesuat,
    this.thanhtientruocthue,
    this.tienthue,
    this.tongtienthanhtoan,
    this.soluongthucxuat,
    this.soluongthucnhap,
    this.thanhtientruocthue0,
    this.thanhtientruocthue5,
    this.thanhtientruocthue10,
    this.thanhtientruocthueKct,
    this.tienthue0,
    this.tienthue5,
    this.tienthue10,
    this.tienthueKct,
    this.thanhtiensauthue0,
    this.thanhtiensauthue5,
    this.thanhtiensauthue10,
    this.thanhtiensauthueKct,
  });




  String madvu;
  String tendvu;
  String dvtinh;
  String soluong;
  String dongia;
  String khuyenmai;
  String tienchietkhau;
  String thuesuat;
  String thanhtientruocthue;
  String tienthue;
  String tongtienthanhtoan;
  final String soluongthucxuat;
  final String soluongthucnhap;
  final String thanhtientruocthue0;
  final String thanhtientruocthue5;
  final String thanhtientruocthue10;
  final String thanhtientruocthueKct;
  final String tienthue0;
  final String tienthue5;
  final String tienthue10;
  final String tienthueKct;
  final String thanhtiensauthue0;
  final String thanhtiensauthue5;
  final String thanhtiensauthue10;
  final String thanhtiensauthueKct;

  factory Dsdvu.fromJson(Map<String, dynamic> json) => Dsdvu(
    madvu: json["madvu"] == null ? null : json["madvu"],
    tendvu: json["tendvu"] == null ? null : json["tendvu"],
    dvtinh: json["dvtinh"] == null ? null : json["dvtinh"],
    soluong: json["soluong"] == null ? null : json["soluong"],
    dongia: json["dongia"] == null ? null : json["dongia"],
    khuyenmai: json["khuyenmai"] == null ? null : json["khuyenmai"],
    tienchietkhau: json["tienchietkhau"] == null ? null : json["tienchietkhau"],
    thuesuat: json["thuesuat"] == null ? null : json["thuesuat"],
    thanhtientruocthue: json["thanhtientruocthue"] == null ? null : json["thanhtientruocthue"],
    tienthue: json["tienthue"] == null ? null : json["tienthue"],
    tongtienthanhtoan: json["tongtienthanhtoan"] == null ? null : json["tongtienthanhtoan"],
    soluongthucxuat: json["soluongthucxuat"] == null ? null : json["soluongthucxuat"],
    soluongthucnhap: json["soluongthucnhap"] == null ? null : json["soluongthucnhap"],
    thanhtientruocthue0: json["thanhtientruocthue0"] == null ? null : json["thanhtientruocthue0"],
    thanhtientruocthue5: json["thanhtientruocthue5"] == null ? null : json["thanhtientruocthue5"],
    thanhtientruocthue10: json["thanhtientruocthue10"] == null ? null : json["thanhtientruocthue10"],
    thanhtientruocthueKct: json["thanhtientruocthue_KCT"] == null ? null : json["thanhtientruocthue_KCT"],
    tienthue0: json["tienthue0"] == null ? null : json["tienthue0"],
    tienthue5: json["tienthue5"] == null ? null : json["tienthue5"],
    tienthue10: json["tienthue10"] == null ? null : json["tienthue10"],
    tienthueKct: json["tienthue_KCT"] == null ? null : json["tienthue_KCT"],
    thanhtiensauthue0: json["thanhtiensauthue0"] == null ? null : json["thanhtiensauthue0"],
    thanhtiensauthue5: json["thanhtiensauthue5"] == null ? null : json["thanhtiensauthue5"],
    thanhtiensauthue10: json["thanhtiensauthue10"] == null ? null : json["thanhtiensauthue10"],
    thanhtiensauthueKct: json["thanhtiensauthue_KCT"] == null ? null : json["thanhtiensauthue_KCT"],
  );

  Map<String, dynamic> toJson() => {
    "madvu": madvu == null ? null : madvu,
    "tendvu": tendvu == null ? null : tendvu,
    "dvtinh": dvtinh == null ? null : dvtinh,
    "soluong": soluong == null ? null : soluong,
    "dongia": dongia == null ? null : dongia,
    "khuyenmai": khuyenmai == null ? null : khuyenmai,
    "tienchietkhau": tienchietkhau == null ? null : tienchietkhau,
    "thuesuat": thuesuat == null ? null : thuesuat,
    "thanhtientruocthue": thanhtientruocthue == null ? null : thanhtientruocthue,
    "tienthue": tienthue == null ? null : tienthue,
    "tongtienthanhtoan": tongtienthanhtoan == null ? null : tongtienthanhtoan,
    "soluongthucxuat": soluongthucxuat == null ? null : soluongthucxuat,
    "soluongthucnhap": soluongthucnhap == null ? null : soluongthucnhap,
    "thanhtientruocthue0": thanhtientruocthue0 == null ? null : thanhtientruocthue0,
    "thanhtientruocthue5": thanhtientruocthue5 == null ? null : thanhtientruocthue5,
    "thanhtientruocthue10": thanhtientruocthue10 == null ? null : thanhtientruocthue10,
    "thanhtientruocthue_KCT": thanhtientruocthueKct == null ? null : thanhtientruocthueKct,
    "tienthue0": tienthue0 == null ? null : tienthue0,
    "tienthue5": tienthue5 == null ? null : tienthue5,
    "tienthue10": tienthue10 == null ? null : tienthue10,
    "tienthue_KCT": tienthueKct == null ? null : tienthueKct,
    "thanhtiensauthue0": thanhtiensauthue0 == null ? null : thanhtiensauthue0,
    "thanhtiensauthue5": thanhtiensauthue5 == null ? null : thanhtiensauthue5,
    "thanhtiensauthue10": thanhtiensauthue10 == null ? null : thanhtiensauthue10,
    "thanhtiensauthue_KCT": thanhtiensauthueKct == null ? null : thanhtiensauthueKct,
  };
}
