// To parse this JSON data, do
//
//     final corpInvoiceSerialRequest = corpInvoiceSerialRequestFromJson(jsonString);

import 'dart:convert';

CorpInvoiceSerialRequest corpInvoiceSerialRequestFromJson(String str) => CorpInvoiceSerialRequest.fromJson(json.decode(str));

String corpInvoiceSerialRequestToJson(CorpInvoiceSerialRequest data) => json.encode(data.toJson());

class CorpInvoiceSerialRequest {
  CorpInvoiceSerialRequest({
    this.taxCode,
    this.invoiceType,
    this.templateCode,
    this.serial,
  });

  final String taxCode;
  final String invoiceType;
  final String templateCode;
  final String serial;

  factory CorpInvoiceSerialRequest.fromJson(Map<String, dynamic> json) => CorpInvoiceSerialRequest(
    taxCode: json["tax_code"] == null ? null : json["tax_code"],
    invoiceType: json["invoice_type"] == null ? null : json["invoice_type"],
    templateCode: json["templateCode"] == null ? null : json["templateCode"],
    serial: json["serial"] == null ? null : json["serial"],
  );

  Map<String, dynamic> toJson() => {
    "tax_code": taxCode == null ? null : taxCode,
    "invoice_type": invoiceType == null ? null : invoiceType,
    "templateCode": templateCode == null ? null : templateCode,
    "serial": serial == null ? null : serial,
  };
}
