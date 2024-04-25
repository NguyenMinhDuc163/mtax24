// To parse this JSON data, do
//
//     final traCuuThongBaoRequest = traCuuThongBaoRequestFromJson(jsonString);

import 'dart:convert';

TraCuuThongBaoRequest traCuuThongBaoRequestFromJson(String str) => TraCuuThongBaoRequest.fromJson(json.decode(str));

String traCuuThongBaoRequestToJson(TraCuuThongBaoRequest data) => json.encode(data.toJson());

class TraCuuThongBaoRequest {
  TraCuuThongBaoRequest({
    this.trangthai,
    this.idNguoilap,
    this.loaiTBao,
    this.mstNban,
    this.page,
    this.soThongBao,
    this.tinhChat,
    this.toDate,
    this.fromDate,
    this.toDateShow,
    this.fromDateShow,
    this.loaiHoaDon,
  });

  final String trangthai;
  final String idNguoilap;
  final String loaiTBao;
  final String mstNban;
  final int page;
  final String soThongBao;
  final String tinhChat;
  final String toDate;
  final String fromDate;
  final DateTime toDateShow;
  final DateTime fromDateShow;
  final String loaiHoaDon;

  factory TraCuuThongBaoRequest.fromJson(Map<String, dynamic> json) => TraCuuThongBaoRequest(
    trangthai: json["trangThai"] == null ? null : json["trangThai"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    loaiTBao: json["loaiTBao"] == null ? null : json["loaiTBao"],
    mstNban: json["mstNBAN"] == null ? null : json["mstNBAN"],
    page: json["page"] == null ? null : json["page"],
    soThongBao: json["soThongBao"] == null ? null : json["soThongBao"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDateShow: json["toDateShow"] == null ? null : DateTime.parse(json["toDateShow"]),
    fromDateShow: json["fromDateShow"] == null ? null : DateTime.parse(json["fromDateShow"]),
    loaiHoaDon: json["loaiHoaDon"] == null ? null : json["loaiHoaDon"],
  );

  Map<String, dynamic> toJson() => {
    "trangThai": trangthai == null ? null : trangthai,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "loaiTBao": loaiTBao == null ? null : loaiTBao,
    "mstNBAN": mstNban == null ? null : mstNban,
    "page": page == null ? null : page,
    "soThongBao": soThongBao == null ? null : soThongBao,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "toDate": toDate == null ? null : toDate,
    "fromDate": fromDate == null ? null : fromDate,
    "toDateShow": toDateShow == null ? null : "${toDateShow.year.toString().padLeft(4, '0')}-${toDateShow.month.toString().padLeft(2, '0')}-${toDateShow.day.toString().padLeft(2, '0')}",
    "fromDateShow": fromDateShow == null ? null : "${fromDateShow.year.toString().padLeft(4, '0')}-${fromDateShow.month.toString().padLeft(2, '0')}-${fromDateShow.day.toString().padLeft(2, '0')}",
    "loaiHoaDon": loaiHoaDon == null ? null : loaiHoaDon,
  };
}
