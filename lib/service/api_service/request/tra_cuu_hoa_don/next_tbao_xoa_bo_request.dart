// To parse this JSON data, do
//
//     final nextTBaoXoaBoRequest = nextTBaoXoaBoRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:mtax24/service/api_service/response/tra_cuu_hoa_don/chi_tiet_thong_bao_response.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_hoa_don/thao_tac_lap_tbao_xoa_bo_response.dart';

NextTBaoXoaBoRequest nextTBaoXoaBoRequestFromJson(String str) => NextTBaoXoaBoRequest.fromJson(json.decode(str));

String nextTBaoXoaBoRequestToJson(NextTBaoXoaBoRequest data) => json.encode(data.toJson());

class NextTBaoXoaBoRequest {
  NextTBaoXoaBoRequest({
    @required this.soVBan,
    @required this.lyDoXoaBo,
    @required this.ngayKyVanBan,
    @required this.inReq,
    @required this.portalTbaoReq,
    @required this.tctbao,
    @required this.pincode,
    @required this.lTBao,
  });

  String soVBan;
  String lyDoXoaBo;
  String ngayKyVanBan;
  InReq inReq;
  ThongBaoHdr portalTbaoReq;
  String tctbao;
  String pincode;
  String lTBao;

  factory NextTBaoXoaBoRequest.fromJson(Map<String, dynamic> json) => NextTBaoXoaBoRequest(
    soVBan: json["soVBan"] == null ? null : json["soVBan"],
    lyDoXoaBo: json["lyDoXoaBo"] == null ? null : json["lyDoXoaBo"],
    ngayKyVanBan: json["ngayKyVanBan"] == null ? null : json["ngayKyVanBan"],
    inReq: json["inReq"] == null ? null : InReq.fromJson(json["inReq"]),
    portalTbaoReq: json["portalTbaoReq"] == null ? null : ThongBaoHdr.fromJson(json["portalTbaoReq"]),
    tctbao: json["tctbao"] == null ? null : json["tctbao"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    lTBao: json["lTBao"] == null ? null : json["lTBao"],
  );

  Map<String, dynamic> toJson() => {
    "soVBan": soVBan == null ? null : soVBan,
    "lyDoXoaBo": lyDoXoaBo == null ? null : lyDoXoaBo,
    "ngayKyVanBan": ngayKyVanBan == null ? null : ngayKyVanBan,
    "inReq": inReq == null ? null : inReq.toJson(),
    "portalTbaoReq": portalTbaoReq == null ? null : portalTbaoReq.toJson(),
    "tctbao": tctbao == null ? null : tctbao,
    "pincode": pincode == null ? null : pincode,
    "lTBao": lTBao == null ? null : lTBao,
  };
}

