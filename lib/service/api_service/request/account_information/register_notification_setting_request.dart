import 'dart:convert';

class RegisterNotificationSettingRequest {
  RegisterNotificationSettingRequest({
    this.limitation,
    this.openEmail,
    this.openIms,
    this.openSms,
    this.serviceId,
  });

  List<int> limitation;
  List<String> openEmail;
  List<String> openIms;
  List<String> openSms;
  List<int> serviceId;

  factory RegisterNotificationSettingRequest.fromJson(String str) => RegisterNotificationSettingRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory RegisterNotificationSettingRequest.fromMap(Map<String, dynamic> json) => RegisterNotificationSettingRequest(
    limitation: List<int>.from(json["limitation"].map((x) => x)),
    openEmail: List<String>.from(json["openEmail"].map((x) => x)),
    openIms: List<String>.from(json["openIms"].map((x) => x)),
    openSms: List<String>.from(json["openSms"].map((x) => x)),
    serviceId: List<int>.from(json["serviceId"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "limitation": List<dynamic>.from(limitation.map((x) => x)),
    "openEmail": List<dynamic>.from(openEmail.map((x) => x)),
    "openIms": List<dynamic>.from(openIms.map((x) => x)),
    "openSms": List<dynamic>.from(openSms.map((x) => x)),
    "serviceId": List<dynamic>.from(serviceId.map((x) => x)),
  };
}
