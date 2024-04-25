// To parse this JSON data, do
//
//     final tiepTucTBaoDcDinhDanhResponse = tiepTucTBaoDcDinhDanhResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'chi_tiet_thong_bao_response.dart';

TiepTucTBaoDcDinhDanhResponse tiepTucTBaoDcDinhDanhResponseFromJson(String str) => TiepTucTBaoDcDinhDanhResponse.fromJson(json.decode(str));

String tiepTucTBaoDcDinhDanhResponseToJson(TiepTucTBaoDcDinhDanhResponse data) => json.encode(data.toJson());

class TiepTucTBaoDcDinhDanhResponse {
  TiepTucTBaoDcDinhDanhResponse({
    @required this.portalHdrTbao,
    @required this.portalListInvoiceHdrTbao,
    @required this.txStatus,
    @required this.isHsm,
  });

  ThongBaoHdr portalHdrTbao;
  List<LstInvoiceDtlTbao> portalListInvoiceHdrTbao;
  TxStatus txStatus;
  String isHsm;

  factory TiepTucTBaoDcDinhDanhResponse.fromJson(Map<String, dynamic> json) => TiepTucTBaoDcDinhDanhResponse(
    portalHdrTbao: json["portalHdrTbao"] == null ? null : ThongBaoHdr.fromJson(json["portalHdrTbao"]),
    portalListInvoiceHdrTbao: json["portalListInvoiceHdrTbao"] == null ? null : List<LstInvoiceDtlTbao>.from(json["portalListInvoiceHdrTbao"].map((x) => LstInvoiceDtlTbao.fromJson(x))),
    txStatus: json["txStatus"] == null ? null : TxStatus.fromJson(json["txStatus"]),
    isHsm: json["isHSM"] == null ? null : json["isHSM"],
  );

  Map<String, dynamic> toJson() => {
    "portalHdrTbao": portalHdrTbao == null ? null : portalHdrTbao.toJson(),
    "portalListInvoiceHdrTbao": portalListInvoiceHdrTbao == null ? null : List<dynamic>.from(portalListInvoiceHdrTbao.map((x) => x.toJson())),
    "txStatus": txStatus == null ? null : txStatus.toJson(),
    "isHSM": isHsm == null ? null : isHsm,
  };
}

class TxStatus {
  TxStatus({
    @required this.code,
    @required this.desc,
    @required this.displayNameMap,
  });

  String code;
  String desc;
  dynamic displayNameMap;

  factory TxStatus.fromJson(Map<String, dynamic> json) => TxStatus(
    code: json["code"] == null ? null : json["code"],
    desc: json["desc"] == null ? null : json["desc"],
    displayNameMap: json["displayNameMap"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "desc": desc == null ? null : desc,
    "displayNameMap": displayNameMap,
  };
}
