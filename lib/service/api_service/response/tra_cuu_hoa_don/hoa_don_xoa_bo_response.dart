// To parse this JSON data, do
//
//     final hoaDonXoaBoResponse = hoaDonXoaBoResponseFromJson(jsonString);

import 'dart:convert';

List<HoaDonXoaBoResponse> hoaDonXoaBoResponseFromJson(String str) => List<HoaDonXoaBoResponse>.from(json.decode(str).map((x) => HoaDonXoaBoResponse.fromJson(x)));

String hoaDonXoaBoResponseToJson(List<HoaDonXoaBoResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HoaDonXoaBoResponse {
  HoaDonXoaBoResponse({
    this.id,
    this.loaihdon,
    this.mstNmua,
    this.sohdon,
    this.trangthai,
    this.tinhChat,
    this.tinhchatgoc,
    this.ngayhdon,
    this.tenhdon,
    this.tennmua,
    this.cdKhieuhdon,
    this.cdMauhdon,
    this.sohdongoc,
    this.hthuchdongoc,
    this.khieuhdon,
    this.mauhdon,
    this.totalPage,
  });

  final String id;
  final String loaihdon;
  final String mstNmua;
  final String sohdon;
  final String trangthai;
  final String tinhChat;
  final String tinhchatgoc;
  final String ngayhdon;
  final String tenhdon;
  final String tennmua;
  final String cdKhieuhdon;
  final String cdMauhdon;
  final dynamic sohdongoc;
  final String hthuchdongoc;
  final String khieuhdon;
  final String mauhdon;
  final String totalPage;

  factory HoaDonXoaBoResponse.fromJson(Map<String, dynamic> json) => HoaDonXoaBoResponse(
    id: json["id"] == null ? null : json["id"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    sohdongoc: json["sohdongoc"],
    hthuchdongoc: json["hthuchdongoc"] == null ? null : json["hthuchdongoc"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "sohdon": sohdon == null ? null : sohdon,
    "trangthai": trangthai == null ? null : trangthai,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "ngayhdon": ngayhdon == null ? null : ngayhdon,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "tennmua": tennmua == null ? null : tennmua,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "sohdongoc": sohdongoc,
    "hthuchdongoc": hthuchdongoc == null ? null : hthuchdongoc,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "totalPage": totalPage == null ? null : totalPage,
  };
}
