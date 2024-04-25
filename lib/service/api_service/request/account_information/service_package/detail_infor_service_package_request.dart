import 'dart:convert';

class DetailInforServicePackageRequest {
  DetailInforServicePackageRequest({
    this.customerid,
    this.servicecode,
  });

  String customerid;
  String servicecode;

  factory DetailInforServicePackageRequest.fromJson(String str) => DetailInforServicePackageRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory DetailInforServicePackageRequest.fromMap(Map<String, dynamic> json) => DetailInforServicePackageRequest(
    customerid: json["customerid"],
    servicecode: json["servicecode"],
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    "servicecode": servicecode,
  };
}
