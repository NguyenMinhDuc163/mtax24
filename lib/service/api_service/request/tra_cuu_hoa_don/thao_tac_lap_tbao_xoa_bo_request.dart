// To parse this JSON data, do
//
//     final thaoTacLapTBaoXoaBoRequest = thaoTacLapTBaoXoaBoRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ThaoTacLapTBaoXoaBoRequest thaoTacLapTBaoXoaBoRequestFromJson(String str) => ThaoTacLapTBaoXoaBoRequest.fromJson(json.decode(str));

String thaoTacLapTBaoXoaBoRequestToJson(ThaoTacLapTBaoXoaBoRequest data) => json.encode(data.toJson());

class ThaoTacLapTBaoXoaBoRequest {
  ThaoTacLapTBaoXoaBoRequest({
    @required this.sohdon,
    @required this.loaihdon,
    @required this.id,
    @required this.tinhChat,
    @required this.khieuhdon,
    @required this.mauhdon,
  });

  String sohdon;
  String loaihdon;
  String id;
  String tinhChat;
  String khieuhdon;
  String mauhdon;

  factory ThaoTacLapTBaoXoaBoRequest.fromJson(Map<String, dynamic> json) => ThaoTacLapTBaoXoaBoRequest(
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    id: json["id"] == null ? null : json["id"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
  );

  Map<String, dynamic> toJson() => {
    "sohdon": sohdon == null ? null : sohdon,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "id": id == null ? null : id,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "mauhdon": mauhdon == null ? null : mauhdon,
  };
}
