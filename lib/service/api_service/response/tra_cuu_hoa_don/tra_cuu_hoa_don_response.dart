// To parse this JSON data, do
//
//     final traCuuHoaDonResponse = traCuuHoaDonResponseFromJson(jsonString);

import 'dart:convert';

List<TraCuuHoaDonResponse> traCuuHoaDonResponseFromJson(String str) => List<TraCuuHoaDonResponse>.from(json.decode(str).map((x) => TraCuuHoaDonResponse.fromJson(x)));

String traCuuHoaDonResponseToJson(List<TraCuuHoaDonResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraCuuHoaDonResponse {
  TraCuuHoaDonResponse({
    this.tinhChat,
    this.tinhchatgoc,
    this.trangThai,
    this.loaiHoaDon,
    this.tenhdon,
    this.mauHoaDon,
    this.soHoaDonDoanhNghiep,
    this.ngayLapHoaDon,
    this.mstNgMua,
    this.tongTienThanhToan,
    this.tongTienThue,
    this.soHoaDonCqt,
    this.soHoaDonGoc,
    this.moTaLoi,
    this.lyDoTuChoi,
    this.matte,
    this.id,
    this.tendvinmua,
    this.khieuhdon,
    this.totalPage,
    this.mstNgBan,
    this.tenNgBan,
    this.dchinmua,
    this.confirm,
    this.adjustType,
    this.hthucHDonGoc,
    this.ngayHDon,
    this.trangthaiCQT,
    this.tenNmua,
  });

  final String tinhChat;
  final String tinhchatgoc;
  final String trangThai;
  final String loaiHoaDon;
  final String tenhdon;
  final String mauHoaDon;
  final String soHoaDonDoanhNghiep;
  final String ngayLapHoaDon;
  final String mstNgMua;
  final String tongTienThanhToan;
  final String tongTienThue;
  final String soHoaDonCqt;
  final String soHoaDonGoc;
  final String moTaLoi;
  final String lyDoTuChoi;
  final String matte;
  final String id;
  final String tendvinmua;
  final String khieuhdon;
  final String totalPage;
  final dynamic mstNgBan;
  final dynamic tenNgBan;
  final String dchinmua;
  final String confirm;
  final String adjustType;
  final dynamic hthucHDonGoc;
  final dynamic ngayHDon;
  final dynamic trangthaiCQT;
  final dynamic tenNmua;

  factory TraCuuHoaDonResponse.fromJson(Map<String, dynamic> json) => TraCuuHoaDonResponse(
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    trangThai: json["trangThai"] == null ? null : json["trangThai"],
    loaiHoaDon: json["loaiHoaDon"] == null ? null : json["loaiHoaDon"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    mauHoaDon: json["mauHoaDon"] == null ? null : json["mauHoaDon"],
    soHoaDonDoanhNghiep: json["soHoaDonDoanhNghiep"] == null ? null : json["soHoaDonDoanhNghiep"],
    ngayLapHoaDon: json["ngayLapHoaDon"] == null ? null : json["ngayLapHoaDon"],
    mstNgMua: json["mstNgMua"] == null ? null : json["mstNgMua"],
    tongTienThanhToan: json["tongTienThanhToan"] == null ? null : json["tongTienThanhToan"],
    tongTienThue: json["tongTienThue"] == null ? null : json["tongTienThue"],
    soHoaDonCqt: json["soHoaDonCQT"] == null ? null : json["soHoaDonCQT"],
    soHoaDonGoc: json["soHoaDonGoc"] == null ? null : json["soHoaDonGoc"],
    moTaLoi: json["moTaLoi"] == null ? null : json["moTaLoi"],
    lyDoTuChoi: json["lyDoTuChoi"] == null ? null : json["lyDoTuChoi"],
    matte: json["matte"] == null ? null : json["matte"],
    id: json["id"] == null ? null : json["id"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
    mstNgBan: json["mstNgBan"],
    tenNgBan: json["tenNgBan"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    confirm: json["confirm"] == null ? null : json["confirm"],
    adjustType: json["adjustType"] == null ? null : json["adjustType"],
    ngayHDon: json["ngayHDon"] == null ? null : json["ngayHDon"],
    trangthaiCQT: json["trangthaiCQT"] == null ? null : json["trangthaiCQT"],
    tenNmua: json["tenNmua"] == null ? null : json["tenNmua"],
    hthucHDonGoc: json["hthucHDonGoc"],
  );

  Map<String, dynamic> toJson() => {
    "tinhChat": tinhChat == null ? null : tinhChat,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "trangThai": trangThai == null ? null : trangThai,
    "loaiHoaDon": loaiHoaDon == null ? null : loaiHoaDon,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "mauHoaDon": mauHoaDon == null ? null : mauHoaDon,
    "soHoaDonDoanhNghiep": soHoaDonDoanhNghiep == null ? null : soHoaDonDoanhNghiep,
    "ngayLapHoaDon": ngayLapHoaDon == null ? null : ngayLapHoaDon,
    "mstNgMua": mstNgMua == null ? null : mstNgMua,
    "tongTienThanhToan": tongTienThanhToan == null ? null : tongTienThanhToan,
    "tongTienThue": tongTienThue == null ? null : tongTienThue,
    "soHoaDonCQT": soHoaDonCqt == null ? null : soHoaDonCqt,
    "soHoaDonGoc": soHoaDonGoc == null ? null : soHoaDonGoc,
    "moTaLoi": moTaLoi == null ? null : moTaLoi,
    "lyDoTuChoi": lyDoTuChoi == null ? null : lyDoTuChoi,
    "matte": matte == null ? null : matte,
    "id": id == null ? null : id,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "totalPage": totalPage == null ? null : totalPage,
    "mstNgBan": mstNgBan,
    "tenNgBan": tenNgBan,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "confirm": confirm == null ? null : confirm,
    "adjustType": adjustType == null ? null : adjustType,
    "ngayHDon": ngayHDon == null ? null : ngayHDon,
    "trangthaiCQT": trangthaiCQT == null ? null : trangthaiCQT,
    "tenNmua": tenNmua == null ? null : tenNmua,
    "hthucHDonGoc": hthucHDonGoc,
  };
}




