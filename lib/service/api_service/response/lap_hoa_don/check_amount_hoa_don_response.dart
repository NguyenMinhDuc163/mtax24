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
    this.check_savepass
  });

  String isHsm;
  String check_savepass;
  factory CheckAmountHDonResponse.fromJson(Map<String, dynamic> json) => CheckAmountHDonResponse(
    isHsm: json["isHSM"] == null ? null : json["isHSM"],
    check_savepass: json["check_savepass"] == null ? null : json["check_savepass"],
  );

  Map<String, dynamic> toJson() => {
    "isHSM": isHsm == null ? null : isHsm,
    "check_savepass": check_savepass == null ? null : check_savepass,
  };
}
