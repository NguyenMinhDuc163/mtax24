// To parse this JSON data, do
//
//     final getInfoCustomerByCodeRequest = getInfoCustomerByCodeRequestFromJson(jsonString);

import 'dart:convert';

GetInfoCustomerByCodeRequest getInfoCustomerByCodeRequestFromJson(String str) => GetInfoCustomerByCodeRequest.fromJson(json.decode(str));

String getInfoCustomerByCodeRequestToJson(GetInfoCustomerByCodeRequest data) => json.encode(data.toJson());

class GetInfoCustomerByCodeRequest {
  GetInfoCustomerByCodeRequest({
    this.taxCode,
    this.flag,
    this.idHD,
  });

  final String taxCode;
  final String flag;
  final String idHD;

  factory GetInfoCustomerByCodeRequest.fromJson(Map<String, dynamic> json) => GetInfoCustomerByCodeRequest(
    taxCode: json["tax_code"] == null ? null : json["tax_code"],
    flag: json["flag"] == null ? null : json["flag"],
    idHD: json["idHD"] == null ? null : json["idHD"],
  );

  Map<String, dynamic> toJson() => {
    "tax_code": taxCode == null ? null : taxCode,
    "flag": flag == null ? null : flag,
    "idHD": idHD == null ? null : idHD,
  };
}
