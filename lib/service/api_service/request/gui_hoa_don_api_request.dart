// To parse this JSON data, do
//
//     final guiHoaDonApiRequest = guiHoaDonApiRequestFromJson(jsonString);

import 'dart:convert';

import '../../init.dart';

GuiHoaDonApiRequest guiHoaDonApiRequestFromJson(String str) => GuiHoaDonApiRequest.fromJson(json.decode(str));

String guiHoaDonApiRequestToJson(GuiHoaDonApiRequest data) => json.encode(data.toJson());

class GuiHoaDonApiRequest {
  GuiHoaDonApiRequest({
    this.pincode,
    this.id,
    this.loaihdon,
    this.matte,
    this.tennmua,
    this.mstNmua,
    this.tendvinmua,
    this.dchinmua,
    this.emailnmua,
    this.dthoainmua,
    this.tkhoannmua,
    this.nhangnmua,
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
    this.tongtienchietkhau,
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
    this.ngaykyvanban,
    this.kyDienTu,

    this.sovban,
    this.cd_khieuhdon,
    this.cd_mauhdon,
    this.cd_ngayHD,
    this.cd_sohdon,
    this.ngayCQThdongoc,
    this.adjustType,
    this.lydoDC,

    this.hDongVchuyen,
    this.ngayhdong,
    this.nguoivchuyen,
    this.ptienvchuyen,
    this.sohdong,
    this.tenknhap,
    this.tenkxuat,
    this.lDoDDong,
    this.ngayDDong,
    this.nguoiDDong,
    this.soLenhDDong,
  });

  final int pincode;
  final int id;
  final String loaihdon;
  final String matte;
  final String tennmua;
  final String mstNmua;
  final String tendvinmua;
  final String dchinmua;
  final String emailnmua;
  final String dthoainmua;
  final String tkhoannmua;
  final String nhangnmua;
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
  final int tongtienchietkhau;
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
  final dynamic ngaykyvanban;
  final String kyDienTu;


  final String sovban;
  final String cd_khieuhdon;
  final String cd_mauhdon;
  final String cd_ngayHD;
  final String cd_sohdon;
  final String ngayCQThdongoc;
  final String adjustType;
  final String lydoDC;


  final String hDongVchuyen;
  final String ngayhdong;
  final String nguoivchuyen;
  final String ptienvchuyen;
  final String sohdong;
  final String tenknhap;
  final String tenkxuat;

  final String lDoDDong;
  final String ngayDDong;
  final String nguoiDDong;
  final String soLenhDDong;

  factory GuiHoaDonApiRequest.fromJson(Map<String, dynamic> json) => GuiHoaDonApiRequest(
    pincode: json["pincode"] == null ? null : json["pincode"],
    id: json["id"] == null ? null : json["id"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    matte: json["matte"] == null ? null : json["matte"],
    tennmua: json["tennmua"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
    tkhoannmua: json["tkhoannmua"],
    nhangnmua: json["nhangnmua"],
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
    tongtienchietkhau: json["tongtienchietkhau"] == null ? null : json["tongtienchietkhau"],
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
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"] == null ? null : List<String>.from(json["lstInvOtherInfoMua"].map((x) => x)),
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"] == null ? null : List<String>.from(json["lstInvOtherInfoTToan"].map((x) => x)),
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"] == null ? null : List<dynamic>.from(json["lstInvOtherInfoCTHD"].map((x) => x)),
    ngaykyvanban: json["ngaykyvanban"],
    kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],

    hDongVchuyen: json["hDongVchuyen"] == null ? null : json["hDongVchuyen"],
    ngayhdong: json["ngayhdong"] == null ? null : json["ngayhdong"],
    nguoivchuyen: json["nguoivchuyen"] == null ? null : json["nguoivchuyen"],
    ptienvchuyen: json["ptienvchuyen"] == null ? null : json["ptienvchuyen"],
    sohdong: json["sohdong"] == null ? null : json["sohdong"],
    tenknhap: json["tenknhap"] == null ? null : json["tenknhap"],
    tenkxuat: json["tenkxuat"] == null ? null : json["tenkxuat"],
    lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
    ngayDDong: json["ngayDDong"] == null ? null : json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
    soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],

    sovban: json["sovban"] == null ? null : json["sovban"],
    cd_khieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    cd_mauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    cd_ngayHD: json["cd_ngayHD"] == null ? null : json["cd_ngayHD"],
    cd_sohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
    ngayCQThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
    adjustType: json["adjustType"] == null ? null : json["adjustType"],
    lydoDC: json["lydoDC"] == null ? null : json["lydoDC"],




  );

  Map<String, dynamic> toJson() => {
    "pincode": pincode == null ? null : pincode,
    "id": id == null ? null : id,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "matte": matte == null ? null : matte,
    "tennmua": tennmua,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "dthoainmua": dthoainmua == null ? null : dthoainmua,
    "tkhoannmua": tkhoannmua,
    "nhangnmua": nhangnmua,
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
    "tongtienchietkhau": tongtienchietkhau == null ? null : tongtienchietkhau,
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
    "ngaykyvanban": ngaykyvanban,
    "kyDienTu": kyDienTu == null ? null : kyDienTu,

    "hDongVchuyen": hDongVchuyen == null ? null : hDongVchuyen,
    "ngayhdong": ngayhdong == null ? null : ngayhdong,
    "nguoivchuyen": nguoivchuyen == null ? null : nguoivchuyen,
    "ptienvchuyen": ptienvchuyen == null ? null : ptienvchuyen,
    "sohdong": sohdong == null ? null : sohdong,
    "tenknhap": tenknhap == null ? null : tenknhap,
    "tenkxuat": tenkxuat == null ? null : tenkxuat,
    "lDoDDong": lDoDDong == null ? null : lDoDDong,
    "ngayDDong": ngayDDong == null ? null : ngayDDong,
    "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
    "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,



    "sovban": sovban == null ? null : sovban,
    "cd_khieuhdon": cd_khieuhdon == null ? null : cd_khieuhdon,
    "cd_mauhdon": cd_mauhdon == null ? null : cd_mauhdon,
    "cd_ngayHD": cd_ngayHD == null ? null : cd_ngayHD,
    "cd_sohdon": cd_sohdon == null ? null : cd_sohdon,
    "ngayCQThdongoc": ngayCQThdongoc == null ? null : ngayCQThdongoc,
    "adjustType": adjustType == null ? null : adjustType,
    "lydoDC": lydoDC == null ? null : lydoDC,

  };
}

