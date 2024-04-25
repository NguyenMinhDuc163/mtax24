// To parse this JSON data, do
//
//     final serialInvoiceResponse = serialInvoiceResponseFromJson(jsonString);

import 'dart:convert';

List<SerialInvoiceResponse> serialInvoiceResponseFromJson(String str) => List<SerialInvoiceResponse>.from(json.decode(str).map((x) => SerialInvoiceResponse.fromJson(x)));

String serialInvoiceResponseToJson(List<SerialInvoiceResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SerialInvoiceResponse {
  SerialInvoiceResponse({
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
  final dynamic invoiceTemplate;
  final String invoiceSerial;
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

  factory SerialInvoiceResponse.fromJson(Map<String, dynamic> json) => SerialInvoiceResponse(
    serialId: json["serialId"],
    taxCode: json["taxCode"],
    invoiceType: json["invoiceType"] == null ? null : json["invoiceType"],
    invoiceTypeName: json["invoiceTypeName"],
    invoiceTemplate: json["invoiceTemplate"],
    invoiceSerial: json["invoiceSerial"] == null ? null : json["invoiceSerial"],
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
    "invoiceTemplate": invoiceTemplate,
    "invoiceSerial": invoiceSerial == null ? null : invoiceSerial,
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
