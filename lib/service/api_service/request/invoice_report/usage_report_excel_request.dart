import 'dart:convert';

class UsageReportExcelRequest {
  UsageReportExcelRequest({
    this.bctheo,
    this.fromDate,
    this.isReport,
    this.nam,
    this.nguoidaidien,
    this.page,
    this.quy,
    this.taxCode,
    this.thang,
    this.toDate,
  });

  String bctheo;
  String fromDate;
  String isReport;
  String nam;
  String nguoidaidien;
  String page;
  String quy;
  String taxCode;
  String thang;
  String toDate;

  factory UsageReportExcelRequest.fromJson(String str) => UsageReportExcelRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsageReportExcelRequest.fromMap(Map<String, dynamic> json) => UsageReportExcelRequest(
    bctheo: json["bctheo"],
    fromDate: json["fromDate"],
    isReport: json["isReport"],
    nam: json["nam"],
    nguoidaidien: json["nguoidaidien"],
    page: json["page"],
    quy: json["quy"],
    taxCode: json["taxCode"],
    thang: json["thang"],
    toDate: json["toDate"],
  );

  Map<String, dynamic> toMap() => {
    "bctheo": bctheo,
    "fromDate": fromDate,
    "isReport": isReport,
    "nam": nam,
    "nguoidaidien": nguoidaidien,
    "page": page,
    "quy": quy,
    "taxCode": taxCode,
    "thang": thang,
    "toDate": toDate,
  };
}
