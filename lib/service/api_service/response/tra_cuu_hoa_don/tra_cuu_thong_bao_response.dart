// To parse this JSON data, do
//
//     final traCuuThongBaoResponse = traCuuThongBaoResponseFromJson(jsonString);

import 'dart:convert';

TraCuuThongBaoResponse traCuuThongBaoResponseFromJson(String str) => TraCuuThongBaoResponse.fromJson(json.decode(str));

String traCuuThongBaoResponseToJson(TraCuuThongBaoResponse data) => json.encode(data.toJson());

class TraCuuThongBaoResponse {
  TraCuuThongBaoResponse({
    this.mstNban,
    this.loaitbao,
    this.tinhChat,
    this.sotbaocqt,
    this.sotbao,
    this.ngayhdcqt,
    this.ngayLap,
    this.trangthai,
    this.id,
    this.lydoTchoi,
    this.idNguoilap,
    this.hThucHDonGoc,
    this.status,
    this.sohdongoc,
    this.totalPage,
  });

  final String mstNban;
  final String loaitbao;
  final String tinhChat;
  final dynamic sotbaocqt;
  final String sotbao;
  final dynamic ngayhdcqt;
  final String ngayLap;
  final String trangthai;
  final String id;
  final dynamic lydoTchoi;
  final String idNguoilap;
  final String hThucHDonGoc;
  final String status;
  final String sohdongoc;
  final String totalPage;

  factory TraCuuThongBaoResponse.fromJson(Map<String, dynamic> json) => TraCuuThongBaoResponse(
    mstNban: json["mstNban"] == null ? null : json["mstNban"],
    loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    sotbaocqt: json["sotbaocqt"],
    sotbao: json["sotbao"] == null ? null : json["sotbao"],
    ngayhdcqt: json["ngayhdcqt"],
    ngayLap: json["ngayLap"] == null ? null : json["ngayLap"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    id: json["id"] == null ? null : json["id"],
    lydoTchoi: json["lydoTchoi"],
    idNguoilap: json["idNguoilap"] == null ? null : json["idNguoilap"],
    hThucHDonGoc: json["hThucHDonGoc"] == null ? null : json["hThucHDonGoc"],
    status: json["status"] == null ? null : json["status"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "mstNban": mstNban == null ? null : mstNban,
    "loaitbao": loaitbao == null ? null : loaitbao,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "sotbaocqt": sotbaocqt,
    "sotbao": sotbao == null ? null : sotbao,
    "ngayhdcqt": ngayhdcqt,
    "ngayLap": ngayLap == null ? null : ngayLap,
    "trangthai": trangthai == null ? null : trangthai,
    "id": id == null ? null : id,
    "lydoTchoi": lydoTchoi,
    "idNguoilap": idNguoilap == null ? null : idNguoilap,
    "hThucHDonGoc": hThucHDonGoc == null ? null : hThucHDonGoc,
    "status": status == null ? null : status,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "totalPage": totalPage == null ? null : totalPage,
  };
}
