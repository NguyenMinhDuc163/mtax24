// To parse this JSON data, do
//
//     final baseDanhMucRequest = baseDanhMucRequestFromJson(jsonString);

import 'dart:convert';

BaseDanhMucRequest baseDanhMucRequestFromJson(String str) => BaseDanhMucRequest.fromJson(json.decode(str));

String baseDanhMucRequestToJson(BaseDanhMucRequest data) => json.encode(data.toJson());

class BaseDanhMucRequest {
  BaseDanhMucRequest({
    this.tin,
    // this.id,
  });

  final String tin;
  // final String id;

  factory BaseDanhMucRequest.fromJson(Map<String, dynamic> json) => BaseDanhMucRequest(
    tin: json["tin"] == null ? null : json["tin"],
    // id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tin": tin == null ? null : tin,
    // "id": id == null ? null : id,
  };
}
