// To parse this JSON data, do
//
//     final tiepTucTBaoDcDinhDanhRequest = tiepTucTBaoDcDinhDanhRequestFromJson(jsonString);

import 'dart:convert';

import '../../../init.dart';

TiepTucTBaoDcDinhDanhRequest tiepTucTBaoDcDinhDanhRequestFromJson(String str) => TiepTucTBaoDcDinhDanhRequest.fromJson(json.decode(str));

String tiepTucTBaoDcDinhDanhRequestToJson(TiepTucTBaoDcDinhDanhRequest data) => json.encode(data.toJson());

class TiepTucTBaoDcDinhDanhRequest {
  TiepTucTBaoDcDinhDanhRequest({
    this.lydodieuchinh,
    this.soVBan,
    this.tenNMua,
    this.dchiNMua,
    this.ngayVBan,
    this.soHDonCqt,
    this.tendvimua,
    this.mstNmua,
    this.tinhchatgoc,
    this.loaiHDon,
    this.portalListInvoiceHdrTbao,
    this.portalInvoiceHdrTbao,
    this.pincode,
  });

  final List<String> lydodieuchinh;
  final List<String> soVBan;
  final List<String> tenNMua;
  final List<String> dchiNMua;
  final List<String> ngayVBan;
  final List<String> soHDonCqt;
  final List<String> tendvimua;
  final List<String> mstNmua;
  final List<String> tinhchatgoc;
  final String loaiHDon;
  final List<LstInvoiceDtlTbao> portalListInvoiceHdrTbao;
  final ThongBaoHdr portalInvoiceHdrTbao;
  final String pincode;

