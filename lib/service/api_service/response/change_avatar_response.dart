import 'dart:convert';

ChangeAvatarResponse changeAvatarResponseFromJson(String str) => ChangeAvatarResponse.fromJson(json.decode(str));

String changeAvatarResponseToJson(ChangeAvatarResponse data) => json.encode(data.toJson());

class ChangeAvatarResponse {
  ChangeAvatarResponse({
    this.responseCode,
    this.object,
    this.message,
    this.refreshedToken,
    this.securityType,
  });

  final String responseCode;
  final dynamic object;
  final String message;
  final dynamic refreshedToken;
  final dynamic securityType;

  factory ChangeAvatarResponse.fromJson(Map<String, dynamic> json) => ChangeAvatarResponse(
    responseCode: json["responseCode"] == null ? null : json["responseCode"],
    object: json["object"],
    message: json["message"] == null ? null : json["message"],
    refreshedToken: json["refreshedToken"],
    securityType: json["securityType"],
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode == null ? null : responseCode,
    "object": object,
    "message": message == null ? null : message,
    "refreshedToken": refreshedToken,
    "securityType": securityType,
  };
}
