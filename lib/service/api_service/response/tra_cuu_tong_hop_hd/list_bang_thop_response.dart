// To parse this JSON data, do
//
//     final listBangThopResponse = listBangThopResponseFromJson(jsonString);

import 'dart:convert';

ListBangThopResponse listBangThopResponseFromJson(String str) => ListBangThopResponse.fromJson(json.decode(str));

String listBangThopResponseToJson(ListBangThopResponse data) => json.encode(data.toJson());

class ListBangThopResponse {
  ListBangThopResponse({
    this.listBangThop,
    this.bslthu,
    this.kdlieu,
    this.lanDau,
    this.tnnt,
    this.mst,
  });

  final List<ListBangThop> listBangThop;
  final String bslthu;
  final String kdlieu;
  final String lanDau;
  final String tnnt;
  final String mst;

  factory ListBangThopResponse.fromJson(Map<String, dynamic> json) => ListBangThopResponse(
    listBangThop: json["listBangThop"] == null ? null : List<ListBangThop>.from(json["listBangThop"].map((x) => ListBangThop.fromJson(x))),
    bslthu: json["bslthu"] == null ? null : json["bslthu"],
    kdlieu: json["kdlieu"] == null ? null : json["kdlieu"],
    lanDau: json["lanDau"] == null ? null : json["lanDau"],
    tnnt: json["tnnt"] == null ? null : json["tnnt"],
    mst: json["mst"] == null ? null : json["mst"],
  );

  Map<String, dynamic> toJson() => {
    "listBangThop": listBangThop == null ? null : List<dynamic>.from(listBangThop.map((x) => x.toJson())),
    "bslthu": bslthu == null ? null : bslthu,
    "kdlieu": kdlieu == null ? null : kdlieu,
    "lanDau": lanDau == null ? null : lanDau,
    "tnnt": tnnt == null ? null : tnnt,
    "mst": mst == null ? null : mst,
  };
}

class ListBangThop {
  ListBangThop({
    this.stt,
    this.khmshdon,
    this.khhdon,
    this.shdon,
    this.nlap,
    this.tnmua,
    this.mkhang,
    this.mhhdvu,
    this.thhdvu,
    this.sluong,
    this.ttcthue,
    this.tsuat,
    this.tgtthue,
    this.tgtttoan,
    this.tthai,
    this.gchu,
    this.dvtinh,
    this.mstnmua,
  });

  final String stt;
  final String khmshdon;
  final String khhdon;
  final dynamic shdon;
  final DateTime nlap;
  final String tnmua;
  final String mkhang;
  final String mhhdvu;
  final String thhdvu;
  final String sluong;
  final String ttcthue;
  final String tsuat;
  final String tgtthue;
  final String tgtttoan;
  final String tthai;
  final String gchu;
  final String dvtinh;
  final String mstnmua;

  factory ListBangThop.fromJson(Map<String, dynamic> json) => ListBangThop(
    stt: json["stt"] == null ? null : json["stt"],
    khmshdon: json["khmshdon"] == null ? null : json["khmshdon"],
    khhdon: json["khhdon"] == null ? null : json["khhdon"],
    shdon: json["shdon"],
    nlap: json["nlap"] == null ? null : DateTime.parse(json["nlap"]),
    tnmua: json["tnmua"] == null ? null : json["tnmua"],
    mkhang: json["mkhang"] == null ? null : json["mkhang"],
    mhhdvu: json["mhhdvu"] == null ? null : json["mhhdvu"],
    thhdvu: json["thhdvu"] == null ? null : json["thhdvu"],
    sluong: json["sluong"] == null ? null : json["sluong"],
    ttcthue: json["ttcthue"] == null ? null : json["ttcthue"],
    tsuat: json["tsuat"] == null ? null : json["tsuat"],
    tgtthue: json["tgtthue"] == null ? null : json["tgtthue"],
    tgtttoan: json["tgtttoan"] == null ? null : json["tgtttoan"],
    tthai: json["tthai"] == null ? null : json["tthai"],
    gchu: json["gchu"] == null ? null : json["gchu"],
    dvtinh: json["dvtinh"] == null ? null : json["dvtinh"],
    mstnmua: json["mstnmua"] == null ? null : json["mstnmua"],
  );

  Map<String, dynamic> toJson() => {
    "stt": stt == null ? null : stt,
    "khmshdon": khmshdon == null ? null : khmshdon,
    "khhdon": khhdon == null ? null : khhdon,
    "shdon": shdon,
    "nlap": nlap == null ? null : "${nlap.year.toString().padLeft(4, '0')}-${nlap.month.toString().padLeft(2, '0')}-${nlap.day.toString().padLeft(2, '0')}",
    "tnmua": tnmua == null ? null : tnmua,
    "mkhang": mkhang == null ? null : mkhang,
    "mhhdvu": mhhdvu == null ? null : mhhdvu,
    "thhdvu": thhdvu == null ? null : thhdvu,
    "sluong": sluong == null ? null : sluong,
    "ttcthue": ttcthue == null ? null : ttcthue,
    "tsuat": tsuat == null ? null : tsuat,
    "tgtthue": tgtthue == null ? null : tgtthue,
    "tgtttoan": tgtttoan == null ? null : tgtttoan,
    "tthai": tthai == null ? null : tthai,
    "gchu": gchu == null ? null : gchu,
    "dvtinh": dvtinh == null ? null : dvtinh,
    "mstnmua": mstnmua == null ? null : mstnmua,
  };
}
