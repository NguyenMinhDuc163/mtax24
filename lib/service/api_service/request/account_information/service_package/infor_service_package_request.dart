import 'dart:convert';

class InforServicePackageRequest {
  InforServicePackageRequest({
    this.mst,
  });

  String mst;

  factory InforServicePackageRequest.fromJson(String str) => InforServicePackageRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory InforServicePackageRequest.fromMap(Map<String, dynamic> json) => InforServicePackageRequest(
    mst: json["mst"],
  );

  Map<String, dynamic> toJson() => {
    "mst": mst,
  };
}
