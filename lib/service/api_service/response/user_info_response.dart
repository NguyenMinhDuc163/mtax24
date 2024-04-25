import 'dart:convert';
UserInfoResponse userInfoResponseFromJson(String str) => UserInfoResponse.fromJson(json.decode(str));

String userInfoResponseToJson(UserInfoResponse data) => json.encode(data.toJson());

class UserInfoResponse {
  UserInfoResponse({
    this.userId,
    this.userName,
    this.nick,
    this.gender,
    this.corpId,
    this.orgId,
    this.roleId,
    this.isDelegate,
    this.loginPwd,
    this.tradePwd,
    this.dcType,
    this.certType,
    this.certCode,
    this.telephone,
    this.mobile,
    this.address,
    this.postalcode,
    this.email,
    this.serviceType,
    this.createBy,
    this.remark,
    this.createByMng,
    this.createTime,
    this.updateBy,
    this.updateByMng,
    this.updateTime,
    this.status,
    this.freezedStartTime,
    this.freezedEndTime,
    this.loginCount,
    this.isOnline,
    this.isPwdChanged,
    this.openIbs,
    this.openMbs,
    this.openSms,
    this.mobileMbs,
    this.mobileSms,
    this.wfProcessId,
    this.wfUpdatedTime,
    this.wfTaskid,
    this.wfStatus,
    this.regionCode,
    this.loginFlag,
    this.loginFailCount,
    this.timeLock,
    this.strongAuth,
    this.defaultSetting,
    this.userIdDs3,
    this.mngStatus,
    this.mngTime,
    this.updatePwdLastTime,
    this.updateAccLastTime,
    this.receiSmsAdv,
    this.mobileToken,
    this.mobileTokenTime,
    this.lastTimeLogin,
    this.serialNo,
    this.rejectReason,
    this.notiToken,
    this.isNoti,
    this.deviceId,
    this.isFingerLogin,
    this.isFingerOtp,
    this.sessionId,
    this.birthDay,
    this.job,
    this.jobOther,
    this.provinceId,
    this.avatar
  });

