// To parse this JSON data, do
//
//     final viewHDonRequest = viewHDonRequestFromJson(jsonString);

import 'dart:convert';

ViewHDonRequest viewHDonRequestFromJson(String str) => ViewHDonRequest.fromJson(json.decode(str));

String viewHDonRequestToJson(ViewHDonRequest data) => json.encode(data.toJson());

class ViewHDonRequest {
  ViewHDonRequest({
    this.loaiHoaDon,
    this.id,
    this.trangThai,
    this.tinhChat,
  });

  final String loaiHoaDon;
  final int id;
  final String trangThai;
  final String tinhChat;

  factory ViewHDonRequest.fromJson(Map<String, dynamic> json) => ViewHDonRequest(
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
