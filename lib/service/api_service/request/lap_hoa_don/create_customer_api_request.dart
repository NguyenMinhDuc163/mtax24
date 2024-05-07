
import 'dart:convert';

CreateCustomerApiRequest createCustomerApiRequestFromJson(String str) => CreateCustomerApiRequest.fromJson(json.decode(str));

String createCustomerApiRequestToJson(CreateCustomerApiRequest data) => json.encode(data.toJson());

class CreateCustomerApiRequest {
  CreateCustomerApiRequest({
    this.taxCode,
    this.customerCode,
    this.customerName,
    this.customerCompany,
    this.customerTaxcode,
    this.customerEmail,
    this.customerAddress,
    this.customerFax,
    this.customerTelephone,
    this.idHDon
  });

  final String taxCode;
  final String customerCode;
  final dynamic customerName;
  final String customerCompany;
  final String customerTaxcode;
  final String customerEmail;
  final String customerAddress;
  final String customerFax;
  final String customerTelephone;
  final String idHDon;

  factory CreateCustomerApiRequest.fromJson(Map<String, dynamic> json) => CreateCustomerApiRequest(
    taxCode: json["tax_code"] == null ? null : json["tax_code"],
    customerCode: json["customer_code"] == null ? null : json["customer_code"],
    customerName: json["customer_name"],
    customerCompany: json["customer_company"] == null ? null : json["customer_company"],
    customerTaxcode: json["customer_taxcode"] == null ? null : json["customer_taxcode"],
    customerEmail: json["customer_email"] == null ? null : json["customer_email"],
    customerAddress: json["customer_address"] == null ? null : json["customer_address"],
    customerFax: json["customer_fax"] == null ? null : json["customer_fax"],
    customerTelephone: json["customer_telephone"] == null ? null : json["customer_telephone"],
    idHDon: json["idHDon"] == null ? null : json["idHDon"],
  );

  Map<String, dynamic> toJson() => {
    "tax_code": taxCode == null ? null : taxCode,
    "customer_code": customerCode == null ? null : customerCode,
    "customer_name": customerName,
    "customer_company": customerCompany == null ? null : customerCompany,
    "customer_taxcode": customerTaxcode == null ? null : customerTaxcode,
    "customer_email": customerEmail == null ? null : customerEmail,
    "customer_address": customerAddress == null ? null : customerAddress,
    "customer_fax": customerFax == null ? null : customerFax,
    "customer_telephone": customerTelephone == null ? null : customerTelephone,
    "idHDon": idHDon == null ? null : idHDon,
  };
}