  final int userId;
  final String userName;
  final dynamic nick;
  final String gender;
  final int corpId;
  final dynamic orgId;
  final int roleId;
  final dynamic isDelegate;
  final String loginPwd;
  final dynamic tradePwd;
  final dynamic dcType;
  final dynamic certType;
  final dynamic certCode;
  final dynamic telephone;
  final String mobile;
  final String address;
  final dynamic postalcode;
  final String email;
  final dynamic serviceType;
  final dynamic createBy;
  final dynamic remark;
  final dynamic createByMng;
  final dynamic createTime;
  final dynamic updateBy;
  final dynamic updateByMng;
  final dynamic updateTime;
  final String status;
  final dynamic freezedStartTime;
  final dynamic freezedEndTime;
  final dynamic loginCount;
  final String isOnline;
  final dynamic isPwdChanged;
  final dynamic openIbs;
  final dynamic openMbs;
  final dynamic openSms;
  final dynamic mobileMbs;
  final dynamic mobileSms;
  final dynamic wfProcessId;
  final dynamic wfUpdatedTime;
  final dynamic wfTaskid;
  final dynamic wfStatus;
  final dynamic regionCode;
  final dynamic loginFlag;
  final dynamic loginFailCount;
  final DateTime timeLock;
  final dynamic strongAuth;
  final dynamic defaultSetting;
  final dynamic userIdDs3;
  final dynamic mngStatus;
  final dynamic mngTime;
  final dynamic updatePwdLastTime;
  final dynamic updateAccLastTime;
  final dynamic receiSmsAdv;
  final dynamic mobileToken;
  final dynamic mobileTokenTime;
  final dynamic lastTimeLogin;
  final dynamic serialNo;
  final dynamic rejectReason;
  final dynamic notiToken;
  final dynamic isNoti;
  final dynamic deviceId;
  final dynamic isFingerLogin;
  final dynamic isFingerOtp;
  final dynamic sessionId;
  final DateTime birthDay;
  final String job;
  final String jobOther;
  final String provinceId;
  final String avatar;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => UserInfoResponse(
    userId: json["userId"] == null ? null : json["userId"],
    userName: json["userName"] == null ? null : json["userName"],
    nick: json["nick"],
    gender: json["gender"] == null ? null : json["gender"],
    corpId: json["corpId"] == null ? null : json["corpId"],
    orgId: json["orgId"],
    roleId: json["roleId"] == null ? null : json["roleId"],
    isDelegate: json["isDelegate"],
    loginPwd: json["loginPwd"] == null ? null : json["loginPwd"],
    tradePwd: json["tradePwd"],
    dcType: json["dcType"],
    certType: json["certType"],
    certCode: json["certCode"],
    telephone: json["telephone"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    address: json["address"] == null ? null : json["address"],
    postalcode: json["postalcode"],
    email: json["email"] == null ? null : json["email"],
    serviceType: json["serviceType"],
    createBy: json["createBy"],
    remark: json["remark"],
    createByMng: json["createByMng"],
    createTime: json["createTime"],
    updateBy: json["updateBy"],
    updateByMng: json["updateByMng"],
    updateTime: json["updateTime"],
    status: json["status"] == null ? null : json["status"],
    freezedStartTime: json["freezedStartTime"],
    freezedEndTime: json["freezedEndTime"],
    loginCount: json["loginCount"],
    isOnline: json["isOnline"] == null ? null : json["isOnline"],
    isPwdChanged: json["isPwdChanged"],
    openIbs: json["openIbs"],
    openMbs: json["openMbs"],
    openSms: json["openSms"],
    mobileMbs: json["mobileMbs"],
    mobileSms: json["mobileSms"],
    wfProcessId: json["wfProcessId"],
    wfUpdatedTime: json["wfUpdatedTime"],
    wfTaskid: json["wfTaskid"],
    wfStatus: json["wfStatus"],
    regionCode: json["regionCode"],
    loginFlag: json["loginFlag"],
    loginFailCount: json["loginFailCount"],
    timeLock: json["timeLock"] == null ? null : DateTime.parse(json["timeLock"]),
    strongAuth: json["strongAuth"],
    defaultSetting: json["defaultSetting"],
    userIdDs3: json["userIdDs3"],
    mngStatus: json["mngStatus"],
    mngTime: json["mngTime"],
    updatePwdLastTime: json["updatePwdLastTime"],
    updateAccLastTime: json["updateAccLastTime"],
    receiSmsAdv: json["receiSmsAdv"],
    mobileToken: json["mobileToken"],
    mobileTokenTime: json["mobileTokenTime"],
    lastTimeLogin: json["lastTimeLogin"],
    serialNo: json["serialNo"],
    rejectReason: json["rejectReason"],
    notiToken: json["notiToken"],
    isNoti: json["is_Noti"],
    deviceId: json["deviceId"],
    isFingerLogin: json["isFingerLogin"],
    isFingerOtp: json["isFingerOtp"],
    sessionId: json["sessionId"],
    birthDay: json["birthDay"] == null ? null : DateTime.parse(json["birthDay"]),
    job: json["job"] == null ? null : json["job"],
    jobOther: json["jobOther"] == null ? null : json["jobOther"],
    provinceId: json["provinceId"] == null ? null : json["provinceId"],
    avatar: json["avatar"] == null ? null : json["avatar"]
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "userName": userName == null ? null : userName,
    "nick": nick,
    "gender": gender == null ? null : gender,
    "corpId": corpId == null ? null : corpId,
    "orgId": orgId,
    "roleId": roleId == null ? null : roleId,
    "isDelegate": isDelegate,
    "loginPwd": loginPwd == null ? null : loginPwd,
    "tradePwd": tradePwd,
    "dcType": dcType,
    "certType": certType,
    "certCode": certCode,
    "telephone": telephone,
    "mobile": mobile == null ? null : mobile,
    "address": address == null ? null : address,
    "postalcode": postalcode,
    "email": email == null ? null : email,
    "serviceType": serviceType,
    "createBy": createBy,
    "remark": remark,
    "createByMng": createByMng,
    "createTime": createTime,
    "updateBy": updateBy,
    "updateByMng": updateByMng,
    "updateTime": updateTime,
    "status": status == null ? null : status,
    "freezedStartTime": freezedStartTime,
    "freezedEndTime": freezedEndTime,
    "loginCount": loginCount,
    "isOnline": isOnline == null ? null : isOnline,
    "isPwdChanged": isPwdChanged,
    "openIbs": openIbs,
    "openMbs": openMbs,
    "openSms": openSms,
    "mobileMbs": mobileMbs,
    "mobileSms": mobileSms,
    "wfProcessId": wfProcessId,
    "wfUpdatedTime": wfUpdatedTime,
    "wfTaskid": wfTaskid,
    "wfStatus": wfStatus,
    "regionCode": regionCode,
    "loginFlag": loginFlag,
    "loginFailCount": loginFailCount,
    "timeLock": timeLock == null ? null : timeLock.toIso8601String(),
    "strongAuth": strongAuth,
    "defaultSetting": defaultSetting,
    "userIdDs3": userIdDs3,
    "mngStatus": mngStatus,
    "mngTime": mngTime,
    "updatePwdLastTime": updatePwdLastTime,
    "updateAccLastTime": updateAccLastTime,
    "receiSmsAdv": receiSmsAdv,
    "mobileToken": mobileToken,
    "mobileTokenTime": mobileTokenTime,
    "lastTimeLogin": lastTimeLogin,
    "serialNo": serialNo,
    "rejectReason": rejectReason,
    "notiToken": notiToken,
    "is_Noti": isNoti,
    "deviceId": deviceId,
    "isFingerLogin": isFingerLogin,
    "isFingerOtp": isFingerOtp,
    "sessionId": sessionId,
    "birthDay": birthDay == null ? null : birthDay.toIso8601String(),
    "job": job == null ? null : job,
    "jobOther": jobOther == null ? null : jobOther,
    "provinceId": provinceId == null ? null : provinceId,
    "avatar": avatar == null ? null : avatar,
  };
}
