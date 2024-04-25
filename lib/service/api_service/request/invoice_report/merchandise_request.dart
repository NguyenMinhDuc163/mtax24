import 'dart:convert';

class MerchandiseRequest {
  MerchandiseRequest({
    this.taxCode,
  });

  String taxCode;

  factory MerchandiseRequest.fromJson(String str) => MerchandiseRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory MerchandiseRequest.fromMap(Map<String, dynamic> json) => MerchandiseRequest(
    taxCode: json["taxCode"],
  );

  Map<String, dynamic> toJson() => {
    "taxCode": taxCode,
  };
}
