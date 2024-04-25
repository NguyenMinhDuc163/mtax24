// To parse this JSON data, do
//
//     final listVersionResponse = listVersionResponseFromJson(jsonString);

import 'dart:convert';

ListVersionResponse listVersionResponseFromJson(String str) => ListVersionResponse.fromJson(json.decode(str));

String listVersionResponseToJson(ListVersionResponse data) => json.encode(data.toJson());

class ListVersionResponse {
  ListVersionResponse({
    this.sysParameter,
  });

  final SysParameter sysParameter;

  factory ListVersionResponse.fromJson(Map<String, dynamic> json) => ListVersionResponse(
    sysParameter: json["sysParameter"] == null ? null : SysParameter.fromJson(json["sysParameter"]),
  );

  Map<String, dynamic> toJson() => {
    "sysParameter": sysParameter == null ? null : sysParameter.toJson(),
  };
}

class SysParameter {
  SysParameter({
    this.parameterId,
    this.type,
    this.code,
    this.name,
    this.displayName,
    this.seqNo,
    this.discription,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.channelCode,
    this.groupName,
    this.msgName,
    this.vnName,
    this.engName,
    this.msgId,
    this.status,
  });

  final int parameterId;
  final String type;
  final String code;
  final String name;
  final String displayName;
  final int seqNo;
  final String discription;
  final int createBy;
  final int createTime;
  final int updateBy;
  final int updateTime;
  final String channelCode;
  final dynamic groupName;
  final dynamic msgName;
  final dynamic vnName;
  final dynamic engName;
  final dynamic msgId;
  final dynamic status;

  factory SysParameter.fromJson(Map<String, dynamic> json) => SysParameter(
    parameterId: json["parameterId"] == null ? null : json["parameterId"],
    type: json["type"] == null ? null : json["type"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    seqNo: json["seqNo"] == null ? null : json["seqNo"],
    discription: json["discription"] == null ? null : json["discription"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    channelCode: json["channelCode"] == null ? null : json["channelCode"],
    groupName: json["groupName"],
    msgName: json["msgName"],
    vnName: json["vnName"],
    engName: json["engName"],
    msgId: json["msgId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "parameterId": parameterId == null ? null : parameterId,
    "type": type == null ? null : type,
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "displayName": displayName == null ? null : displayName,
    "seqNo": seqNo == null ? null : seqNo,
    "discription": discription == null ? null : discription,
    "createBy": createBy == null ? null : createBy,
    "createTime": createTime == null ? null : createTime,
    "updateBy": updateBy == null ? null : updateBy,
    "updateTime": updateTime == null ? null : updateTime,
    "channelCode": channelCode == null ? null : channelCode,
    "groupName": groupName,
    "msgName": msgName,
    "vnName": vnName,
    "engName": engName,
    "msgId": msgId,
    "status": status,
  };
}
