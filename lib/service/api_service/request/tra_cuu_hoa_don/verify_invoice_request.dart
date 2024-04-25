import 'dart:convert';

class VerifyInvoiceQrRequest {
  VerifyInvoiceQrRequest({
    this.maKTra,
  });

  String maKTra;

  factory VerifyInvoiceQrRequest.fromJson(String str) => VerifyInvoiceQrRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory VerifyInvoiceQrRequest.fromMap(Map<String, dynamic> json) => VerifyInvoiceQrRequest(
    maKTra: json["maKTra"],
  );

  Map<String, dynamic> toJson() => {
    "maKTra": maKTra,
  };
}
