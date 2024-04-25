import 'dart:convert';

class MoneyKindRequest {
  MoneyKindRequest({
    this.mstNban,
    this.loaiHDon,
  });

  String mstNban;
  String loaiHDon;

  factory MoneyKindRequest.fromJson(String str) => MoneyKindRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory MoneyKindRequest.fromMap(Map<String, dynamic> json) => MoneyKindRequest(
    mstNban: json["mstNban"],
    loaiHDon: json["loaiHDon"],
  );

  Map<String, dynamic> toJson() => {
    "mstNban": mstNban,
    "loaiHDon": loaiHDon,
  };
}
