// To parse this JSON data, do
//
//     final traCuuHoaDonChiTietRequest = traCuuHoaDonChiTietRequestFromJson(jsonString);

import 'dart:convert';

TraCuuHoaDonChiTietRequest traCuuHoaDonChiTietRequestFromJson(String str) => TraCuuHoaDonChiTietRequest.fromJson(json.decode(str));

String traCuuHoaDonChiTietRequestToJson(TraCuuHoaDonChiTietRequest data) => json.encode(data.toJson());

class TraCuuHoaDonChiTietRequest {
  TraCuuHoaDonChiTietRequest({
    this.loaiHoaDon,
    this.id,
    this.trangThai,
    this.tinhChat,
  });

  final String loaiHoaDon;
  final String id;
  final String trangThai;
  final String tinhChat;

  factory TraCuuHoaDonChiTietRequest.fromJson(Map<String, dynamic> json) => TraCuuHoaDonChiTietRequest(
    loaiHoaDon: json["loaiHoaDon"] == null ? null : json["loaiHoaDon"],
    id: json["id"] == null ? null : json["id"],
    trangThai: json["trangThai"] == null ? null : json["trangThai"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
  );

  Map<String, dynamic> toJson() => {
    "loaiHoaDon": loaiHoaDon == null ? null : loaiHoaDon,
    "id": id == null ? null : id,
    "trangThai": trangThai == null ? null : trangThai,
    "tinhChat": tinhChat == null ? null : tinhChat,
  };
}
