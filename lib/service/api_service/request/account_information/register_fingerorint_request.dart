import 'dart:convert';

class RegisterFingerprintRequest {
  RegisterFingerprintRequest({
    this.tin,
    this.dkVantay,
    this.dkPush,
    this.deviceId,
    this.tokenPush,
    this.passWord,
    this.action,
    this.operatingSystem,
  });

  String tin;
  String dkVantay;
  String dkPush;
  String deviceId;
  String tokenPush;
  String passWord;
  String action;
  String operatingSystem;

  factory RegisterFingerprintRequest.fromJson(String str) => RegisterFingerprintRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory RegisterFingerprintRequest.fromMap(Map<String, dynamic> json) => RegisterFingerprintRequest(
    tin: json["tin"],
    dkVantay: json["dk_vantay"],
    dkPush: json["dk_push"],
    deviceId: json["device_id"],
    tokenPush: json["token_push"],
    passWord: json["pass_word"],
    action: json["action"],
    operatingSystem: json["operating_system"],
  );

  Map<String, dynamic> toJson() => {
    "tin": tin,
    "dk_vantay": dkVantay,
    "dk_push": dkPush,
    "device_id": deviceId,
    "token_push": tokenPush,
    "pass_word": passWord,
    "action": action,
    "operating_system": operatingSystem,
  };
}
