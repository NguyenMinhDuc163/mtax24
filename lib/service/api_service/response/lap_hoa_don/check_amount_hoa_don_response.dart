// To parse this JSON data, do
//
//     final checkAmountHDonResponse = checkAmountHDonResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckAmountHDonResponse checkAmountHDonResponseFromJson(String str) => CheckAmountHDonResponse.fromJson(json.decode(str));

String checkAmountHDonResponseToJson(CheckAmountHDonResponse data) => json.encode(data.toJson());

class CheckAmountHDonResponse {
  CheckAmountHDonResponse({
    @required this.isHsm,
  });

  String isHsm;

  factory CheckAmountHDonResponse.fromJson(Map<String, dynamic> json) => CheckAmountHDonResponse(
    isHsm: json["isHSM"] == null ? null : json["isHSM"],
  );

  Map<String, dynamic> toJson() => {
    "isHSM": isHsm == null ? null : isHsm,
  };
}
