// To parse this JSON data, do
//
//     final traCuuDetailRequest = traCuuDetailRequestFromJson(jsonString);

import 'dart:convert';

TraCuuDetailRequest traCuuDetailRequestFromJson(String str) => TraCuuDetailRequest.fromJson(json.decode(str));

String traCuuDetailRequestToJson(TraCuuDetailRequest data) => json.encode(data.toJson());

class TraCuuDetailRequest {
  TraCuuDetailRequest({
    this.id,
  });

  final String id;

  factory TraCuuDetailRequest.fromJson(Map<String, dynamic> json) => TraCuuDetailRequest(
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
  };
}
