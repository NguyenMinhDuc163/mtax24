// To parse this JSON data, do
//
//     final getInfoCustomerByCodeResponse = getInfoCustomerByCodeResponseFromJson(jsonString);

import 'dart:convert';

GetInfoCustomerByCodeResponse getInfoCustomerByCodeResponseFromJson(String str) => GetInfoCustomerByCodeResponse.fromJson(json.decode(str));

String getInfoCustomerByCodeResponseToJson(GetInfoCustomerByCodeResponse data) => json.encode(data.toJson());

class GetInfoCustomerByCodeResponse {
  GetInfoCustomerByCodeResponse({
    this.mst,
    this.tenNnt,
    this.cqtQly,
    this.motaDiachi,
    this.dienThoai,
    this.fax,
    this.email,
    this.tenGdoc,
    this.tinTaxoId,
    this.payTaxoId,
    this.tenTat,
    this.tenHuyen,
    this.tenTinh,
    this.diaChi,
  });

  final String mst;
  final String tenNnt;
  final dynamic cqtQly;
  final String motaDiachi;
  final String dienThoai;
  final String fax;
  final String email;
  final dynamic tenGdoc;
  final String tinTaxoId;
  final String payTaxoId;
  final String tenTat;
  final String tenHuyen;
  final String tenTinh;
  final String diaChi;

  factory GetInfoCustomerByCodeResponse.fromJson(Map<String, dynamic> json) => GetInfoCustomerByCodeResponse(
    mst: json["mst"] == null ? null : json["mst"],
    tenNnt: json["ten_nnt"] == null ? null : json["ten_nnt"],
    cqtQly: json["cqt_qly"],
    motaDiachi: json["mota_diachi"] == null ? null : json["mota_diachi"],
    dienThoai: json["dien_thoai"] == null ? null : json["dien_thoai"],
    fax: json["fax"] == null ? null : json["fax"],
    email: json["email"] == null ? null : json["email"],
    tenGdoc: json["ten_gdoc"],
    tinTaxoId: json["tin_taxo_id"] == null ? null : json["tin_taxo_id"],
    payTaxoId: json["pay_taxo_id"] == null ? null : json["pay_taxo_id"],
    tenTat: json["ten_tat"] == null ? null : json["ten_tat"],
    tenHuyen: json["ten_huyen"] == null ? null : json["ten_huyen"],
    tenTinh: json["ten_tinh"] == null ? null : json["ten_tinh"],
    diaChi: json["dia_chi"] == null ? null : json["dia_chi"],
  );

  Map<String, dynamic> toJson() => {
    "mst": mst == null ? null : mst,
    "ten_nnt": tenNnt == null ? null : tenNnt,
    "cqt_qly": cqtQly,
    "mota_diachi": motaDiachi == null ? null : motaDiachi,
    "dien_thoai": dienThoai == null ? null : dienThoai,
    "fax": fax == null ? null : fax,
    "email": email == null ? null : email,
    "ten_gdoc": tenGdoc,
    "tin_taxo_id": tinTaxoId == null ? null : tinTaxoId,
    "pay_taxo_id": payTaxoId == null ? null : payTaxoId,
    "ten_tat": tenTat == null ? null : tenTat,
    "ten_huyen": tenHuyen == null ? null : tenHuyen,
    "ten_tinh": tenTinh == null ? null : tenTinh,
    "dia_chi": diaChi == null ? null : diaChi,
  };
}
