// To parse this JSON data, do
//
//     final lapTBaoDcDinhDanhResponse = lapTBaoDcDinhDanhResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'chi_tiet_thong_bao_response.dart';

LapTBaoDcDinhDanhResponse lapTBaoDcDinhDanhResponseFromJson(String str) => LapTBaoDcDinhDanhResponse.fromJson(json.decode(str));

String lapTBaoDcDinhDanhResponseToJson(LapTBaoDcDinhDanhResponse data) => json.encode(data.toJson());

class LapTBaoDcDinhDanhResponse {
  LapTBaoDcDinhDanhResponse({
    @required this.portalListInvoiceHdrTbao,
    @required this.transtion,
  });

  List<LstInvoiceDtlTbao> portalListInvoiceHdrTbao;
  String transtion;

  factory LapTBaoDcDinhDanhResponse.fromJson(Map<String, dynamic> json) => LapTBaoDcDinhDanhResponse(
    portalListInvoiceHdrTbao: json["portalListInvoiceHdrTbao"] == null ? null : List<LstInvoiceDtlTbao>.from(json["portalListInvoiceHdrTbao"].map((x) => LstInvoiceDtlTbao.fromJson(x))),
    transtion: json["transtion"] == null ? null : json["transtion"],
  );

  Map<String, dynamic> toJson() => {
    "portalListInvoiceHdrTbao": portalListInvoiceHdrTbao == null ? null : List<dynamic>.from(portalListInvoiceHdrTbao.map((x) => x.toJson())),
    "transtion": transtion == null ? null : transtion,
  };
}
