// To parse this JSON data, do
//
//     final traCuuThongBaoCqtRequest = traCuuThongBaoCqtRequestFromJson(jsonString);

import 'dart:convert';

TraCuuThongBaoCqtRequest traCuuThongBaoCqtRequestFromJson(String str) => TraCuuThongBaoCqtRequest.fromJson(json.decode(str));

String traCuuThongBaoCqtRequestToJson(TraCuuThongBaoCqtRequest data) => json.encode(data.toJson());

class TraCuuThongBaoCqtRequest {
  TraCuuThongBaoCqtRequest({
    this.loaitbao,
    this.fromDate,
    this.toDate,
    this.page,
  });

  final String loaitbao;
  final String fromDate;
  final String toDate;
  final String page;

  factory TraCuuThongBaoCqtRequest.fromJson(Map<String, dynamic> json) => TraCuuThongBaoCqtRequest(
    loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    page: json["page"] == null ? null : json["page"],
  );

  Map<String, dynamic> toJson() => {
    "loaitbao": loaitbao == null ? null : loaitbao,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "page": page == null ? null : page,
  };
}
