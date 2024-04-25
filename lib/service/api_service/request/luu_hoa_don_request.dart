// To parse this JSON data, do
//
//     final luuHoaDonRequest = luuHoaDonRequestFromJson(jsonString);

import 'dart:convert';

import 'tra_cuu_hoa_don/gui_review_hoa_don_request.dart';

LuuHoaDonRequest luuHoaDonRequestFromJson(String str) => LuuHoaDonRequest.fromJson(json.decode(str));

String luuHoaDonRequestToJson(LuuHoaDonRequest data) => json.encode(data.toJson());

class LuuHoaDonRequest {
  LuuHoaDonRequest({
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
    this.tongtienthuente,
    this.tongtienttoannte,
    this.tienbangchu,
    this.tongtientruocthue10Nte,
    this.tongtientruocthue5Nte,
    this.tongtientruocthue0Nte,
    this.tongtientruocthuekchiuthuente,
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
    this.lydoDc,
    this.adjustType,

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
    this.sohdongoc,
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
  final String tongtienthuente;
  final String tongtienttoannte;
  final String tienbangchu;
  final int tongtientruocthue10Nte;
  final int tongtientruocthue5Nte;
  final int tongtientruocthue0Nte;
  final int tongtientruocthuekchiuthuente;
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
  final String ngaykyvanban;
  final String lydoDc;
  final String adjustType;

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
  final String sohdongoc;

  factory LuuHoaDonRequest.fromJson(Map<String, dynamic> json) => LuuHoaDonRequest(
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
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    tienbangchu: json["tienbangchu"] == null ? null : json["tienbangchu"],
    tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
    tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
    tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
    tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
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
    ngaykyvanban: json["ngaykyvanban"] == null ? null : json["ngaykyvanban"],
    lydoDc: json["lydoDC"] == null ? null : json["lydoDC"],
    adjustType: json["adjustType"] == null ? null : json["adjustType"],

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
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
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
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "tienbangchu": tienbangchu == null ? null : tienbangchu,
    "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
    "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
    "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
    "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
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
    "ngaykyvanban": ngaykyvanban == null ? null : ngaykyvanban,
    "lydoDC": lydoDc == null ? null : lydoDc,
    "adjustType": adjustType == null ? null : adjustType,

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
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
  };
}

