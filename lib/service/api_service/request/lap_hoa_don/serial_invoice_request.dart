// To parse this JSON data, do
//
//     final serialInvoiceRequest = serialInvoiceRequestFromJson(jsonString);

import 'dart:convert';

SerialInvoiceRequest serialInvoiceRequestFromJson(String str) => SerialInvoiceRequest.fromJson(json.decode(str));

String serialInvoiceRequestToJson(SerialInvoiceRequest data) => json.encode(data.toJson());

class SerialInvoiceRequest {
  SerialInvoiceRequest({
    this.taxCode,
    this.invoiceType,
    this.templateCode,
    this.isTraCuu,
  });

  final String taxCode;
  final String invoiceType;
  final String templateCode;
  final dynamic isTraCuu;

  factory SerialInvoiceRequest.fromJson(Map<String, dynamic> json) => SerialInvoiceRequest(
    taxCode: json["tax_code"] == null ? null : json["tax_code"],
    invoiceType: json["invoice_type"] == null ? null : json["invoice_type"],
    templateCode: json["templateCode"] == null ? null : json["templateCode"],
    isTraCuu: json["isTraCuu"],
  );

  Map<String, dynamic> toJson() => {
    "tax_code": taxCode == null ? null : taxCode,
    "invoice_type": invoiceType == null ? null : invoiceType,
    "templateCode": templateCode == null ? null : templateCode,
    "isTraCuu": isTraCuu,
  };
}
