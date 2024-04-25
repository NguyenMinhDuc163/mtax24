
import 'dart:convert';

List<CorpSerialsResponse> corpSerialsResponseFromJson(String str) => List<CorpSerialsResponse>.from(json.decode(str).map((x) => CorpSerialsResponse.fromJson(x)));

String corpSerialsResponseToJson(List<CorpSerialsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CorpSerialsResponse {
  CorpSerialsResponse({
    this.loaiHDon,
    this.lstCorpSerials,
    this.lstProducts,
    this.lstCurrency,
    this.lstBank,
    this.lstPaymentWay,
    this.lstInvoiceType,
    this.ngaylap,
    this.thanglap,
    this.namlap,
    this.workFlowFlag,
    this.hthuchdon,
    this.lstInvOtherInfoBan,
    this.lstInvOtherInfoMua,
    this.lstInvOtherInfoTToan,
    this.lstInvOtherInfoCthd,
    this.lstInvOtherInfoCthdDefault,
    this.listMapHienThiTienTe,
  });

  final String loaiHDon;
  final List<LstCorpSerial> lstCorpSerials;
  final List<LstProduct> lstProducts;
  final List<String> lstCurrency;
  final List<LstBank> lstBank;
  final List<LstPaymentWay> lstPaymentWay;
  final List<LstInvoiceType> lstInvoiceType;
  final String ngaylap;
  final String thanglap;
  final String namlap;
  final String workFlowFlag;
  final String hthuchdon;
  final List<dynamic> lstInvOtherInfoBan;
  final List<dynamic> lstInvOtherInfoMua;
  final List<dynamic> lstInvOtherInfoTToan;
  final dynamic lstInvOtherInfoCthd;
  final List<LstInvOtherInfo> lstInvOtherInfoCthdDefault;
  final ListMapHienThiTienTe listMapHienThiTienTe;

  factory CorpSerialsResponse.fromJson(Map<String, dynamic> json) => CorpSerialsResponse(
    loaiHDon: json["loaiHDon"] == null ? null : json["loaiHDon"],
    lstCorpSerials: json["lstCorpSerials"] == null ? null : List<LstCorpSerial>.from(json["lstCorpSerials"].map((x) => LstCorpSerial.fromJson(x))),
    lstProducts: json["lstProducts"] == null ? null : List<LstProduct>.from(json["lstProducts"].map((x) => LstProduct.fromJson(x))),
    lstCurrency: json["lstCurrency"] == null ? null : List<String>.from(json["lstCurrency"].map((x) => x)),
    lstBank: json["lstBank"] == null ? null : List<LstBank>.from(json["lstBank"].map((x) => LstBank.fromJson(x))),
    lstPaymentWay: json["lstPaymentWay"] == null ? null : List<LstPaymentWay>.from(json["lstPaymentWay"].map((x) => LstPaymentWay.fromJson(x))),
    lstInvoiceType: json["lstInvoiceType"] == null ? null : List<LstInvoiceType>.from(json["lstInvoiceType"].map((x) => LstInvoiceType.fromJson(x))),
    ngaylap: json["ngaylap"] == null ? null : json["ngaylap"],
    thanglap: json["thanglap"] == null ? null : json["thanglap"],
    namlap: json["namlap"] == null ? null : json["namlap"],
    workFlowFlag: json["workFlowFlag"] == null ? null : json["workFlowFlag"],
    hthuchdon: json["hthuchdon"] == null ? null : json["hthuchdon"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoBan"].map((x) => x)),
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoMua"].map((x) => x)),
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"] == null ? null : List<LstInvOtherInfo>.from(json["lstInvOtherInfoTToan"].map((x) => LstInvOtherInfo.fromJson(x))),
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"],
    lstInvOtherInfoCthdDefault: json["lstInvOtherInfoCTHDDefault"] == null ? null : List<LstInvOtherInfo>.from(json["lstInvOtherInfoCTHDDefault"].map((x) => LstInvOtherInfo.fromJson(x))),
    listMapHienThiTienTe: json["listMapHienThiTienTe"] == null ? null : ListMapHienThiTienTe.fromJson(json["listMapHienThiTienTe"]),
  );

  Map<String, dynamic> toJson() => {
    "loaiHDon": loaiHDon == null ? null : loaiHDon,
    "lstCorpSerials": lstCorpSerials == null ? null : List<dynamic>.from(lstCorpSerials.map((x) => x.toJson())),
    "lstProducts": lstProducts == null ? null : List<dynamic>.from(lstProducts.map((x) => x.toJson())),
    "lstCurrency": lstCurrency == null ? null : List<dynamic>.from(lstCurrency.map((x) => x)),
    "lstBank": lstBank == null ? null : List<dynamic>.from(lstBank.map((x) => x.toJson())),
    "lstPaymentWay": lstPaymentWay == null ? null : List<dynamic>.from(lstPaymentWay.map((x) => x.toJson())),
    "lstInvoiceType": lstInvoiceType == null ? null : List<dynamic>.from(lstInvoiceType.map((x) => x.toJson())),
    "ngaylap": ngaylap == null ? null : ngaylap,
    "thanglap": thanglap == null ? null : thanglap,
    "namlap": namlap == null ? null : namlap,
    "workFlowFlag": workFlowFlag == null ? null : workFlowFlag,
    "hthuchdon": hthuchdon == null ? null : hthuchdon,
    "lstInvOtherInfoBan": lstInvOtherInfoBan == null ? null : List<dynamic>.from(lstInvOtherInfoBan.map((x) => x)),
    "lstInvOtherInfoMua": lstInvOtherInfoMua == null ? null : List<dynamic>.from(lstInvOtherInfoMua.map((x) => x)),
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan == null ? null : List<dynamic>.from(lstInvOtherInfoTToan.map((x) => x.toJson())),
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd,
    "lstInvOtherInfoCTHDDefault": lstInvOtherInfoCthdDefault == null ? null : List<dynamic>.from(lstInvOtherInfoCthdDefault.map((x) => x.toJson())),
    "listMapHienThiTienTe": listMapHienThiTienTe == null ? null : listMapHienThiTienTe.toJson(),
  };
}

class ListMapHienThiTienTe {
  ListMapHienThiTienTe({
    this.jpy,
    this.cny,
    this.sgd,
    this.hkd,
    this.vnd,
    this.cad,
    this.aud,
    this.nzd,
    this.gbp,
    this.dkk,
    this.nok,
    this.sek,
    this.chf,
    this.eur,
    this.xau,
    this.thb,
    this.usd,
    this.lak,
    this.krw,
    this.twd,
  });

  final String jpy;
  final String cny;
  final String sgd;
  final String hkd;
  final String vnd;
  final String cad;
  final String aud;
  final String nzd;
  final String gbp;
  final String dkk;
  final String nok;
  final String sek;
  final String chf;
  final String eur;
  final String xau;
  final String thb;
  final String usd;
  final String lak;
  final String krw;
  final String twd;

  factory ListMapHienThiTienTe.fromJson(Map<String, dynamic> json) => ListMapHienThiTienTe(
    jpy: json["JPY"] == null ? null : json["JPY"],
    cny: json["CNY"] == null ? null : json["CNY"],
    sgd: json["SGD"] == null ? null : json["SGD"],
    hkd: json["HKD"] == null ? null : json["HKD"],
    vnd: json["VND"] == null ? null : json["VND"],
    cad: json["CAD"] == null ? null : json["CAD"],
    aud: json["AUD"] == null ? null : json["AUD"],
    nzd: json["NZD"] == null ? null : json["NZD"],
    gbp: json["GBP"] == null ? null : json["GBP"],
    dkk: json["DKK"] == null ? null : json["DKK"],
    nok: json["NOK"] == null ? null : json["NOK"],
    sek: json["SEK"] == null ? null : json["SEK"],
    chf: json["CHF"] == null ? null : json["CHF"],
    eur: json["EUR"] == null ? null : json["EUR"],
    xau: json["XAU"] == null ? null : json["XAU"],
    thb: json["THB"] == null ? null : json["THB"],
    usd: json["USD"] == null ? null : json["USD"],
    lak: json["LAK"] == null ? null : json["LAK"],
    krw: json["KRW"] == null ? null : json["KRW"],
    twd: json["TWD"] == null ? null : json["TWD"],
  );

  Map<String, dynamic> toJson() => {
    "JPY": jpy == null ? null : jpy,
    "CNY": cny == null ? null : cny,
    "SGD": sgd == null ? null : sgd,
    "HKD": hkd == null ? null : hkd,
    "VND": vnd == null ? null : vnd,
    "CAD": cad == null ? null : cad,
    "AUD": aud == null ? null : aud,
    "NZD": nzd == null ? null : nzd,
    "GBP": gbp == null ? null : gbp,
    "DKK": dkk == null ? null : dkk,
    "NOK": nok == null ? null : nok,
    "SEK": sek == null ? null : sek,
    "CHF": chf == null ? null : chf,
    "EUR": eur == null ? null : eur,
    "XAU": xau == null ? null : xau,
    "THB": thb == null ? null : thb,
    "USD": usd == null ? null : usd,
    "LAK": lak == null ? null : lak,
    "KRW": krw == null ? null : krw,
    "TWD": twd == null ? null : twd,
  };
}

class LstBank {
  LstBank({
    this.mabank,
    this.tenbank,
  });

  final String mabank;
  final String tenbank;

  factory LstBank.fromJson(Map<String, dynamic> json) => LstBank(
    mabank: json["mabank"] == null ? null : json["mabank"],
    tenbank: json["tenbank"] == null ? null : json["tenbank"],
  );

  Map<String, dynamic> toJson() => {
    "mabank": mabank == null ? null : mabank,
    "tenbank": tenbank == null ? null : tenbank,
  };
}

class LstCorpSerial {
  LstCorpSerial({
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

  final dynamic serialId;
  final dynamic taxCode;
  final String invoiceType;
  final dynamic invoiceTypeName;
  final String invoiceTemplate;
  final dynamic invoiceSerial;
  final dynamic validatedTime;
  final dynamic fromNumber;
  final dynamic toNumber;
  final dynamic currNumber;
  final dynamic count;
  final dynamic status;
  final dynamic reportCode;
  final dynamic isLogo;
  final dynamic isBackGround;
  final dynamic isHeader;
  final dynamic invoiceDay;
  final String isDefault;
  final dynamic pIssueId;
  final dynamic companyLogo;
  final dynamic trangThaiPhatHanh;
  final dynamic hthuchdon;
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

  factory LstCorpSerial.fromJson(Map<String, dynamic> json) => LstCorpSerial(
    serialId: json["serialId"],
    taxCode: json["taxCode"],
    invoiceType: json["invoiceType"] == null ? null : json["invoiceType"],
    invoiceTypeName: json["invoiceTypeName"],
    invoiceTemplate: json["invoiceTemplate"] == null ? null : json["invoiceTemplate"],
    invoiceSerial: json["invoiceSerial"],
    validatedTime: json["validatedTime"],
    fromNumber: json["fromNumber"],
    toNumber: json["toNumber"],
    currNumber: json["currNumber"],
    count: json["count"],
    status: json["status"],
    reportCode: json["reportCode"],
    isLogo: json["isLogo"],
    isBackGround: json["isBackGround"],
    isHeader: json["isHeader"],
    invoiceDay: json["invoiceDay"],
    isDefault: json["isDefault"] == null ? null : json["isDefault"],
    pIssueId: json["p_issue_id"],
    companyLogo: json["companyLogo"],
    trangThaiPhatHanh: json["trangThaiPhatHanh"],
    hthuchdon: json["hthuchdon"],
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
    "serialId": serialId,
    "taxCode": taxCode,
    "invoiceType": invoiceType == null ? null : invoiceType,
    "invoiceTypeName": invoiceTypeName,
    "invoiceTemplate": invoiceTemplate == null ? null : invoiceTemplate,
    "invoiceSerial": invoiceSerial,
    "validatedTime": validatedTime,
    "fromNumber": fromNumber,
    "toNumber": toNumber,
    "currNumber": currNumber,
    "count": count,
    "status": status,
    "reportCode": reportCode,
    "isLogo": isLogo,
    "isBackGround": isBackGround,
    "isHeader": isHeader,
    "invoiceDay": invoiceDay,
    "isDefault": isDefault == null ? null : isDefault,
    "p_issue_id": pIssueId,
    "companyLogo": companyLogo,
    "trangThaiPhatHanh": trangThaiPhatHanh,
    "hthuchdon": hthuchdon,
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

  final int id;
  final int pInvoiceId;
  final String label;
  final dynamic value;
  final dynamic dvi;
  final dynamic isWordMoney;
  final dynamic isEmail;

  factory LstInvOtherInfo.fromJson(Map<String, dynamic> json) => LstInvOtherInfo(
    id: json["id"] == null ? null : json["id"],
    pInvoiceId: json["p_invoice_id"] == null ? null : json["p_invoice_id"],
    label: json["label"] == null ? null : json["label"],
    value: json["value"],
    dvi: json["dvi"],
    isWordMoney: json["is_word_money"],
    isEmail: json["is_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "p_invoice_id": pInvoiceId == null ? null : pInvoiceId,
    "label": label == null ? null : label,
    "value": value,
    "dvi": dvi,
    "is_word_money": isWordMoney,
    "is_email": isEmail,
  };
}

class LstInvoiceType {
  LstInvoiceType({
    this.invoiceName,
    this.invoiceCode,
    this.invoiceSeq,
    this.invoiceNameView,
    this.invoiceType,
  });

  final String invoiceName;
  final String invoiceCode;
  final dynamic invoiceSeq;
  final String invoiceNameView;
  final String invoiceType;

  factory LstInvoiceType.fromJson(Map<String, dynamic> json) => LstInvoiceType(
    invoiceName: json["invoice_name"] == null ? null : json["invoice_name"],
    invoiceCode: json["invoice_code"] == null ? null : json["invoice_code"],
    invoiceSeq: json["invoice_seq"],
    invoiceNameView: json["invoice_name_view"] == null ? null : json["invoice_name_view"],
    invoiceType: json["invoice_type"] == null ? null : json["invoice_type"],
  );

  Map<String, dynamic> toJson() => {
    "invoice_name": invoiceName == null ? null : invoiceName,
    "invoice_code": invoiceCode == null ? null : invoiceCode,
    "invoice_seq": invoiceSeq,
    "invoice_name_view": invoiceNameView == null ? null : invoiceNameView,
    "invoice_type": invoiceType == null ? null : invoiceType,
  };
}

class LstPaymentWay {
  LstPaymentWay({
    this.parameterId,
    this.type,
    this.code,
    this.name,
    this.displayName,
    this.seqNo,
    this.discription,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.channelCode,
    this.groupName,
    this.msgName,
    this.vnName,
    this.engName,
    this.msgId,
    this.status,
  });

  final int parameterId;
  final String type;
  final String code;
  final String name;
  final String displayName;
  final int seqNo;
  final String discription;
  final int createBy;
  final int createTime;
  final int updateBy;
  final int updateTime;
  final String channelCode;
  final dynamic groupName;
  final dynamic msgName;
  final dynamic vnName;
  final dynamic engName;
  final dynamic msgId;
  final dynamic status;

  factory LstPaymentWay.fromJson(Map<String, dynamic> json) => LstPaymentWay(
    parameterId: json["parameterId"] == null ? null : json["parameterId"],
    type: json["type"] == null ? null : json["type"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    seqNo: json["seqNo"] == null ? null : json["seqNo"],
    discription: json["discription"] == null ? null : json["discription"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    channelCode: json["channelCode"] == null ? null : json["channelCode"],
    groupName: json["groupName"],
    msgName: json["msgName"],
    vnName: json["vnName"],
    engName: json["engName"],
    msgId: json["msgId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "parameterId": parameterId == null ? null : parameterId,
    "type": type == null ? null : type,
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "displayName": displayName == null ? null : displayName,
    "seqNo": seqNo == null ? null : seqNo,
    "discription": discription == null ? null : discription,
    "createBy": createBy == null ? null : createBy,
    "createTime": createTime == null ? null : createTime,
    "updateBy": updateBy == null ? null : updateBy,
    "updateTime": updateTime == null ? null : updateTime,
    "channelCode": channelCode == null ? null : channelCode,
    "groupName": groupName,
    "msgName": msgName,
    "vnName": vnName,
    "engName": engName,
    "msgId": msgId,
    "status": status,
  };
}

class LstProduct {
  LstProduct({
    this.taxCode,
    this.maHHoa,
    this.tenHHoa,
    this.dvTinh,
    this.id,
    this.donGia,
    this.donGiaStr,
    this.tSuat,
    this.currency,
  });

  final String taxCode;
  final String maHHoa;
  final String tenHHoa;
  final String dvTinh;
  final int id;
  final double donGia;
  final dynamic donGiaStr;
  final String tSuat;
  final String currency;

  factory LstProduct.fromJson(Map<String, dynamic> json) => LstProduct(
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    maHHoa: json["maHHoa"] == null ? null : json["maHHoa"],
    tenHHoa: json["tenHHoa"] == null ? null : json["tenHHoa"],
    dvTinh: json["dvTinh"] == null ? null : json["dvTinh"],
    id: json["id"] == null ? null : json["id"],
    donGia: json["donGia"] == null ? null : json["donGia"].toDouble(),
    donGiaStr: json["donGiaStr"],
    tSuat: json["tSuat"] == null ? null : json["tSuat"],
    currency: json["currency"] == null ? null : json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "taxCode": taxCode == null ? null : taxCode,
    "maHHoa": maHHoa == null ? null : maHHoa,
    "tenHHoa": tenHHoa == null ? null : tenHHoa,
    "dvTinh": dvTinh == null ? null : dvTinh,
    "id": id == null ? null : id,
    "donGia": donGia == null ? null : donGia,
    "donGiaStr": donGiaStr,
    "tSuat": tSuat == null ? null : tSuat,
    "currency": currency == null ? null : currency,
  };
}


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

