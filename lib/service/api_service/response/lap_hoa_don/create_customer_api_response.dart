
// import 'dart:convert';
//
// CreateCustomerApiResponse createCustomerApiResponseFromJson(String str) => CreateCustomerApiResponse.fromJson(json.decode(str));
//
// String createCustomerApiResponseToJson(CreateCustomerApiResponse data) => json.encode(data.toJson());
//
// class CreateCustomerApiResponse {
//   CreateCustomerApiResponse({
//     this.id,
//     this.taxCode,
//     this.customerCode,
//     this.customerName,
//     this.customerCompany,
//     this.customerTaxcode,
//     this.customerEmail,
//     this.customerAddress,
//     this.customerFax,
//     this.customerTelephone,
//     this.bankAccount,
//     this.bankName,
//     this.errorMess,
//   });
//
//   final int id;
//   final String taxCode;
//   final String customerCode;
//   final String customerName;
//   final String customerCompany;
//   final String customerTaxcode;
//   final String customerEmail;
//   final String customerAddress;
//   final String customerFax;
//   final String customerTelephone;
//   final String bankAccount;
//   final String bankName;
//   final String errorMess;
//
//   factory CreateCustomerApiResponse.fromJson(Map<String, dynamic> json) => CreateCustomerApiResponse(
//     id: json["id"] == null ? null : json["id"],
//     taxCode: json["tax_code"] == null ? null : json["tax_code"],
//     customerCode: json["customer_code"] == null ? null : json["customer_code"],
//     customerName: json["customer_name"] == null ? null : json["customer_name"],
//     customerCompany: json["customer_company"] == null ? null : json["customer_company"],
//     customerTaxcode: json["customer_taxcode"] == null ? null : json["customer_taxcode"],
//     customerEmail: json["customer_email"] == null ? null : json["customer_email"],
//     customerAddress: json["customer_address"] == null ? null : json["customer_address"],
//     customerFax: json["customer_fax"] == null ? null : json["customer_fax"],
//     customerTelephone: json["customer_telephone"] == null ? null : json["customer_telephone"],
//     bankAccount: json["bank_account"] == null ? null : json["bank_account"],
//     bankName: json["bank_name"] == null ? null : json["bank_name"],
//     errorMess: json["errorMess"] == null ? null : json["errorMess"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "tax_code": taxCode == null ? null : taxCode,
//     "customer_code": customerCode == null ? null : customerCode,
//     "customer_name": customerName == null ? null : customerName,
//     "customer_company": customerCompany == null ? null : customerCompany,
//     "customer_taxcode": customerTaxcode == null ? null : customerTaxcode,
//     "customer_email": customerEmail == null ? null : customerEmail,
//     "customer_address": customerAddress == null ? null : customerAddress,
//     "customer_fax": customerFax == null ? null : customerFax,
//     "customer_telephone": customerTelephone == null ? null : customerTelephone,
//     "bank_account": bankAccount == null ? null : customerCode,
//     "bank_name": bankName == null ? null : bankName,
//     "errorMess": errorMess == null ? null : errorMess,
//   };
// }


// To parse this JSON data, do
//
//     final createCustomerApiResponse = createCustomerApiResponseFromJson(jsonString);

import 'dart:convert';

CreateCustomerApiResponse createCustomerApiResponseFromJson(String str) => CreateCustomerApiResponse.fromJson(json.decode(str));

String createCustomerApiResponseToJson(CreateCustomerApiResponse data) => json.encode(data.toJson());

class CreateCustomerApiResponse {
  CreateCustomerApiResponse({
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

    this.maKH,
    this.tenNguoiMua,
    this.typePayment,
    this.typeMoney,
    this.tenNH,
    this.soTk,
  });

  final int id;
  final String taxCode;
  final String customerCode;
  final dynamic customerName;
  final String customerCompany;

  final String customerFax;
  final dynamic bankAccount;
  final dynamic bankName;
  final dynamic errorMess;

  String maKH;
  String tenNguoiMua;
  String typePayment;
  String typeMoney;
  String tenNH;
  String soTk;
  String customerTaxcode;
  String customerEmail;
  String customerAddress;
  String customerTelephone;
  factory CreateCustomerApiResponse.fromJson(Map<String, dynamic> json) => CreateCustomerApiResponse(
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
