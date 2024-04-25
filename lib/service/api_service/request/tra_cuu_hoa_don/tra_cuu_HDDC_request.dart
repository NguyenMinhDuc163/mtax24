// To parse this JSON data, do
//
//     final traCuuHddcRequest = traCuuHddcRequestFromJson(jsonString);

import 'dart:convert';

TraCuuHddcRequest traCuuHddcRequestFromJson(String str) => TraCuuHddcRequest.fromJson(json.decode(str));

String traCuuHddcRequestToJson(TraCuuHddcRequest data) => json.encode(data.toJson());

class TraCuuHddcRequest {
  TraCuuHddcRequest({
    this.loaihdon,
    this.tinhchat,
    this.sohdon,
    this.mahdon,
    this.kihieu,
    this.mstnmua,
    this.emailnmua,
    this.fromDate,
    this.toDate,
    this.page,
  });

  final String loaihdon;
  final String tinhchat;
  final String sohdon;
  final String mahdon;
  final String kihieu;
  final String mstnmua;
  final String emailnmua;
  final String fromDate;
  final String toDate;
  final int page;

  factory TraCuuHddcRequest.fromJson(Map<String, dynamic> json) => TraCuuHddcRequest(
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    tinhchat: json["tinhchat"] == null ? null : json["tinhchat"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    mahdon: json["mahdon"] == null ? null : json["mahdon"],
    kihieu: json["kihieu"] == null ? null : json["kihieu"],
    mstnmua: json["mstnmua"] == null ? null : json["mstnmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    page: json["page"] == null ? null : json["page"],
  );

  Map<String, dynamic> toJson() => {
    "loaihdon": loaihdon == null ? null : loaihdon,
    "tinhchat": tinhchat == null ? null : tinhchat,
    "sohdon": sohdon == null ? null : sohdon,
    "mahdon": mahdon == null ? null : mahdon,
    "kihieu": kihieu == null ? null : kihieu,
    "mstnmua": mstnmua == null ? null : mstnmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "page": page == null ? null : page,
  };
}
