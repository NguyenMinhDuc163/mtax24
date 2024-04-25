// To parse this JSON data, do
//
//     final dMucNHangTTeResponse = dMucNHangTTeResponseFromJson(jsonString);

import 'dart:convert';

import '../../../init.dart';

DMucNHangTTeResponse dMucNHangTTeResponseFromJson(String str) => DMucNHangTTeResponse.fromJson(json.decode(str));

String dMucNHangTTeResponseToJson(DMucNHangTTeResponse data) => json.encode(data.toJson());

class DMucNHangTTeResponse {
  DMucNHangTTeResponse({
    this.dmucNHang,
    this.dmucTTe,
    this.dmucMauHDon,
    this.lstPaymentWay,
    this.hthuchdon,
    this.listMapHienThiTienTe,
  });

  final List<DmucNHang> dmucNHang;
  final List<String> dmucTTe;
  final List<dynamic> dmucMauHDon;
  final List<LstPaymentWay> lstPaymentWay;
  final String hthuchdon;
  final ListMapHienThiTienTe listMapHienThiTienTe;

  factory DMucNHangTTeResponse.fromJson(Map<String, dynamic> json) => DMucNHangTTeResponse(
    dmucNHang: json["dmucNHang"] == null ? null : List<DmucNHang>.from(json["dmucNHang"].map((x) => DmucNHang.fromJson(x))),
    dmucTTe: json["dmucTTe"] == null ? null : List<String>.from(json["dmucTTe"].map((x) => x)),
    dmucMauHDon: json["dmucMauHDon"] == null ? null : List<dynamic>.from(json["dmucMauHDon"].map((x) => x)),
    lstPaymentWay: json["lstPaymentWay"] == null ? null : List<LstPaymentWay>.from(json["lstPaymentWay"].map((x) => LstPaymentWay.fromJson(x))),
    hthuchdon: json["hthuchdon"] == null ? null : json["hthuchdon"],
    listMapHienThiTienTe: json["listMapHienThiTienTe"] == null ? null : ListMapHienThiTienTe.fromJson(json["listMapHienThiTienTe"]),
  );

  Map<String, dynamic> toJson() => {
    "dmucNHang": dmucNHang == null ? null : List<dynamic>.from(dmucNHang.map((x) => x.toJson())),
    "dmucTTe": dmucTTe == null ? null : List<dynamic>.from(dmucTTe.map((x) => x)),
    "dmucMauHDon": dmucMauHDon == null ? null : List<dynamic>.from(dmucMauHDon.map((x) => x)),
    "lstPaymentWay": lstPaymentWay == null ? null : List<dynamic>.from(lstPaymentWay.map((x) => x.toJson())),
    "hthuchdon": hthuchdon == null ? null : hthuchdon,
    "listMapHienThiTienTe": listMapHienThiTienTe == null ? null : listMapHienThiTienTe.toJson(),
  };
}

class DmucNHang {
  DmucNHang({
    this.mabank,
    this.tenbank,
  });

  final String mabank;
  final String tenbank;

  factory DmucNHang.fromJson(Map<String, dynamic> json) => DmucNHang(
    mabank: json["mabank"] == null ? null : json["mabank"],
    tenbank: json["tenbank"] == null ? null : json["tenbank"],
  );

  Map<String, dynamic> toJson() => {
    "mabank": mabank == null ? null : mabank,
    "tenbank": tenbank == null ? null : tenbank,
  };
}

