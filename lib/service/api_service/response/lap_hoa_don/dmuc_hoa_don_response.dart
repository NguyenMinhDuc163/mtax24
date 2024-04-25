
import 'dart:convert';

DanhMucHoaDonResponse danhMucHoaDonResponseFromJson(String str) => DanhMucHoaDonResponse.fromJson(json.decode(str));

String danhMucHoaDonResponseToJson(DanhMucHoaDonResponse data) => json.encode(data.toJson());

class DanhMucHoaDonResponse {
  DanhMucHoaDonResponse({
    this.invoiceName,
    this.invoiceCode,
    this.invoiceSeq,
    this.invoiceNameView,
    this.invoiceType,
  });

  final String invoiceName;
  final String invoiceCode;
  final dynamic invoiceSeq;
  final String invoiceNameView;
  final String invoiceType;

  factory DanhMucHoaDonResponse.fromJson(Map<String, dynamic> json) => DanhMucHoaDonResponse(
    invoiceName: json["invoice_name"] == null ? null : json["invoice_name"],
    invoiceCode: json["invoice_code"] == null ? null : json["invoice_code"],
    invoiceSeq: json["invoice_seq"],
    invoiceNameView: json["invoice_name_view"] == null ? null : json["invoice_name_view"],
    invoiceType: json["invoice_type"] == null ? null : json["invoice_type"],
  );

  Map<String, dynamic> toJson() => {
    "invoice_name": invoiceName == null ? null : invoiceName,
    "invoice_code": invoiceCode == null ? null : invoiceCode,
    "invoice_seq": invoiceSeq,
    "invoice_name_view": invoiceNameView == null ? null : invoiceNameView,
    "invoice_type": invoiceType == null ? null : invoiceType,
  };
}
