import 'dart:convert';

class UserMobileInfoResponse {
  UserMobileInfoResponse({
    this.id,
    this.tin,
    this.deviceId,
    this.tokenpush,
    this.operatingSystem,
    this.dkPush,
    this.dkvantay,
    this.pass,
  });

  dynamic id;
  dynamic tin;
  dynamic deviceId;
  dynamic tokenpush;
  dynamic operatingSystem;
  dynamic dkPush;
  dynamic dkvantay;
  dynamic pass;

  factory UserMobileInfoResponse.fromJson(String str) => UserMobileInfoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMobileInfoResponse.fromMap(Map<String, dynamic> json) => UserMobileInfoResponse(
    id: json["id"],
    tin: json["tin"],
    deviceId: json["deviceId"],
    tokenpush: json["tokenpush"],
    operatingSystem: json["operatingSystem"],
    dkPush: json["dkPush"],
    dkvantay: json["dkvantay"],
    pass: json["pass"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "tin": tin,
    "deviceId": deviceId,
    "tokenpush": tokenpush,
    "operatingSystem": operatingSystem,
    "dkPush": dkPush,
    "dkvantay": dkvantay,
    "pass": pass,
  };
}
