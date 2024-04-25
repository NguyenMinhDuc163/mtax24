// To parse this JSON data, do
//
//     final getListHangHoaByMaRequest = getListHangHoaByMaRequestFromJson(jsonString);

import 'dart:convert';

GetListHangHoaByMaRequest getListHangHoaByMaRequestFromJson(String str) => GetListHangHoaByMaRequest.fromJson(json.decode(str));

String getListHangHoaByMaRequestToJson(GetListHangHoaByMaRequest data) => json.encode(data.toJson());

class GetListHangHoaByMaRequest {
  GetListHangHoaByMaRequest({
    this.taxCode,
    this.maHHoa,
    this.currency,
    this.invoiceType,
  });

  final String taxCode;
  final String maHHoa;
  final String currency;
  final String invoiceType;

  factory GetListHangHoaByMaRequest.fromJson(Map<String, dynamic> json) => GetListHangHoaByMaRequest(
    taxCode: json["taxCode"] == null ? null : json["taxCode"],
    maHHoa: json["maHHoa"] == null ? null : json["maHHoa"],
    currency: json["currency"] == null ? null : json["currency"],
    invoiceType: json["invoice_type"] == null ? null : json["invoice_type"],
  );

  Map<String, dynamic> toJson() => {
    "taxCode": taxCode == null ? null : taxCode,
    "maHHoa": maHHoa == null ? null : maHHoa,
    "currency": currency == null ? null : currency,
    "invoice_type": invoiceType == null ? null : invoiceType,
  };
}