// class ListMapHienThiTienTe {
//   ListMapHienThiTienTe({
//     this.jpy,
//     this.cny,
//     this.sgd,
//     this.hkd,
//     this.vnd,
//     this.cad,
//     this.aud,
//     this.nzd,
//     this.gbp,
//     this.dkk,
//     this.nok,
//     this.sek,
//     this.chf,
//     this.eur,
//     this.xau,
//     this.thb,
//     this.usd,
//     this.lak,
//     this.krw,
//     this.twd,
//   });
//
//   final String jpy;
//   final String cny;
//   final String sgd;
//   final String hkd;
//   final String vnd;
//   final String cad;
//   final String aud;
//   final String nzd;
//   final String gbp;
//   final String dkk;
//   final String nok;
//   final String sek;
//   final String chf;
//   final String eur;
//   final String xau;
//   final String thb;
//   final String usd;
//   final String lak;
//   final String krw;
//   final String twd;
//
//   factory ListMapHienThiTienTe.fromJson(Map<String, dynamic> json) => ListMapHienThiTienTe(
//     jpy: json["JPY"] == null ? null : json["JPY"],
//     cny: json["CNY"] == null ? null : json["CNY"],
//     sgd: json["SGD"] == null ? null : json["SGD"],
//     hkd: json["HKD"] == null ? null : json["HKD"],
//     vnd: json["VND"] == null ? null : json["VND"],
//     cad: json["CAD"] == null ? null : json["CAD"],
//     aud: json["AUD"] == null ? null : json["AUD"],
//     nzd: json["NZD"] == null ? null : json["NZD"],
//     gbp: json["GBP"] == null ? null : json["GBP"],
//     dkk: json["DKK"] == null ? null : json["DKK"],
//     nok: json["NOK"] == null ? null : json["NOK"],
//     sek: json["SEK"] == null ? null : json["SEK"],
//     chf: json["CHF"] == null ? null : json["CHF"],
//     eur: json["EUR"] == null ? null : json["EUR"],
//     xau: json["XAU"] == null ? null : json["XAU"],
//     thb: json["THB"] == null ? null : json["THB"],
//     usd: json["USD"] == null ? null : json["USD"],
//     lak: json["LAK"] == null ? null : json["LAK"],
//     krw: json["KRW"] == null ? null : json["KRW"],
//     twd: json["TWD"] == null ? null : json["TWD"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "JPY": jpy == null ? null : jpy,
//     "CNY": cny == null ? null : cny,
//     "SGD": sgd == null ? null : sgd,
//     "HKD": hkd == null ? null : hkd,
//     "VND": vnd == null ? null : vnd,
//     "CAD": cad == null ? null : cad,
//     "AUD": aud == null ? null : aud,
//     "NZD": nzd == null ? null : nzd,
//     "GBP": gbp == null ? null : gbp,
//     "DKK": dkk == null ? null : dkk,
//     "NOK": nok == null ? null : nok,
//     "SEK": sek == null ? null : sek,
//     "CHF": chf == null ? null : chf,
//     "EUR": eur == null ? null : eur,
//     "XAU": xau == null ? null : xau,
//     "THB": thb == null ? null : thb,
//     "USD": usd == null ? null : usd,
//     "LAK": lak == null ? null : lak,
//     "KRW": krw == null ? null : krw,
//     "TWD": twd == null ? null : twd,
//   };
// }

// class LstPaymentWay {
//   LstPaymentWay({
//     this.parameterId,
//     this.type,
//     this.code,
//     this.name,
//     this.displayName,
//     this.seqNo,
//     this.discription,
//     this.createBy,
//     this.createTime,
//     this.updateBy,
//     this.updateTime,
//     this.channelCode,
//     this.groupName,
//     this.msgName,
//     this.vnName,
//     this.engName,
//     this.msgId,
//     this.status,
//   });
//
//   final int parameterId;
//   final String type;
//   final String code;
//   final String name;
//   final String displayName;
//   final int seqNo;
//   final String discription;
//   final int createBy;
//   final int createTime;
//   final int updateBy;
//   final int updateTime;
//   final String channelCode;
//   final dynamic groupName;
//   final dynamic msgName;
//   final dynamic vnName;
//   final dynamic engName;
//   final dynamic msgId;
//   final dynamic status;
//
//   factory LstPaymentWay.fromJson(Map<String, dynamic> json) => LstPaymentWay(
//     parameterId: json["parameterId"] == null ? null : json["parameterId"],
//     type: json["type"] == null ? null : json["type"],
//     code: json["code"] == null ? null : json["code"],
//     name: json["name"] == null ? null : json["name"],
//     displayName: json["displayName"] == null ? null : json["displayName"],
//     seqNo: json["seqNo"] == null ? null : json["seqNo"],
//     discription: json["discription"] == null ? null : json["discription"],
//     createBy: json["createBy"] == null ? null : json["createBy"],
//     createTime: json["createTime"] == null ? null : json["createTime"],
//     updateBy: json["updateBy"] == null ? null : json["updateBy"],
//     updateTime: json["updateTime"] == null ? null : json["updateTime"],
//     channelCode: json["channelCode"] == null ? null : json["channelCode"],
//     groupName: json["groupName"],
//     msgName: json["msgName"],
//     vnName: json["vnName"],
//     engName: json["engName"],
//     msgId: json["msgId"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "parameterId": parameterId == null ? null : parameterId,
//     "type": type == null ? null : type,
//     "code": code == null ? null : code,
//     "name": name == null ? null : name,
//     "displayName": displayName == null ? null : displayName,
//     "seqNo": seqNo == null ? null : seqNo,
//     "discription": discription == null ? null : discription,
//     "createBy": createBy == null ? null : createBy,
//     "createTime": createTime == null ? null : createTime,
//     "updateBy": updateBy == null ? null : updateBy,
//     "updateTime": updateTime == null ? null : updateTime,
//     "channelCode": channelCode == null ? null : channelCode,
//     "groupName": groupName,
//     "msgName": msgName,
//     "vnName": vnName,
//     "engName": engName,
//     "msgId": msgId,
//     "status": status,
//   };
// }
