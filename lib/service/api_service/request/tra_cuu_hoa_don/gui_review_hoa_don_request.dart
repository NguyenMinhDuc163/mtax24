// To parse this JSON data, do
//
//     final guiReviewHoaDonRequest = guiReviewHoaDonRequestFromJson(jsonString);

import 'dart:convert';

GuiReviewHoaDonRequest guiReviewHoaDonRequestFromJson(String str) => GuiReviewHoaDonRequest.fromJson(json.decode(str));

String guiReviewHoaDonRequestToJson(GuiReviewHoaDonRequest data) => json.encode(data.toJson());

class GuiReviewHoaDonRequest {
  GuiReviewHoaDonRequest({
    this.id,
    this.ngayCqThdongoc,
    this.loaihdon,
    this.tkhoannban,
    this.nhangnban,
    this.matte,
    this.tennmua,
    this.mstNmua,
    this.tendvinmua,
    this.dchinmua,
    this.emailnmua,
    this.dthoainmua,
    this.tkhoannmua,
    this.nhangnmua,
    this.faxnmua,
    this.hthuctoan,
    this.tgia,
    this.kyhieu,
    this.mauhdon,
    this.tenhdon,
    this.tinhchat,
    this.tongtiennte,
    this.tongthuesuat0Nte,
    this.tongthuesuat5Nte,
    this.tongthuesuat10Nte,
    this.tongtienthuente,
    this.tongtienttoannte,
    this.tienbangchu,
    this.tongtientruocthue10Nte,
    this.tongtientruocthue5Nte,
    this.tongtientruocthue0Nte,
    this.tongtientruocthuekchiuthuente,
    this.tongtiensauthue10Nte,
    this.tongtiensauthue5Nte,
    this.tongtiensauthue0Nte,
    this.tongtiensauthuekchiuthuente,
    this.chitiethoadon,
    this.serviceType,
    this.lstInvOtherInfoBan,
    this.lstInvOtherInfoMua,
    this.lstInvOtherInfoTToan,
    this.lstInvOtherInfoCthd,
    this.cdSohdon,
    this.cdNgayHd,
    this.cdMauhdon,
    this.cdKhieuhdon,
    this.sovban,
    this.ngaykyvanban,
  });

  final String id;
  final String ngayCqThdongoc;
  final String loaihdon;
  final String tkhoannban;
  final String nhangnban;
  final String matte;
  final String tennmua;
  final String mstNmua;
  final String tendvinmua;
  final String dchinmua;
  final String emailnmua;
  final String dthoainmua;
  final String tkhoannmua;
  final String nhangnmua;
  final String faxnmua;
  final String hthuctoan;
  final String tgia;
  final String kyhieu;
  final String mauhdon;
  final String tenhdon;
  final String tinhchat;
  final String tongtiennte;
  final int tongthuesuat0Nte;
  final String tongthuesuat5Nte;
  final String tongthuesuat10Nte;
  final String tongtienthuente;
  final String tongtienttoannte;
  final String tienbangchu;
  final String tongtientruocthue10Nte;
  final String tongtientruocthue5Nte;
  final String tongtientruocthue0Nte;
  final String tongtientruocthuekchiuthuente;
  final String tongtiensauthue10Nte;
  final String tongtiensauthue5Nte;
  final String tongtiensauthue0Nte;
  final String tongtiensauthuekchiuthuente;
  final List<Chitiethoadon> chitiethoadon;
  final String serviceType;
  final List<dynamic> lstInvOtherInfoBan;
  final List<dynamic> lstInvOtherInfoMua;
  final List<dynamic> lstInvOtherInfoTToan;
  final List<dynamic> lstInvOtherInfoCthd;
  final String cdSohdon;
  final String cdNgayHd;
  final String cdMauhdon;
  final String cdKhieuhdon;
  final String sovban;
  final dynamic ngaykyvanban;

