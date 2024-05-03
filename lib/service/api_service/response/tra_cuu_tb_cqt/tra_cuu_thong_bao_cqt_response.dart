// To parse this JSON data, do
//
//     final traCuuThongBaoCqtResponse = traCuuThongBaoCqtResponseFromJson(jsonString);

import 'dart:convert';

List<TraCuuThongBaoCqtResponse> traCuuThongBaoCqtResponseFromJson(String str) => List<TraCuuThongBaoCqtResponse>.from(json.decode(str).map((x) => TraCuuThongBaoCqtResponse.fromJson(x)));

String traCuuThongBaoCqtResponseToJson(List<TraCuuThongBaoCqtResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraCuuThongBaoCqtResponse {
  TraCuuThongBaoCqtResponse( {
    this.id,
    this.mauso,
    this.masothue,
    this.tentbao,
    this.soThongBao,
    this.ngayThongBao,
    this.ngayThongBaoConvert,
    this.contentxml,
    this.khhdon,
    this.mauhd,
    this.sohd,
    this.magdichtchieu,
    this.tentkhai,
    this.ngaylaphd,
    this.loaiThongBao,
    this.maLoi,
    this.moTaLoi,
  });

  final int id;
  final String mauso;
  final String masothue;
  final String tentbao;
  final String soThongBao;
  final int ngayThongBao;
  final String ngayThongBaoConvert;
  final String contentxml;
  final String khhdon;
  final dynamic mauhd;
  final String sohd;
  final String magdichtchieu;
  final String tentkhai;
  final dynamic ngaylaphd;
  final dynamic loaiThongBao;
  final String maLoi;
  final String moTaLoi;

  factory TraCuuThongBaoCqtResponse.fromJson(Map<String, dynamic> json) => TraCuuThongBaoCqtResponse(
    id: json["id"] == null ? null : json["id"],
    mauso: json["mauso"] == null ? null : json["mauso"],
    masothue: json["masothue"] == null ? null : json["masothue"],
    tentbao: json["tentbao"] == null ? null : json["tentbao"],
    soThongBao: json["soThongBao"] == null ? null : json["soThongBao"],
    ngayThongBao: json["ngayThongBao"] == null ? null : json["ngayThongBao"],
    ngayThongBaoConvert: json["ngayThongBaoConvert"] == null ? null : json["ngayThongBaoConvert"],
    contentxml: json["contentxml"] == null ? null : json["contentxml"],
    khhdon: json["khhdon"] == null ? null : json["khhdon"],
    mauhd: json["mauhd"],
    sohd: json["sohd"] == null ? null : json["sohd"],
    magdichtchieu: json["magdichtchieu"] == null ? null : json["magdichtchieu"],
    tentkhai: json["tentkhai"] == null ? null : json["tentkhai"],
    ngaylaphd: json["ngaylaphd"],
    loaiThongBao: json["loaiThongBao"],
    maLoi: json["maLoi"],
    moTaLoi: json["moTaLoi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "mauso": mauso == null ? null : mauso,
    "masothue": masothue == null ? null : masothue,
    "tentbao": tentbao == null ? null : tentbao,
    "soThongBao": soThongBao == null ? null : soThongBao,
    "ngayThongBao": ngayThongBao == null ? null : ngayThongBao,
    "ngayThongBaoConvert": ngayThongBaoConvert == null ? null : ngayThongBaoConvert,
    "contentxml": contentxml == null ? null : contentxml,
    "khhdon": khhdon == null ? null : khhdon,
    "mauhd": mauhd,
    "sohd": sohd == null ? null : sohd,
    "magdichtchieu": magdichtchieu == null ? null : magdichtchieu,
    "tentkhai": tentkhai == null ? null : tentkhai,
    "ngaylaphd": ngaylaphd,
    "loaiThongBao": loaiThongBao,
    "maLoi": maLoi,
    "moTaLoi": moTaLoi,
  };
}
