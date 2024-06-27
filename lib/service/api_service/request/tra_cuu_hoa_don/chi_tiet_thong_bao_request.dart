// To parse this JSON data, do
//
//     final chiTietThongBaoRequest = chiTietThongBaoRequestFromJson(jsonString);

import 'dart:convert';

ChiTietThongBaoRequest chiTietThongBaoRequestFromJson(String str) => ChiTietThongBaoRequest.fromJson(json.decode(str));

String chiTietThongBaoRequestToJson(ChiTietThongBaoRequest data) => json.encode(data.toJson());

class ChiTietThongBaoRequest {
  ChiTietThongBaoRequest({
    this.loaiHoaDon,
    this.id,
    this.trangThai,
    this.tinhChat,
    this.isView,
  });

  final String loaiHoaDon;
  final String id;
  final String trangThai;
  final String tinhChat;
  final String isView;

  factory ChiTietThongBaoRequest.fromJson(Map<String, dynamic> json) => ChiTietThongBaoRequest(
    loaiHoaDon: json["loaiHoaDon"] == null ? null : json["loaiHoaDon"],
    id: json["id"] == null ? null : json["id"],
    trangThai: json["trangThai"] == null ? null : json["trangThai"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    isView: json["isView"] == null ? null : json["isView"],
  );

  Map<String, dynamic> toJson() => {
    "loaiHoaDon": loaiHoaDon == null ? null : loaiHoaDon,
    "id": id == null ? null : id,
    "trangThai": trangThai == null ? null : trangThai,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "isView": isView == null ? null : isView,
  };
}
