// To parse this JSON data, do
//
//     final dMucThongBaoCqtResponse = dMucThongBaoCqtResponseFromJson(jsonString);

import 'dart:convert';

List<DMucThongBaoCqtResponse> dMucThongBaoCqtResponseFromJson(String str) => List<DMucThongBaoCqtResponse>.from(json.decode(str).map((x) => DMucThongBaoCqtResponse.fromJson(x)));

String dMucThongBaoCqtResponseToJson(List<DMucThongBaoCqtResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DMucThongBaoCqtResponse {
  DMucThongBaoCqtResponse({
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
  });

  final int id;
  final String mauso;
  final dynamic masothue;
  final String tentbao;
  final dynamic soThongBao;
  final dynamic ngayThongBao;
  final dynamic ngayThongBaoConvert;
  final dynamic contentxml;
  final dynamic khhdon;
  final dynamic mauhd;
  final dynamic sohd;
  final dynamic magdichtchieu;
  final dynamic tentkhai;
  final dynamic ngaylaphd;
  final dynamic loaiThongBao;

  factory DMucThongBaoCqtResponse.fromJson(Map<String, dynamic> json) => DMucThongBaoCqtResponse(
    id: json["id"] == null ? null : json["id"],
    mauso: json["mauso"] == null ? null : json["mauso"],
    masothue: json["masothue"],
    tentbao: json["tentbao"] == null ? null : json["tentbao"],
    soThongBao: json["soThongBao"],
    ngayThongBao: json["ngayThongBao"],
    ngayThongBaoConvert: json["ngayThongBaoConvert"],
    contentxml: json["contentxml"],
    khhdon: json["khhdon"],
    mauhd: json["mauhd"],
    sohd: json["sohd"],
    magdichtchieu: json["magdichtchieu"],
    tentkhai: json["tentkhai"],
    ngaylaphd: json["ngaylaphd"],
    loaiThongBao: json["loaiThongBao"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "mauso": mauso == null ? null : mauso,
    "masothue": masothue,
    "tentbao": tentbao == null ? null : tentbao,
    "soThongBao": soThongBao,
    "ngayThongBao": ngayThongBao,
    "ngayThongBaoConvert": ngayThongBaoConvert,
    "contentxml": contentxml,
    "khhdon": khhdon,
    "mauhd": mauhd,
    "sohd": sohd,
    "magdichtchieu": magdichtchieu,
    "tentkhai": tentkhai,
    "ngaylaphd": ngaylaphd,
    "loaiThongBao": loaiThongBao,
  };
}
