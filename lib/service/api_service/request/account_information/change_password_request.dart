import 'dart:convert';

class ChangePasswordRequest {
  ChangePasswordRequest({
    this.password,
    this.newPassword,
    this.confirmPassword,
  });

  String password;
  String newPassword;
  String confirmPassword;

  factory ChangePasswordRequest.fromJson(String str) => ChangePasswordRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> json) => ChangePasswordRequest(
    password: json["password"],
    newPassword: json["newPassword"],
    confirmPassword: json["confirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "newPassword": newPassword,
    "confirmPassword": confirmPassword,
  };
}
