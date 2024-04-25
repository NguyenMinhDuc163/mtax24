// To parse this JSON data, do
//
//     final hoaDonXoaBoRequest = hoaDonXoaBoRequestFromJson(jsonString);

import 'dart:convert';

HoaDonXoaBoRequest hoaDonXoaBoRequestFromJson(String str) => HoaDonXoaBoRequest.fromJson(json.decode(str));

String hoaDonXoaBoRequestToJson(HoaDonXoaBoRequest data) => json.encode(data.toJson());

class HoaDonXoaBoRequest {
  HoaDonXoaBoRequest({
    this.loaihdon,
    this.tinhchat,
    this.sohdon,
    this.mstnmua,
    this.fromDate,
    this.toDate,
    this.mstNguoiBan,
    this.kyhieuhdon,
    this.emailnmua,
    this.page,
  });

  final String loaihdon;
  final String tinhchat;
  final String sohdon;
  final String mstnmua;
  final String fromDate;
  final String toDate;
  final String mstNguoiBan;
  final String kyhieuhdon;
  final String emailnmua;
  final int page;

  factory HoaDonXoaBoRequest.fromJson(Map<String, dynamic> json) => HoaDonXoaBoRequest(
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    tinhchat: json["tinhchat"] == null ? null : json["tinhchat"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    mstnmua: json["mstnmua"] == null ? null : json["mstnmua"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    mstNguoiBan: json["mstNguoiBan"] == null ? null : json["mstNguoiBan"],
    kyhieuhdon: json["kyhieuhdon"] == null ? null : json["kyhieuhdon"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    page: json["page"] == null ? null : json["page"],
  );

  Map<String, dynamic> toJson() => {
    "loaihdon": loaihdon == null ? null : loaihdon,
    "tinhchat": tinhchat == null ? null : tinhchat,
    "sohdon": sohdon == null ? null : sohdon,
    "mstnmua": mstnmua == null ? null : mstnmua,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "mstNguoiBan": mstNguoiBan == null ? null : mstNguoiBan,
    "kyhieuhdon": kyhieuhdon == null ? null : kyhieuhdon,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "page": page == null ? null : page,
  };
}
