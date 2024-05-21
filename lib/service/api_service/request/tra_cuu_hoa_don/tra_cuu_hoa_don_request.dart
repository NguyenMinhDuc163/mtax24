
import 'dart:convert';

TraCuuHoaDonRequest traCuuHoaDonRequestFromJson(String str) => TraCuuHoaDonRequest.fromJson(json.decode(str));

String traCuuHoaDonRequestToJson(TraCuuHoaDonRequest data) => json.encode(data.toJson());

class TraCuuHoaDonRequest {
  TraCuuHoaDonRequest({
    this.loaihdon,
    this.tinhChat,
    this.trangThai,
    this.soHoaDonCqt,
    this.maXacMinh,
    this.mauhdon,
    this.sohdon,
    this.mstNmua,
    this.emailnmua,
    this.fromDate,
    this.toDate,
    this.fromDateNgayHDon,
    this.toDateNgayHDon,
    this.idNguoilap,
    this.mstNban,
    this.kyHieuHDon,
    this.fromDateShow,
    this.toDateShow,
    this.page,
    this.statusCQT,

  });

  final String loaihdon;
  final String tinhChat;
  final String trangThai;
  final String soHoaDonCqt;
  final String maXacMinh;
  final String mauhdon;
  final String sohdon;
  final String mstNmua;
  final String emailnmua;
  final String fromDate;
  final String toDate;
  final String fromDateNgayHDon;
  final String toDateNgayHDon;
  final String idNguoilap;
  final String mstNban;
  final String kyHieuHDon;
  final String fromDateShow;
  final String toDateShow;
  final int page;
  final String statusCQT;

  factory TraCuuHoaDonRequest.fromJson(Map<String, dynamic> json) => TraCuuHoaDonRequest(
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    trangThai: json["trangThai"] == null ? null : json["trangThai"],
    soHoaDonCqt: json["soHoaDonCQT"] == null ? null : json["soHoaDonCQT"],
    maXacMinh: json["maXacMinh"] == null ? null : json["maXacMinh"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    fromDateNgayHDon: json["fromDateNgayHDon"] == null ? null : json["fromDateNgayHDon"],
    toDateNgayHDon: json["toDateNgayHDon"] == null ? null : json["toDateNgayHDon"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    mstNban: json["mstNBAN"] == null ? null : json["mstNBAN"],
    kyHieuHDon: json["kyHieuHDon"] == null ? null : json["kyHieuHDon"],
    fromDateShow: json["fromDateShow"] == null ? null : json["fromDateShow"],
    toDateShow: json["toDateShow"] == null ? null : json["toDateShow"],
    page: json["page"] == null ? null : json["page"],
    statusCQT: json["statusCQT"] == null ? null : json["statusCQT"],
  );

  Map<String, dynamic> toJson() => {
    "loaihdon": loaihdon == null ? null : loaihdon,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "trangThai": trangThai == null ? null : trangThai,
    "soHoaDonCQT": soHoaDonCqt == null ? null : soHoaDonCqt,
    "maXacMinh": maXacMinh == null ? null : maXacMinh,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "sohdon": sohdon == null ? null : sohdon,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "fromDateNgayHDon": fromDateNgayHDon == null ? null : fromDateNgayHDon,
    "toDateNgayHDon": toDateNgayHDon == null ? null : toDateNgayHDon,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "mstNBAN": mstNban == null ? null : mstNban,
    "kyHieuHDon": kyHieuHDon == null ? null : kyHieuHDon,
    "fromDateShow": fromDateShow == null ? null : fromDateShow,
    "toDateShow": toDateShow == null ? null : toDateShow,
    "page": page == null ? null : page,
    "statusCQT": statusCQT == null ? null : statusCQT,
  };
}
