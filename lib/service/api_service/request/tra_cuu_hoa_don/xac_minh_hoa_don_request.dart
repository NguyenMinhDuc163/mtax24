// To parse this JSON data, do
//
//     final xacMinhHoaDonRequest = xacMinhHoaDonRequestFromJson(jsonString);

import 'dart:convert';

XacMinhHoaDonRequest xacMinhHoaDonRequestFromJson(String str) => XacMinhHoaDonRequest.fromJson(json.decode(str));

String xacMinhHoaDonRequestToJson(XacMinhHoaDonRequest data) => json.encode(data.toJson());

class XacMinhHoaDonRequest {
  XacMinhHoaDonRequest({
    this.maKTra,
  });

  final String maKTra;

  factory XacMinhHoaDonRequest.fromJson(Map<String, dynamic> json) => XacMinhHoaDonRequest(
    maKTra: json["maKTra"] == null ? null : json["maKTra"],
  );

  Map<String, dynamic> toJson() => {
    "maKTra": maKTra == null ? null : maKTra,
  };
}