  factory GuiReviewHoaDonRequest.fromJson(Map<String, dynamic> json) => GuiReviewHoaDonRequest(
    id: json["id"] == null ? null : json["id"],
    ngayCqThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    tkhoannban: json["tkhoannban"] == null ? null : json["tkhoannban"],
    nhangnban: json["nhangnban"] == null ? null : json["nhangnban"],
    matte: json["matte"] == null ? null : json["matte"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
    tkhoannmua: json["tkhoannmua"] == null ? null : json["tkhoannmua"],
    nhangnmua: json["nhangnmua"] == null ? null : json["nhangnmua"],
    faxnmua: json["faxnmua"] == null ? null : json["faxnmua"],
    hthuctoan: json["hthuctoan"] == null ? null : json["hthuctoan"],
    tgia: json["tgia"] == null ? null : json["tgia"],
    kyhieu: json["kyhieu"] == null ? null : json["kyhieu"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    tinhchat: json["tinhchat"] == null ? null : json["tinhchat"],
    tongtiennte: json["tongtiennte"] == null ? null : json["tongtiennte"],
    tongthuesuat0Nte: json["tongthuesuat0nte"] == null ? null : json["tongthuesuat0nte"],
    tongthuesuat5Nte: json["tongthuesuat5nte"] == null ? null : json["tongthuesuat5nte"],
    tongthuesuat10Nte: json["tongthuesuat10nte"] == null ? null : json["tongthuesuat10nte"],
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    tienbangchu: json["tienbangchu"] == null ? null : json["tienbangchu"],
    tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
    tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
    tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
    tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
    tongtiensauthue10Nte: json["tongtiensauthue10nte"] == null ? null : json["tongtiensauthue10nte"],
    tongtiensauthue5Nte: json["tongtiensauthue5nte"] == null ? null : json["tongtiensauthue5nte"],
    tongtiensauthue0Nte: json["tongtiensauthue0nte"] == null ? null : json["tongtiensauthue0nte"],
    tongtiensauthuekchiuthuente: json["tongtiensauthuekchiuthuente"] == null ? null : json["tongtiensauthuekchiuthuente"],
    chitiethoadon: json["chitiethoadon"] == null ? null : List<Chitiethoadon>.from(json["chitiethoadon"].map((x) => Chitiethoadon.fromJson(x))),
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoBan"].map((x) => x)),
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoMua"].map((x) => x)),
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoTToan"].map((x) => x)),
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoCTHD"].map((x) => x)),
    cdSohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
    cdNgayHd: json["cd_ngayHD"] == null ? null : json["cd_ngayHD"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    sovban: json["sovban"] == null ? null : json["sovban"],
    ngaykyvanban: json["ngaykyvanban"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "ngayCQThdongoc": ngayCqThdongoc == null ? null : ngayCqThdongoc,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "tkhoannban": tkhoannban == null ? null : tkhoannban,
    "nhangnban": nhangnban == null ? null : nhangnban,
    "matte": matte == null ? null : matte,
    "tennmua": tennmua == null ? null : tennmua,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "dthoainmua": dthoainmua == null ? null : dthoainmua,
    "tkhoannmua": tkhoannmua == null ? null : tkhoannmua,
    "nhangnmua": nhangnmua == null ? null : nhangnmua,
    "faxnmua": faxnmua == null ? null : faxnmua,
    "hthuctoan": hthuctoan == null ? null : hthuctoan,
    "tgia": tgia == null ? null : tgia,
    "kyhieu": kyhieu == null ? null : kyhieu,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "tinhchat": tinhchat == null ? null : tinhchat,
    "tongtiennte": tongtiennte == null ? null : tongtiennte,
    "tongthuesuat0nte": tongthuesuat0Nte == null ? null : tongthuesuat0Nte,
    "tongthuesuat5nte": tongthuesuat5Nte == null ? null : tongthuesuat5Nte,
    "tongthuesuat10nte": tongthuesuat10Nte == null ? null : tongthuesuat10Nte,
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "tienbangchu": tienbangchu == null ? null : tienbangchu,
    "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
    "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
    "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
    "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
    "tongtiensauthue10nte": tongtiensauthue10Nte == null ? null : tongtiensauthue10Nte,
    "tongtiensauthue5nte": tongtiensauthue5Nte == null ? null : tongtiensauthue5Nte,
    "tongtiensauthue0nte": tongtiensauthue0Nte == null ? null : tongtiensauthue0Nte,
    "tongtiensauthuekchiuthuente": tongtiensauthuekchiuthuente == null ? null : tongtiensauthuekchiuthuente,
    "chitiethoadon": chitiethoadon == null ? null : List<dynamic>.from(chitiethoadon.map((x) => x.toJson())),
    "serviceType": serviceType == null ? null : serviceType,
    "lstInvOtherInfoBan": lstInvOtherInfoBan == null ? null : List<dynamic>.from(lstInvOtherInfoBan.map((x) => x)),
    "lstInvOtherInfoMua": lstInvOtherInfoMua == null ? null : List<dynamic>.from(lstInvOtherInfoMua.map((x) => x)),
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan == null ? null : List<dynamic>.from(lstInvOtherInfoTToan.map((x) => x)),
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd == null ? null : List<dynamic>.from(lstInvOtherInfoCthd.map((x) => x)),
    "cd_sohdon": cdSohdon == null ? null : cdSohdon,
    "cd_ngayHD": cdNgayHd == null ? null : cdNgayHd,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "sovban": sovban == null ? null : sovban,
    "ngaykyvanban": ngaykyvanban,
  };
}

class Chitiethoadon {
  Chitiethoadon({
    this.madvu,
    this.tendvu,
    this.dvtinh,
    this.soluong,
    this.dongia,
    this.khuyenmai,
    this.tienchietkhau,
    this.thuesuat,
    this.thanhtientruocthue,
    this.tienthue,
    this.tongtienthanhtoan,
  });

  final String madvu;
  final String tendvu;
  final String dvtinh;
  final String soluong;
  final String dongia;
  final String khuyenmai;
  final String tienchietkhau;
  final String thuesuat;
  final String thanhtientruocthue;
  final String tienthue;
  final String tongtienthanhtoan;

  factory Chitiethoadon.fromJson(Map<String, dynamic> json) => Chitiethoadon(
    madvu: json["madvu"] == null ? null : json["madvu"],
    tendvu: json["tendvu"] == null ? null : json["tendvu"],
    dvtinh: json["dvtinh"] == null ? null : json["dvtinh"],
    soluong: json["soluong"] == null ? null : json["soluong"],
    dongia: json["dongia"] == null ? null : json["dongia"],
    khuyenmai: json["khuyenmai"] == null ? null : json["khuyenmai"],
    tienchietkhau: json["tienchietkhau"] == null ? null : json["tienchietkhau"],
    thuesuat: json["thuesuat"] == null ? null : json["thuesuat"],
    thanhtientruocthue: json["thanhtientruocthue"] == null ? null : json["thanhtientruocthue"],
    tienthue: json["tienthue"] == null ? null : json["tienthue"],
    tongtienthanhtoan: json["tongtienthanhtoan"] == null ? null : json["tongtienthanhtoan"],
  );

  Map<String, dynamic> toJson() => {
    "madvu": madvu == null ? null : madvu,
    "tendvu": tendvu == null ? null : tendvu,
    "dvtinh": dvtinh == null ? null : dvtinh,
    "soluong": soluong == null ? null : soluong,
    "dongia": dongia == null ? null : dongia,
    "khuyenmai": khuyenmai == null ? null : khuyenmai,
    "tienchietkhau": tienchietkhau == null ? null : tienchietkhau,
    "thuesuat": thuesuat == null ? null : thuesuat,
    "thanhtientruocthue": thanhtientruocthue == null ? null : thanhtientruocthue,
    "tienthue": tienthue == null ? null : tienthue,
    "tongtienthanhtoan": tongtienthanhtoan == null ? null : tongtienthanhtoan,
  };
}
