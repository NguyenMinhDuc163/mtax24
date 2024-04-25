import 'dart:convert';

class UserMobileInfoRequest {
  UserMobileInfoRequest({
    this.tin,
    this.deviceId,
  });

  String tin;
  String deviceId;

  factory UserMobileInfoRequest.fromJson(String str) => UserMobileInfoRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory UserMobileInfoRequest.fromMap(Map<String, dynamic> json) => UserMobileInfoRequest(
    tin: json["tin"],
    deviceId: json["deviceId"],
  );

  Map<String, dynamic> toJson() => {
    "tin": tin,
    "deviceId": deviceId,
  };
}
