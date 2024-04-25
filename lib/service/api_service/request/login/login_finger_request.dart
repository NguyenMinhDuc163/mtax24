import 'dart:convert';

class LoginFingerRequest {
  LoginFingerRequest({
    this.username,
    this.password,
    this.lang,
    this.deviceId,
    this.passCode,
    this.tokenId,
    this.operatingSystem,
  });

  String username;
  String password;
  String lang;
  String deviceId;
  String passCode;
  String tokenId;
  String operatingSystem;

  factory LoginFingerRequest.fromJson(String str) => LoginFingerRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory LoginFingerRequest.fromMap(Map<String, dynamic> json) => LoginFingerRequest(
    username: json["username"],
    password: json["password"],
    lang: json["lang"],
    deviceId: json["deviceId"],
    passCode: json["passCode"],
    tokenId: json["tokenId"],
    operatingSystem: json["operatingSystem"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "lang": lang,
    "deviceId": deviceId,
    "passCode": passCode,
    "tokenId": tokenId,
    "operatingSystem": operatingSystem,
  };
}
