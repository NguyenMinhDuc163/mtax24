import 'dart:convert';

class NotificationResponse {
  NotificationResponse({
    this.contains,
    this.code,
  });

  List<Contain> contains;
  String code;

  factory NotificationResponse.fromJson(String str) => NotificationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationResponse.fromMap(Map<String, dynamic> json) => NotificationResponse(
    contains: List<Contain>.from(json["contains"].map((x) => Contain.fromMap(x))),
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "contains": List<dynamic>.from(contains.map((x) => x.toMap())),
    "code": code,
  };
}

class Contain {
  Contain({
    this.applicationId,
    this.sysCode,
    this.corpId,
    this.corpName,
    this.userId,
    this.userName,
    this.serviceId,
    this.serviceName,
    this.accountNo,
    this.limitation,
    this.feeAccountNo,
    this.openSms,
    this.openEmail,
    this.openIms,
    this.status,
    this.createTime,
    this.updateTime,
    this.channelCode,
    this.option,
    this.feeId,
    this.moduleId,
    this.smsModuleId,
    this.emailModuleId,
    this.imModuleId,
    this.serviceType,
    this.options,
    this.paymentTypeSms,
    this.feeSms,
    this.paymentTypeEmail,
    this.feeEmail,
    this.paymentTypeInbox,
    this.feeInbox,
    this.updateBy,
  });

  int applicationId;
  SysCode sysCode;
  int corpId;
  dynamic corpName;
  int userId;
  UserName userName;
  int serviceId;
  String serviceName;
  dynamic accountNo;
  int limitation;
  dynamic feeAccountNo;
  Open openSms;
  Open openEmail;
  Open openIms;
  Status status;
  int createTime;
  int updateTime;
  ChannelCode channelCode;
  dynamic option;
  dynamic feeId;
  int moduleId;
  int smsModuleId;
  int emailModuleId;
  int imModuleId;
  String serviceType;
  String options;
  dynamic paymentTypeSms;
  int feeSms;
  dynamic paymentTypeEmail;
  int feeEmail;
  dynamic paymentTypeInbox;
  int feeInbox;
  dynamic updateBy;

  factory Contain.fromJson(String str) => Contain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contain.fromMap(Map<String, dynamic> json) => Contain(
    applicationId: json["applicationId"] == null ? null : json["applicationId"],
    sysCode: sysCodeValues.map[json["sysCode"]],
    corpId: json["corpId"] == null ? null : json["corpId"],
    corpName: json["corpName"],
    userId: json["userId"] == null ? null : json["userId"],
    userName: json["userName"] == null ? null : userNameValues.map[json["userName"]],
    serviceId: json["serviceId"],
    serviceName: json["serviceName"] == null ? null : json["serviceName"],
    accountNo: json["accountNo"],
    limitation: json["limitation"] == null ? null : json["limitation"],
    feeAccountNo: json["feeAccountNo"],
    openSms: json["openSms"] == null ? null : openValues.map[json["openSms"]],
    openEmail: json["openEmail"] == null ? null : openValues.map[json["openEmail"]],
    openIms: json["openIms"] == null ? null : openValues.map[json["openIms"]],
    status: statusValues.map[json["status"]],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    channelCode: channelCodeValues.map[json["channelCode"]],
    option: json["option"],
    feeId: json["feeId"],
    moduleId: json["moduleId"] == null ? null : json["moduleId"],
    smsModuleId: json["smsModuleId"] == null ? null : json["smsModuleId"],
    emailModuleId: json["emailModuleId"] == null ? null : json["emailModuleId"],
    imModuleId: json["imModuleId"] == null ? null : json["imModuleId"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    options: json["options"] == null ? null : json["options"],
    paymentTypeSms: json["paymentTypeSms"],
    feeSms: json["feeSms"] == null ? null : json["feeSms"],
    paymentTypeEmail: json["paymentTypeEmail"],
    feeEmail: json["feeEmail"] == null ? null : json["feeEmail"],
    paymentTypeInbox: json["paymentTypeInbox"],
    feeInbox: json["feeInbox"] == null ? null : json["feeInbox"],
    updateBy: json["updateBy"],
  );

  Map<String, dynamic> toMap() => {
    "applicationId": applicationId == null ? null : applicationId,
    "sysCode": sysCodeValues.reverse[sysCode],
    "corpId": corpId == null ? null : corpId,
    "corpName": corpName,
    "userId": userId == null ? null : userId,
    "userName": userName == null ? null : userNameValues.reverse[userName],
    "serviceId": serviceId,
    "serviceName": serviceName == null ? null : serviceName,
    "accountNo": accountNo,
    "limitation": limitation == null ? null : limitation,
    "feeAccountNo": feeAccountNo,
    "openSms": openSms == null ? null : openValues.reverse[openSms],
    "openEmail": openEmail == null ? null : openValues.reverse[openEmail],
    "openIms": openIms == null ? null : openValues.reverse[openIms],
    "status": statusValues.reverse[status],
    "createTime": createTime == null ? null : createTime,
    "updateTime": updateTime == null ? null : updateTime,
    "channelCode": channelCodeValues.reverse[channelCode],
    "option": option,
    "feeId": feeId,
    "moduleId": moduleId == null ? null : moduleId,
    "smsModuleId": smsModuleId == null ? null : smsModuleId,
    "emailModuleId": emailModuleId == null ? null : emailModuleId,
    "imModuleId": imModuleId == null ? null : imModuleId,
    "serviceType": serviceType == null ? null : serviceType,
    "options": options == null ? null : options,
    "paymentTypeSms": paymentTypeSms,
    "feeSms": feeSms == null ? null : feeSms,
    "paymentTypeEmail": paymentTypeEmail,
    "feeEmail": feeEmail == null ? null : feeEmail,
    "paymentTypeInbox": paymentTypeInbox,
    "feeInbox": feeInbox == null ? null : feeInbox,
    "updateBy": updateBy,
  };
}

enum ChannelCode { IB }

final channelCodeValues = EnumValues({
  "IB": ChannelCode.IB
});

enum Open { N, Y }

final openValues = EnumValues({
  "N": Open.N,
  "Y": Open.Y
});

enum Status { ACTV }

final statusValues = EnumValues({
  "ACTV": Status.ACTV
});

enum SysCode { BB }

final sysCodeValues = EnumValues({
  "BB": SysCode.BB
});

enum UserName { THE_0102454468999 }

final userNameValues = EnumValues({
  "0102454468-999": UserName.THE_0102454468999
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
