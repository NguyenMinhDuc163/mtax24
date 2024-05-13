// To parse this JSON data, do
//
//     final getListHangHoaByMaResponse = getListHangHoaByMaResponseFromJson(jsonString);

import 'dart:convert';

List<GetListHangHoaByMaResponse> getListHangHoaByMaResponseFromJson(String str) => List<GetListHangHoaByMaResponse>.from(json.decode(str).map((x) => GetListHangHoaByMaResponse.fromJson(x)));

String getListHangHoaByMaResponseToJson(List<GetListHangHoaByMaResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListHangHoaByMaResponse {
  GetListHangHoaByMaResponse({
    this.taxCode,
    this.maHHoa,
    this.tenHHoa,
    this.dvTinh,
    this.id,
    this.donGia,
    this.donGiaStr,
    this.tSuat,
    this.currency,

    this.number,
    this.thueSuat,
    this.type,
    this.chietKhau,
    this.tongTienDV,
    this.tienGTGT,
    this.thanhTien,
  });

  final String taxCode;
  final String maHHoa;
  final String tenHHoa;
  final String dvTinh;
  final int id;
  double donGia;
  final dynamic donGiaStr;
  final String tSuat;
  final String currency;

  double number;
  String thueSuat;
  int type;
  int chietKhau;
  double tongTienDV;
  double tienGTGT;
  double thanhTien;

  factory GetListHangHoaByMaResponse.fromJson(Map<String, dynamic> json) => GetListHangHoaByMaResponse(
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    maHHoa: json["maHHoa"] == null ? null : json["maHHoa"],
    tenHHoa: json["tenHHoa"] == null ? null : json["tenHHoa"],
    dvTinh: json["dvTinh"] == null ? null : json["dvTinh"],
    id: json["id"] == null ? null : json["id"],
    donGia: json["donGia"] == null ? null : json["donGia"].toDouble(),
    donGiaStr: json["donGiaStr"],
    tSuat: json["tSuat"] == null ? null : json["tSuat"],
    currency: json["currency"] == null ? null : json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "taxCode": taxCode == null ? null : taxCode,
    "maHHoa": maHHoa == null ? null : maHHoa,
    "tenHHoa": tenHHoa == null ? null : tenHHoa,
    "dvTinh": dvTinh == null ? null : dvTinh,
    "id": id == null ? null : id,
    "donGia": donGia == null ? null : donGia,
    "donGiaStr": donGiaStr,
    "tSuat": tSuat == null ? null : tSuat,
    "currency": currency == null ? null : currency,
  };
}



