// To parse this JSON data, do
//
//     final checkAmountHDonRequest = checkAmountHDonRequestFromJson(jsonString);

import 'dart:convert';

CheckAmountHDonRequest checkAmountHDonRequestFromJson(String str) => CheckAmountHDonRequest.fromJson(json.decode(str));

String checkAmountHDonRequestToJson(CheckAmountHDonRequest data) => json.encode(data.toJson());

class CheckAmountHDonRequest {
  CheckAmountHDonRequest({
    this.serviceType,
    this.tongtienttoannte,
    this.mstnban,
    this.tgia,
    this.loaihdon,
    this.tinhchat,
    this.hthuchdongoc,
    this.id,
  });

  final String serviceType;
  final String tongtienttoannte;
  final String mstnban;
  final String tgia;
  final String loaihdon;
  final String tinhchat;
  final String hthuchdongoc;
  final String id;

  factory CheckAmountHDonRequest.fromJson(Map<String, dynamic> json) => CheckAmountHDonRequest(
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    mstnban: json["mstnban"] == null ? null : json["mstnban"],
    tgia: json["tgia"] == null ? null : json["tgia"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    tinhchat: json["tinhchat"] == null ? null : json["tinhchat"],
    hthuchdongoc: json["hthuchdongoc"] == null ? null : json["hthuchdongoc"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": serviceType == null ? null : serviceType,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "mstnban": mstnban == null ? null : mstnban,
    "tgia": tgia == null ? null : tgia,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "tinhchat": tinhchat == null ? null : tinhchat,
    "hthuchdongoc": hthuchdongoc == null ? null : hthuchdongoc,
    "id": id == null ? null : id,
  };
}
