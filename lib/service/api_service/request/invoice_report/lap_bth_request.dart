// To parse this JSON data, do
//
//     final lapBthRequest = lapBthRequestFromJson(jsonString);

import 'dart:convert';

LapBthRequest lapBthRequestFromJson(String str) => LapBthRequest.fromJson(json.decode(str));

String lapBthRequestToJson(LapBthRequest data) => json.encode(data.toJson());

class LapBthRequest {
  LapBthRequest({
    this.nam,
    this.thang,
    this.quy,
    this.ghiChu,
    this.bctheo,
    this.lanDau,
    this.loaihoadon,
    this.boSung,
    this.fromDate,
    this.toDate,
  });

  final String nam;
  final String thang;
  final String quy;
  final String ghiChu;
  final String bctheo;
  final String lanDau;
  final String loaihoadon;
  final String boSung;
  final String fromDate;
  final String toDate;

  factory LapBthRequest.fromJson(Map<String, dynamic> json) => LapBthRequest(
    nam: json["nam"] == null ? null : json["nam"],
    thang: json["thang"] == null ? null : json["thang"],
    quy: json["quy"] == null ? null : json["quy"],
    ghiChu: json["ghiChu"] == null ? null : json["ghiChu"],
    bctheo: json["bctheo"] == null ? null : json["bctheo"],
    lanDau: json["lanDau"] == null ? null : json["lanDau"],
    loaihoadon: json["loaihoadon"] == null ? null : json["loaihoadon"],
    boSung: json["boSung"] == null ? null : json["boSung"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
  );

  Map<String, dynamic> toJson() => {
    "nam": nam == null ? null : nam,
    "thang": thang == null ? null : thang,
    "quy": quy == null ? null : quy,
    "ghiChu": ghiChu == null ? null : ghiChu,
    "bctheo": bctheo == null ? null : bctheo,
    "lanDau": lanDau == null ? null : lanDau,
    "loaihoadon": loaihoadon == null ? null : loaihoadon,
    "boSung": boSung == null ? null : boSung,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
  };
}
