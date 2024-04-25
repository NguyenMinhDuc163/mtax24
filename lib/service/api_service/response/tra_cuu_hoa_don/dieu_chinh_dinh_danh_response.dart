
import 'dart:convert';

List<DieuChinhDinhDanhResponse> dieuChinhDinhDanhResponseFromJson(String str) => List<DieuChinhDinhDanhResponse>.from(json.decode(str).map((x) => DieuChinhDinhDanhResponse.fromJson(x)));

String dieuChinhDinhDanhResponseToJson(List<DieuChinhDinhDanhResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DieuChinhDinhDanhResponse {
  DieuChinhDinhDanhResponse({
    this.id,
    this.loaihdon,
    this.mauhdon,
    this.sohdon,
    this.ngayhdon,
    this.mstNmua,
    this.tongtienthuente,
    this.tongtienttoannte,
    this.sohdcqt,
    this.sohdongoc,
    this.status,
    this.tinhChat,
    this.lydotuchoi,
    this.idNguoilap,
    this.matte,
    this.tinhchatgoc,
    this.tennmua,
    this.tendvinmua,
    this.dchinmua,
    this.maktra,
    this.mota,
    this.sluongdcdd,
    this.khieuhdon,
    this.tenhdon,
    this.totalPage,
  });

  final String id;
  final String loaihdon;
  final String mauhdon;
  final String sohdon;
  final String ngayhdon;
  final String mstNmua;
  final String tongtienthuente;
  final String tongtienttoannte;
  final String sohdcqt;
  final String sohdongoc;
  final String status;
  final String tinhChat;
  final String lydotuchoi;
  final String idNguoilap;
  final String matte;
  final String tinhchatgoc;
  final String tennmua;
  final String tendvinmua;
  final String dchinmua;
  final String maktra;
  final String mota;
  final String sluongdcdd;
  final String khieuhdon;
  final String tenhdon;
  final String totalPage;

  factory DieuChinhDinhDanhResponse.fromJson(Map<String, dynamic> json) => DieuChinhDinhDanhResponse(
    id: json["id"] == null ? null : json["id"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    sohdcqt: json["sohdcqt"] == null ? null : json["sohdcqt"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    status: json["status"] == null ? null : json["status"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    lydotuchoi: json["lydotuchoi"] == null ? null : json["lydotuchoi"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    matte: json["matte"] == null ? null : json["matte"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    maktra: json["maktra"] == null ? null : json["maktra"],
    mota: json["mota"] == null ? null : json["mota"],
    sluongdcdd: json["sluongdcdd"] == null ? null : json["sluongdcdd"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "sohdon": sohdon == null ? null : sohdon,
    "ngayhdon": ngayhdon == null ? null : ngayhdon,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "sohdcqt": sohdcqt == null ? null : sohdcqt,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "status": status == null ? null : status,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "lydotuchoi": lydotuchoi == null ? null : lydotuchoi,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "matte": matte == null ? null : matte,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "tennmua": tennmua == null ? null : tennmua,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "maktra": maktra == null ? null : maktra,
    "mota": mota == null ? null : mota,
    "sluongdcdd": sluongdcdd == null ? null : sluongdcdd,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "totalPage": totalPage == null ? null : totalPage,
  };
}
