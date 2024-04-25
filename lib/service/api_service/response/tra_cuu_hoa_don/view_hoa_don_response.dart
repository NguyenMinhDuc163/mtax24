// To parse this JSON data, do
//
//     final viewHDonResponse = viewHDonResponseFromJson(jsonString);

import 'dart:convert';

ViewHDonResponse viewHDonResponseFromJson(String str) => ViewHDonResponse.fromJson(json.decode(str));

String viewHDonResponseToJson(ViewHDonResponse data) => json.encode(data.toJson());

class ViewHDonResponse {
  ViewHDonResponse({
    this.iccinvhdr,
    this.txStatus,
    this.htmlContent,
    this.showWarning,
    this.countRemain,
  });

  final dynamic iccinvhdr;
  final dynamic txStatus;
  final String htmlContent;
  final bool showWarning;
  final int countRemain;

  factory ViewHDonResponse.fromJson(Map<String, dynamic> json) => ViewHDonResponse(
    iccinvhdr: json["iccinvhdr"],
    txStatus: json["txStatus"],
    htmlContent: json["htmlContent"] == null ? null : json["htmlContent"],
    showWarning: json["showWarning"] == null ? null : json["showWarning"],
    countRemain: json["countRemain"] == null ? null : json["countRemain"],
  );

  Map<String, dynamic> toJson() => {
    "iccinvhdr": iccinvhdr,
    "txStatus": txStatus,
    "htmlContent": htmlContent == null ? null : htmlContent,
    "showWarning": showWarning == null ? null : showWarning,
    "countRemain": countRemain == null ? null : countRemain,
  };
}
