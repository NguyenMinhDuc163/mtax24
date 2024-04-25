// To parse this JSON data, do
//
//     final traCuuBthhdResponse = traCuuBthhdResponseFromJson(jsonString);

import 'dart:convert';

List<TraCuuBthhdResponse> traCuuBthhdResponseFromJson(String str) => List<TraCuuBthhdResponse>.from(json.decode(str).map((x) => TraCuuBthhdResponse.fromJson(x)));

String traCuuBthhdResponseToJson(List<TraCuuBthhdResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraCuuBthhdResponse {
  TraCuuBthhdResponse({
    this.mso,
    this.sbthdlieu,
    this.lkdlieu,
    this.kdlieu,
    this.ldau,
    this.tnnt,
    this.mst,
    this.hddin,
    this.lhhoa,
    this.bslthu,
    this.id,
    this.status,
    this.createTime,
    this.content,
    this.ten,
    this.createBy,
    this.updateTime,
    this.updateBy,
    this.magdichtchieu,
  });

  final String mso;
  final String sbthdlieu;
  final dynamic lkdlieu;
  final String kdlieu;
  final String ldau;
  final String tnnt;
  final String mst;
  final String hddin;
  final String lhhoa;
  final String bslthu;
  final String id;
  final String status;
  final int createTime;
  final String content;
  final dynamic ten;
  final dynamic createBy;
  final dynamic updateTime;
  final dynamic updateBy;
  final dynamic magdichtchieu;

  factory TraCuuBthhdResponse.fromJson(Map<String, dynamic> json) => TraCuuBthhdResponse(
    mso: json["mso"] == null ? null : json["mso"],
    sbthdlieu: json["sbthdlieu"] == null ? null : json["sbthdlieu"],
    lkdlieu: json["lkdlieu"],
    kdlieu: json["kdlieu"] == null ? null : json["kdlieu"],
    ldau: json["ldau"] == null ? null : json["ldau"],
    tnnt: json["tnnt"] == null ? null : json["tnnt"],
    mst: json["mst"] == null ? null : json["mst"],
    hddin: json["hddin"] == null ? null : json["hddin"],
    lhhoa: json["lhhoa"] == null ? null : json["lhhoa"],
    bslthu: json["bslthu"] == null ? null : json["bslthu"],
    id: json["id"] == null ? null : json["id"],
    status: json["status"] == null ? null : json["status"],
    createTime: json["create_time"] == null ? null : json["create_time"],
    content: json["content"] == null ? null : json["content"],
    ten: json["ten"],
    createBy: json["create_by"],
    updateTime: json["update_time"],
    updateBy: json["update_by"],
    magdichtchieu: json["magdichtchieu"],
  );

  Map<String, dynamic> toJson() => {
    "mso": mso == null ? null : mso,
    "sbthdlieu": sbthdlieu == null ? null : sbthdlieu,
    "lkdlieu": lkdlieu,
    "kdlieu": kdlieu == null ? null : kdlieu,
    "ldau": ldau == null ? null : ldau,
    "tnnt": tnnt == null ? null : tnnt,
    "mst": mst == null ? null : mst,
    "hddin": hddin == null ? null : hddin,
    "lhhoa": lhhoa == null ? null : lhhoa,
    "bslthu": bslthu == null ? null : bslthu,
    "id": id == null ? null : id,
    "status": status == null ? null : status,
    "create_time": createTime == null ? null : createTime,
    "content": content == null ? null : content,
    "ten": ten,
    "create_by": createBy,
    "update_time": updateTime,
    "update_by": updateBy,
    "magdichtchieu": magdichtchieu,
  };
}