  factory TiepTucTBaoDcDinhDanhRequest.fromJson(Map<String, dynamic> json) => TiepTucTBaoDcDinhDanhRequest(
    lydodieuchinh: json["lydodieuchinh"] == null ? null : List<String>.from(json["lydodieuchinh"].map((x) => x)),
    soVBan: json["soVBan"] == null ? null : List<String>.from(json["soVBan"].map((x) => x)),
    tenNMua: json["tenNMua"] == null ? null : List<String>.from(json["tenNMua"].map((x) => x)),
    dchiNMua: json["dchiNMua"] == null ? null : List<String>.from(json["dchiNMua"].map((x) => x)),
    ngayVBan: json["ngayVBan"] == null ? null : List<String>.from(json["ngayVBan"].map((x) => x)),
    soHDonCqt: json["soHDonCQT"] == null ? null : List<String>.from(json["soHDonCQT"].map((x) => x)),
    tendvimua: json["tendvimua"] == null ? null : List<String>.from(json["tendvimua"].map((x) => x)),
    mstNmua: json["mstNmua"] == null ? null : List<String>.from(json["mstNmua"].map((x) => x)),
    tinhchatgoc: json["tinhchatgoc"] == null ? null : List<String>.from(json["tinhchatgoc"].map((x) => x)),
    loaiHDon: json["loaiHDon"] == null ? null : json["loaiHDon"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    portalListInvoiceHdrTbao: json["portalListInvoiceHdrTbao"] == null ? null : List<LstInvoiceDtlTbao>.from(json["portalListInvoiceHdrTbao"].map((x) => LstInvoiceDtlTbao.fromJson(x))),
    portalInvoiceHdrTbao: json["portalInvoiceHdrTbao"] == null ? null : ThongBaoHdr.fromJson(json["portalInvoiceHdrTbao"]),
  );

  Map<String, dynamic> toJson() => {
    "lydodieuchinh": lydodieuchinh == null ? null : List<dynamic>.from(lydodieuchinh.map((x) => x)),
    "soVBan": soVBan == null ? null : List<dynamic>.from(soVBan.map((x) => x)),
    "tenNMua": tenNMua == null ? null : List<dynamic>.from(tenNMua.map((x) => x)),
    "dchiNMua": dchiNMua == null ? null : List<dynamic>.from(dchiNMua.map((x) => x)),
    "ngayVBan": ngayVBan == null ? null : List<dynamic>.from(ngayVBan.map((x) => x)),
    "soHDonCQT": soHDonCqt == null ? null : List<dynamic>.from(soHDonCqt.map((x) => x)),
    "tendvimua": tendvimua == null ? null : List<dynamic>.from(tendvimua.map((x) => x)),
    "mstNmua": mstNmua == null ? null : List<dynamic>.from(mstNmua.map((x) => x)),
    "tinhchatgoc": tinhchatgoc == null ? null : List<dynamic>.from(tinhchatgoc.map((x) => x)),
    "loaiHDon": loaiHDon == null ? null : loaiHDon,
    "pincode": pincode == null ? null : pincode,
    "portalListInvoiceHdrTbao": portalListInvoiceHdrTbao == null ? null : List<dynamic>.from(portalListInvoiceHdrTbao.map((x) => x.toJson())),
    "portalInvoiceHdrTbao": portalInvoiceHdrTbao == null ? null : portalInvoiceHdrTbao.toJson(),
  };
}

// class PortalInvoiceHdrTbao {
//   PortalInvoiceHdrTbao();
//
//   factory PortalInvoiceHdrTbao.fromJson(Map<String, dynamic> json) => PortalInvoiceHdrTbao(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }

// class PortalListInvoiceHdrTbao {
//   PortalListInvoiceHdrTbao({
//     this.id,
//     this.idGoc,
//     this.dchinmua,
//     this.hdongvchuyen,
//     this.lydodchinh,
//     this.mstNmua,
//     this.ndungddong,
//     this.ngayddong,
//     this.ngayvban,
//     this.nguoiddong,
//     this.nguoiduyet,
//     this.nguoivchuyen,
//     this.pTbaoId,
//     this.ptienvchuyen,
//     this.sohdoncqtgoc,
//     this.solenhddonghdong,
//     this.sovban,
//     this.tendvinmua,
//     this.sodthoainmua,
//     this.emailNmua,
//     this.tenknhap,
//     this.tenkxuat,
//     this.tennmua,
//     this.trangthai,
//     this.tinhchatgoc,
//     this.ngayhdongoc,
//     this.ngayhdgocStr,
//     this.sohdong,
//     this.ngayhdong,
//     this.ngayhdongStr,
//     this.ngayddongStr,
//     this.status,
//     this.loaiTbao,
//     this.mstNban,
//     this.lstOther,
//     this.kihieu,
//     this.mauso,
//     this.hdongiay,
//     this.stt,
//     this.flagGiayTuin,
//     this.ptbaoId,
//   });
//
//   final int id;
//   final int idGoc;
//   final String dchinmua;
//   final dynamic hdongvchuyen;
//   final dynamic lydodchinh;
//   final String mstNmua;
//   final dynamic ndungddong;
//   final dynamic ngayddong;
//   final dynamic ngayvban;
//   final dynamic nguoiddong;
//   final dynamic nguoiduyet;
//   final dynamic nguoivchuyen;
//   final int pTbaoId;
//   final dynamic ptienvchuyen;
//   final String sohdoncqtgoc;
//   final dynamic solenhddonghdong;
//   final dynamic sovban;
//   final String tendvinmua;
//   final dynamic sodthoainmua;
//   final dynamic emailNmua;
//   final dynamic tenknhap;
//   final dynamic tenkxuat;
//   final String tennmua;
//   final dynamic trangthai;
//   final String tinhchatgoc;
//   final int ngayhdongoc;
//   final String ngayhdgocStr;
//   final dynamic sohdong;
//   final dynamic ngayhdong;
//   final dynamic ngayhdongStr;
//   final dynamic ngayddongStr;
//   final dynamic status;
//   final String loaiTbao;
//   final String mstNban;
//   final dynamic lstOther;
//   final String kihieu;
//   final String mauso;
//   final dynamic hdongiay;
//   final int stt;
//   final String flagGiayTuin;
//   final int ptbaoId;
//
//   factory PortalListInvoiceHdrTbao.fromJson(Map<String, dynamic> json) => PortalListInvoiceHdrTbao(
//     id: json["id"] == null ? null : json["id"],
//     idGoc: json["idGoc"] == null ? null : json["idGoc"],
//     dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
//     hdongvchuyen: json["hdongvchuyen"],
//     lydodchinh: json["lydodchinh"],
//     mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
//     ndungddong: json["ndungddong"],
//     ngayddong: json["ngayddong"],
//     ngayvban: json["ngayvban"],
//     nguoiddong: json["nguoiddong"],
//     nguoiduyet: json["nguoiduyet"],
//     nguoivchuyen: json["nguoivchuyen"],
//     pTbaoId: json["pTbaoId"] == null ? null : json["pTbaoId"],
//     ptienvchuyen: json["ptienvchuyen"],
//     sohdoncqtgoc: json["sohdoncqtgoc"] == null ? null : json["sohdoncqtgoc"],
//     solenhddonghdong: json["solenhddonghdong"],
//     sovban: json["sovban"],
//     tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
//     sodthoainmua: json["sodthoainmua"],
//     emailNmua: json["emailNmua"],
//     tenknhap: json["tenknhap"],
//     tenkxuat: json["tenkxuat"],
//     tennmua: json["tennmua"] == null ? null : json["tennmua"],
//     trangthai: json["trangthai"],
//     tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
//     ngayhdongoc: json["ngayhdongoc"] == null ? null : json["ngayhdongoc"],
//     ngayhdgocStr: json["ngayhdgocStr"] == null ? null : json["ngayhdgocStr"],
//     sohdong: json["sohdong"],
//     ngayhdong: json["ngayhdong"],
//     ngayhdongStr: json["ngayhdongStr"],
//     ngayddongStr: json["ngayddongStr"],
//     status: json["status"],
//     loaiTbao: json["loaiTbao"] == null ? null : json["loaiTbao"],
//     mstNban: json["mstNban"] == null ? null : json["mstNban"],
//     lstOther: json["lstOther"],
//     kihieu: json["kihieu"] == null ? null : json["kihieu"],
//     mauso: json["mauso"] == null ? null : json["mauso"],
//     hdongiay: json["hdongiay"],
//     stt: json["stt"] == null ? null : json["stt"],
//     flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
//     ptbaoId: json["ptbaoId"] == null ? null : json["ptbaoId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "idGoc": idGoc == null ? null : idGoc,
//     "dchinmua": dchinmua == null ? null : dchinmua,
//     "hdongvchuyen": hdongvchuyen,
//     "lydodchinh": lydodchinh,
//     "mstNmua": mstNmua == null ? null : mstNmua,
//     "ndungddong": ndungddong,
//     "ngayddong": ngayddong,
//     "ngayvban": ngayvban,
//     "nguoiddong": nguoiddong,
//     "nguoiduyet": nguoiduyet,
//     "nguoivchuyen": nguoivchuyen,
//     "pTbaoId": pTbaoId == null ? null : pTbaoId,
//     "ptienvchuyen": ptienvchuyen,
//     "sohdoncqtgoc": sohdoncqtgoc == null ? null : sohdoncqtgoc,
//     "solenhddonghdong": solenhddonghdong,
//     "sovban": sovban,
//     "tendvinmua": tendvinmua == null ? null : tendvinmua,
//     "sodthoainmua": sodthoainmua,
//     "emailNmua": emailNmua,
//     "tenknhap": tenknhap,
//     "tenkxuat": tenkxuat,
//     "tennmua": tennmua == null ? null : tennmua,
//     "trangthai": trangthai,
//     "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
//     "ngayhdongoc": ngayhdongoc == null ? null : ngayhdongoc,
//     "ngayhdgocStr": ngayhdgocStr == null ? null : ngayhdgocStr,
//     "sohdong": sohdong,
//     "ngayhdong": ngayhdong,
//     "ngayhdongStr": ngayhdongStr,
//     "ngayddongStr": ngayddongStr,
//     "status": status,
//     "loaiTbao": loaiTbao == null ? null : loaiTbao,
//     "mstNban": mstNban == null ? null : mstNban,
//     "lstOther": lstOther,
//     "kihieu": kihieu == null ? null : kihieu,
//     "mauso": mauso == null ? null : mauso,
//     "hdongiay": hdongiay,
//     "stt": stt == null ? null : stt,
//     "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
//     "ptbaoId": ptbaoId == null ? null : ptbaoId,
//   };
// }
