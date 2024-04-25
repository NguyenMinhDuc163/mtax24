import 'dart:convert';

class UsageReportRequest {
  UsageReportRequest({
    this.bctheo,
    this.fromDate,
    this.fromDateShow,
    this.nam,
    this.nguoidaidien,
    this.quy,
    this.taxCode,
    this.thang,
    this.toDate,
    this.toDateShow,
  });

  String bctheo;
  String fromDate;
  String fromDateShow;
  String nam;
  String nguoidaidien;
  String quy;
  String taxCode;
  String thang;
  String toDate;
  String toDateShow;

  factory UsageReportRequest.fromJson(String str) => UsageReportRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsageReportRequest.fromMap(Map<String, dynamic> json) => UsageReportRequest(
    bctheo: json["bctheo"],
    fromDate: json["fromDate"],
    fromDateShow: json["fromDateShow"],
    nam: json["nam"],
    nguoidaidien: json["nguoidaidien"],
    quy: json["quy"],
    taxCode: json["taxCode"],
    thang: json["thang"],
    toDate: json["toDate"],
    toDateShow: json["toDateShow"],
  );

  Map<String, dynamic> toMap() => {
    "bctheo": bctheo,
    "fromDate": fromDate,
    "fromDateShow": fromDateShow,
    "nam": nam,
    "nguoidaidien": nguoidaidien,
    "quy": quy,
    "taxCode": taxCode,
    "thang": thang,
    "toDate": toDate,
    "toDateShow": toDateShow,
  };
}
