
import 'dart:convert';

PreLapHoaDonRequest preLapHoaDonRequestFromJson(String str) => PreLapHoaDonRequest.fromJson(json.decode(str));

String preLapHoaDonRequestToJson(PreLapHoaDonRequest data) => json.encode(data.toJson());

class PreLapHoaDonRequest {
  PreLapHoaDonRequest({
    this.mauHDon,
  });

  final String mauHDon;

  factory PreLapHoaDonRequest.fromJson(Map<String, dynamic> json) => PreLapHoaDonRequest(
    mauHDon: json["mauHDon"] == null ? null : json["mauHDon"],
  );

  Map<String, dynamic> toJson() => {
    "mauHDon": mauHDon == null ? null : mauHDon,
  };
}
