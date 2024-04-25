// To parse this JSON data, do
//
//     final customerInfoByUserIdResponse = customerInfoByUserIdResponseFromJson(jsonString);

import 'dart:convert';

CustomerInfoByUserIdResponse customerInfoByUserIdResponseFromJson(String str) => CustomerInfoByUserIdResponse.fromJson(json.decode(str));

String customerInfoByUserIdResponseToJson(CustomerInfoByUserIdResponse data) => json.encode(data.toJson());

class CustomerInfoByUserIdResponse {
  CustomerInfoByUserIdResponse({
    this.id,
    this.taxCode,
    this.customerCode,
    this.customerName,
    this.customerCompany,
    this.customerTaxcode,
    this.customerEmail,
    this.customerAddress,
    this.customerFax,
    this.customerTelephone,
    this.bankAccount,
    this.bankName,
    this.errorMess,
  });

  final int id;
  final String taxCode;
  final String customerCode;
  final dynamic customerName;
  final String customerCompany;
  final String customerTaxcode;
  final String customerEmail;
  final String customerAddress;
  final String customerFax;
  final String customerTelephone;
  final dynamic bankAccount;
  final dynamic bankName;
  final dynamic errorMess;

  factory CustomerInfoByUserIdResponse.fromJson(Map<String, dynamic> json) => CustomerInfoByUserIdResponse(
    id: json["id"] == null ? null : json["id"],
    taxCode: json["tax_code"] == null ? null : json["tax_code"],
    customerCode: json["customer_code"] == null ? null : json["customer_code"],
    customerName: json["customer_name"],
    customerCompany: json["customer_company"] == null ? null : json["customer_company"],
    customerTaxcode: json["customer_taxcode"] == null ? null : json["customer_taxcode"],
    customerEmail: json["customer_email"] == null ? null : json["customer_email"],
    customerAddress: json["customer_address"] == null ? null : json["customer_address"],
    customerFax: json["customer_fax"] == null ? null : json["customer_fax"],
    customerTelephone: json["customer_telephone"] == null ? null : json["customer_telephone"],
    bankAccount: json["bank_account"],
    bankName: json["bank_name"],
    errorMess: json["errorMess"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tax_code": taxCode == null ? null : taxCode,
    "customer_code": customerCode == null ? null : customerCode,
    "customer_name": customerName,
    "customer_company": customerCompany == null ? null : customerCompany,
    "customer_taxcode": customerTaxcode == null ? null : customerTaxcode,
    "customer_email": customerEmail == null ? null : customerEmail,
    "customer_address": customerAddress == null ? null : customerAddress,
    "customer_fax": customerFax == null ? null : customerFax,
    "customer_telephone": customerTelephone == null ? null : customerTelephone,
    "bank_account": bankAccount,
    "bank_name": bankName,
    "errorMess": errorMess,
  };
}
