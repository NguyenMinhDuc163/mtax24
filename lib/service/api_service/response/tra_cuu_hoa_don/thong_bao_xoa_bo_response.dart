// To parse this JSON data, do
//
//     final thongBaoXoaBoRequest = thongBaoXoaBoRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:mtax24/service/init.dart';

import 'chi_tiet_thong_bao_response.dart';
import 'tiep_tuc_tbao_dcdinh_danhResponse.dart';


class ThongBaoXoaBoResponse {
  ThongBaoXoaBoResponse({
    @required this.invHdr,
    @required this.portalHdrTbao,
    @required this.portalListInvoiceHdrTbao,
    @required this.txStatus,
    @required this.isHsm,
    @required this.htmlContent,
  });

  InReq invHdr;
  ThongBaoHdr portalHdrTbao;
  List<LstInvoiceDtlTbao> portalListInvoiceHdrTbao;
  TxStatus txStatus;
  String isHsm;
  dynamic htmlContent;

  factory ThongBaoXoaBoResponse.fromJson(Map<String, dynamic> json) => ThongBaoXoaBoResponse(
    invHdr: json["invHdr"] == null ? null : InReq.fromJson(json["invHdr"]),
    portalHdrTbao: json["portalHdrTbao"] == null ? null : ThongBaoHdr.fromJson(json["portalHdrTbao"]),
    portalListInvoiceHdrTbao: json["portalListInvoiceHdrTbao"] == null ? null : List<LstInvoiceDtlTbao>.from(json["portalListInvoiceHdrTbao"].map((x) => LstInvoiceDtlTbao.fromJson(x))),
    txStatus: json["txStatus"] == null ? null : TxStatus.fromJson(json["txStatus"]),
    isHsm: json["isHSM"] == null ? null : json["isHSM"],
    htmlContent: json["htmlContent"],
  );

  Map<String, dynamic> toJson() => {
    "invHdr": invHdr == null ? null : invHdr.toJson(),
    "portalHdrTbao": portalHdrTbao == null ? null : portalHdrTbao.toJson(),
    "portalListInvoiceHdrTbao": portalListInvoiceHdrTbao == null ? null : List<dynamic>.from(portalListInvoiceHdrTbao.map((x) => x.toJson())),
    "txStatus": txStatus == null ? null : txStatus.toJson(),
    "isHSM": isHsm == null ? null : isHsm,
    "htmlContent": htmlContent,
  };
}

// class PortalHdrTbao {
//   PortalHdrTbao({
//     @required this.id,
//     @required this.idGoc,
//     @required this.hThucHDon,
//     @required this.hdongvchuyen,
//     @required this.idNguoilap,
//     @required this.loaitbao,
//     @required this.ngayhdon,
//     @required this.maGdich,
//     @required this.macqt,
//     @required this.maktra,
//     @required this.motaloi,
//     @required this.mstNban,
//     @required this.ngayduyet,
//     @required this.ngayhdcqt,
//     @required this.ngayhdongoc,
//     @required this.ngayvban,
//     @required this.nguoiduyet,
//     @required this.nguoilap,
//     @required this.nhangnban,
//     @required this.sohdongoc,
//     @required this.sotbao,
//     @required this.sotbaocqt,
//     @required this.sovban,
//     @required this.tentbao,
//     @required this.tkhoannban,
//     @required this.trangthai,
//     @required this.contentxml,
//     @required this.dchinmua,
//     @required this.tennmua,
//     @required this.lydodieuchinh,
//     @required this.tennban,
//     @required this.dchinban,
//     @required this.dthoainban,
//     @required this.faxnban,
//     @required this.emailnban,
//     @required this.mstNmua,
//     @required this.tendvinmua,
//     @required this.emailnmua,
//     @required this.dthoainmua,
//     @required this.tkhoannmua,
//     @required this.nhangnmua,
//     @required this.faxnmua,
//     @required this.tinhChat,
//     @required this.tencqt,
//     @required this.matte,
//     @required this.soLenhDDong,
//     @required this.ngayDDong,
//     @required this.nguoiDDong,
//     @required this.ndDDong,
//     @required this.nguoivchuyen,
//     @required this.hDongVchuyen,
//     @required this.ptienvchuyen,
//     @required this.tenkxuat,
//     @required this.tenknhap,
//     @required this.lydoTchoi,
//     @required this.kihieu,
//     @required this.ngayLap,
//     @required this.tGia,
//     @required this.thuKhoXuat,
//     @required this.lyDoXoaBo,
//     @required this.sohdong,
//     @required this.kyDienTu,
//     @required this.ngayhdong,
//     @required this.updateTime,
//     @required this.serviceType,
//     @required this.channelCode,
//     @required this.status,
//     @required this.content,
//     @required this.fee,
//     @required this.feeVat,
//     @required this.wfProcessId,
//     @required this.flagFee,
//     @required this.dtlTbao,
//     @required this.pTbaoId,
//     @required this.sohdoncqtgoc,
//     @required this.cdMauso,
//     @required this.cdKihieu,
//     @required this.hthuchdongoc,
//     @required this.isTt68,
//     @required this.tThaiXNhanCqt,
//     @required this.maGDichTChieu,
//     @required this.maCqtCap,
//     @required this.flagGiayTuin,
//     @required this.mauso,
//     @required this.hdongiay,
//     @required this.barcode,
//     @required this.tinhchatgoc,
//     @required this.messReceived,
//     @required this.ltbao,
//     @required this.ntbccqt,
//     @required this.lydodchinh,
//     @required this.thuKhoNhap,
//     @required this.tctbao,
//   });
//
//   int id;
//   int idGoc;
//   String hThucHDon;
//   dynamic hdongvchuyen;
//   int idNguoilap;
//   String loaitbao;
//   int ngayhdon;
//   String maGdich;
//   String macqt;
//   String maktra;
//   dynamic motaloi;
//   String mstNban;
//   dynamic ngayduyet;
//   dynamic ngayhdcqt;
//   int ngayhdongoc;
//   int ngayvban;
//   dynamic nguoiduyet;
//   String nguoilap;
//   dynamic nhangnban;
//   String sohdongoc;
//   String sotbao;
//   String sotbaocqt;
//   String sovban;
//   String tentbao;
//   dynamic tkhoannban;
//   String trangthai;
//   String contentxml;
//   dynamic dchinmua;
//   dynamic tennmua;
//   dynamic lydodieuchinh;
//   String tennban;
//   String dchinban;
//   dynamic dthoainban;
//   dynamic faxnban;
//   dynamic emailnban;
//   dynamic mstNmua;
//   dynamic tendvinmua;
//   dynamic emailnmua;
//   dynamic dthoainmua;
//   dynamic tkhoannmua;
//   dynamic nhangnmua;
//   dynamic faxnmua;
//   String tinhChat;
//   String tencqt;
//   dynamic matte;
//   dynamic soLenhDDong;
//   dynamic ngayDDong;
//   dynamic nguoiDDong;
//   dynamic ndDDong;
//   dynamic nguoivchuyen;
//   dynamic hDongVchuyen;
//   dynamic ptienvchuyen;
//   dynamic tenkxuat;
//   dynamic tenknhap;
//   dynamic lydoTchoi;
//   String kihieu;
//   int ngayLap;
//   dynamic tGia;
//   dynamic thuKhoXuat;
//   String lyDoXoaBo;
//   dynamic sohdong;
//   String kyDienTu;
//   dynamic ngayhdong;
//   dynamic updateTime;
//   String serviceType;
//   String channelCode;
//   String status;
//   dynamic content;
//   int fee;
//   int feeVat;
//   dynamic wfProcessId;
//   String flagFee;
//   dynamic dtlTbao;
//   int pTbaoId;
//   dynamic sohdoncqtgoc;
//   dynamic cdMauso;
//   dynamic cdKihieu;
//   dynamic hthuchdongoc;
//   String isTt68;
//   dynamic tThaiXNhanCqt;
//   dynamic maGDichTChieu;
//   dynamic maCqtCap;
//   String flagGiayTuin;
//   String mauso;
//   String hdongiay;
//   dynamic barcode;
//   String tinhchatgoc;
//   dynamic messReceived;
//   dynamic ltbao;
//   dynamic ntbccqt;
//   dynamic lydodchinh;
//   dynamic thuKhoNhap;
//   dynamic tctbao;
//
//   factory PortalHdrTbao.fromJson(Map<String, dynamic> json) => PortalHdrTbao(
//     id: json["id"] == null ? null : json["id"],
//     idGoc: json["idGoc"] == null ? null : json["idGoc"],
//     hThucHDon: json["hThucHDon"] == null ? null : json["hThucHDon"],
//     hdongvchuyen: json["hdongvchuyen"],
//     idNguoilap: json["idNguoilap"] == null ? null : json["idNguoilap"],
//     loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
//     ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
//     maGdich: json["maGdich"] == null ? null : json["maGdich"],
//     macqt: json["macqt"] == null ? null : json["macqt"],
//     maktra: json["maktra"] == null ? null : json["maktra"],
//     motaloi: json["motaloi"],
//     mstNban: json["mstNban"] == null ? null : json["mstNban"],
//     ngayduyet: json["ngayduyet"],
//     ngayhdcqt: json["ngayhdcqt"],
//     ngayhdongoc: json["ngayhdongoc"] == null ? null : json["ngayhdongoc"],
//     ngayvban: json["ngayvban"] == null ? null : json["ngayvban"],
//     nguoiduyet: json["nguoiduyet"],
//     nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
//     nhangnban: json["nhangnban"],
//     sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
//     sotbao: json["sotbao"] == null ? null : json["sotbao"],
//     sotbaocqt: json["sotbaocqt"] == null ? null : json["sotbaocqt"],
//     sovban: json["sovban"] == null ? null : json["sovban"],
//     tentbao: json["tentbao"] == null ? null : json["tentbao"],
//     tkhoannban: json["tkhoannban"],
//     trangthai: json["trangthai"] == null ? null : json["trangthai"],
//     contentxml: json["contentxml"] == null ? null : json["contentxml"],
//     dchinmua: json["dchinmua"],
//     tennmua: json["tennmua"],
//     lydodieuchinh: json["lydodieuchinh"],
//     tennban: json["tennban"] == null ? null : json["tennban"],
//     dchinban: json["dchinban"] == null ? null : json["dchinban"],
//     dthoainban: json["dthoainban"],
//     faxnban: json["faxnban"],
//     emailnban: json["emailnban"],
//     mstNmua: json["mstNmua"],
//     tendvinmua: json["tendvinmua"],
//     emailnmua: json["emailnmua"],
//     dthoainmua: json["dthoainmua"],
//     tkhoannmua: json["tkhoannmua"],
//     nhangnmua: json["nhangnmua"],
//     faxnmua: json["faxnmua"],
//     tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
//     tencqt: json["tencqt"] == null ? null : json["tencqt"],
//     matte: json["matte"],
//     soLenhDDong: json["soLenhDDong"],
//     ngayDDong: json["ngayDDong"],
//     nguoiDDong: json["nguoiDDong"],
//     ndDDong: json["ndDDong"],
//     nguoivchuyen: json["nguoivchuyen"],
//     hDongVchuyen: json["hDongVchuyen"],
//     ptienvchuyen: json["ptienvchuyen"],
//     tenkxuat: json["tenkxuat"],
//     tenknhap: json["tenknhap"],
//     lydoTchoi: json["lydoTchoi"],
//     kihieu: json["kihieu"] == null ? null : json["kihieu"],
//     ngayLap: json["ngayLap"] == null ? null : json["ngayLap"],
//     tGia: json["tGia"],
//     thuKhoXuat: json["thuKhoXuat"],
//     lyDoXoaBo: json["lyDoXoaBo"] == null ? null : json["lyDoXoaBo"],
//     sohdong: json["sohdong"],
//     kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
//     ngayhdong: json["ngayhdong"],
//     updateTime: json["update_time"],
//     serviceType: json["serviceType"] == null ? null : json["serviceType"],
//     channelCode: json["channelCode"] == null ? null : json["channelCode"],
//     status: json["status"] == null ? null : json["status"],
//     content: json["content"],
//     fee: json["fee"] == null ? null : json["fee"],
//     feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
//     wfProcessId: json["wf_process_id"],
//     flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
//     dtlTbao: json["dtlTbao"],
//     pTbaoId: json["p_tbao_id"] == null ? null : json["p_tbao_id"],
//     sohdoncqtgoc: json["sohdoncqtgoc"],
//     cdMauso: json["cd_mauso"],
//     cdKihieu: json["cd_kihieu"],
//     hthuchdongoc: json["hthuchdongoc"],
//     isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
//     tThaiXNhanCqt: json["tThaiXNhanCQT"],
//     maGDichTChieu: json["maGDichTChieu"],
//     maCqtCap: json["maCQTCap"],
//     flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
//     mauso: json["mauso"] == null ? null : json["mauso"],
//     hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
//     barcode: json["barcode"],
//     tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
//     messReceived: json["messReceived"],
//     ltbao: json["ltbao"],
//     ntbccqt: json["ntbccqt"],
//     lydodchinh: json["lydodchinh"],
//     thuKhoNhap: json["thuKhoNhap"],
//     tctbao: json["tctbao"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "idGoc": idGoc == null ? null : idGoc,
//     "hThucHDon": hThucHDon == null ? null : hThucHDon,
//     "hdongvchuyen": hdongvchuyen,
//     "idNguoilap": idNguoilap == null ? null : idNguoilap,
//     "loaitbao": loaitbao == null ? null : loaitbao,
//     "ngayhdon": ngayhdon == null ? null : ngayhdon,
//     "maGdich": maGdich == null ? null : maGdich,
//     "macqt": macqt == null ? null : macqt,
//     "maktra": maktra == null ? null : maktra,
//     "motaloi": motaloi,
//     "mstNban": mstNban == null ? null : mstNban,
//     "ngayduyet": ngayduyet,
//     "ngayhdcqt": ngayhdcqt,
//     "ngayhdongoc": ngayhdongoc == null ? null : ngayhdongoc,
//     "ngayvban": ngayvban == null ? null : ngayvban,
//     "nguoiduyet": nguoiduyet,
//     "nguoilap": nguoilap == null ? null : nguoilap,
//     "nhangnban": nhangnban,
//     "sohdongoc": sohdongoc == null ? null : sohdongoc,
//     "sotbao": sotbao == null ? null : sotbao,
//     "sotbaocqt": sotbaocqt == null ? null : sotbaocqt,
//     "sovban": sovban == null ? null : sovban,
//     "tentbao": tentbao == null ? null : tentbao,
//     "tkhoannban": tkhoannban,
//     "trangthai": trangthai == null ? null : trangthai,
//     "contentxml": contentxml == null ? null : contentxml,
//     "dchinmua": dchinmua,
//     "tennmua": tennmua,
//     "lydodieuchinh": lydodieuchinh,
//     "tennban": tennban == null ? null : tennban,
//     "dchinban": dchinban == null ? null : dchinban,
//     "dthoainban": dthoainban,
//     "faxnban": faxnban,
//     "emailnban": emailnban,
//     "mstNmua": mstNmua,
//     "tendvinmua": tendvinmua,
//     "emailnmua": emailnmua,
//     "dthoainmua": dthoainmua,
//     "tkhoannmua": tkhoannmua,
//     "nhangnmua": nhangnmua,
//     "faxnmua": faxnmua,
//     "tinhChat": tinhChat == null ? null : tinhChat,
//     "tencqt": tencqt == null ? null : tencqt,
//     "matte": matte,
//     "soLenhDDong": soLenhDDong,
//     "ngayDDong": ngayDDong,
//     "nguoiDDong": nguoiDDong,
//     "ndDDong": ndDDong,
//     "nguoivchuyen": nguoivchuyen,
//     "hDongVchuyen": hDongVchuyen,
//     "ptienvchuyen": ptienvchuyen,
//     "tenkxuat": tenkxuat,
//     "tenknhap": tenknhap,
//     "lydoTchoi": lydoTchoi,
//     "kihieu": kihieu == null ? null : kihieu,
//     "ngayLap": ngayLap == null ? null : ngayLap,
//     "tGia": tGia,
//     "thuKhoXuat": thuKhoXuat,
//     "lyDoXoaBo": lyDoXoaBo == null ? null : lyDoXoaBo,
//     "sohdong": sohdong,
//     "kyDienTu": kyDienTu == null ? null : kyDienTu,
//     "ngayhdong": ngayhdong,
//     "update_time": updateTime,
//     "serviceType": serviceType == null ? null : serviceType,
//     "channelCode": channelCode == null ? null : channelCode,
//     "status": status == null ? null : status,
//     "content": content,
//     "fee": fee == null ? null : fee,
//     "fee_vat": feeVat == null ? null : feeVat,
//     "wf_process_id": wfProcessId,
//     "flag_fee": flagFee == null ? null : flagFee,
//     "dtlTbao": dtlTbao,
//     "p_tbao_id": pTbaoId == null ? null : pTbaoId,
//     "sohdoncqtgoc": sohdoncqtgoc,
//     "cd_mauso": cdMauso,
//     "cd_kihieu": cdKihieu,
//     "hthuchdongoc": hthuchdongoc,
//     "is_tt68": isTt68 == null ? null : isTt68,
//     "tThaiXNhanCQT": tThaiXNhanCqt,
//     "maGDichTChieu": maGDichTChieu,
//     "maCQTCap": maCqtCap,
//     "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
//     "mauso": mauso == null ? null : mauso,
//     "hdongiay": hdongiay == null ? null : hdongiay,
//     "barcode": barcode,
//     "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
//     "messReceived": messReceived,
//     "ltbao": ltbao,
//     "ntbccqt": ntbccqt,
//     "lydodchinh": lydodchinh,
//     "thuKhoNhap": thuKhoNhap,
//     "tctbao": tctbao,
//   };
// }

// class PortalListInvoiceHdrTbao {
//   PortalListInvoiceHdrTbao({
//     @required this.id,
//     @required this.idGoc,
//     @required this.dchinmua,
//     @required this.hdongvchuyen,
//     @required this.lydodchinh,
//     @required this.mstNmua,
//     @required this.ndungddong,
//     @required this.ngayddong,
//     @required this.ngayvban,
//     @required this.nguoiddong,
//     @required this.nguoiduyet,
//     @required this.nguoivchuyen,
//     @required this.pTbaoId,
//     @required this.ptienvchuyen,
//     @required this.sohdoncqtgoc,
//     @required this.solenhddonghdong,
//     @required this.sovban,
//     @required this.tendvinmua,
//     @required this.sodthoainmua,
//     @required this.emailNmua,
//     @required this.tenknhap,
//     @required this.tenkxuat,
//     @required this.tennmua,
//     @required this.trangthai,
//     @required this.tinhchatgoc,
//     @required this.ngayhdongoc,
//     @required this.ngayhdgocStr,
//     @required this.sohdong,
//     @required this.ngayhdong,
//     @required this.ngayhdongStr,
//     @required this.ngayddongStr,
//     @required this.status,
//     @required this.loaiTbao,
//     @required this.mstNban,
//     @required this.lstOther,
//     @required this.kihieu,
//     @required this.mauso,
//     @required this.hdongiay,
//     @required this.stt,
//     @required this.flagGiayTuin,
//     @required this.ptbaoId,
//   });
//
//   int id;
//   int idGoc;
//   dynamic dchinmua;
//   dynamic hdongvchuyen;
//   String lydodchinh;
//   String mstNmua;
//   dynamic ndungddong;
//   dynamic ngayddong;
//   int ngayvban;
//   dynamic nguoiddong;
//   dynamic nguoiduyet;
//   dynamic nguoivchuyen;
//   int pTbaoId;
//   dynamic ptienvchuyen;
//   String sohdoncqtgoc;
//   dynamic solenhddonghdong;
//   String sovban;
//   String tendvinmua;
//   dynamic sodthoainmua;
//   dynamic emailNmua;
//   dynamic tenknhap;
//   dynamic tenkxuat;
//   dynamic tennmua;
//   dynamic trangthai;
//   String tinhchatgoc;
//   int ngayhdongoc;
//   String ngayhdgocStr;
//   dynamic sohdong;
//   dynamic ngayhdong;
//   dynamic ngayhdongStr;
//   dynamic ngayddongStr;
//   dynamic status;
//   String loaiTbao;
//   String mstNban;
//   dynamic lstOther;
//   String kihieu;
//   String mauso;
//   String hdongiay;
//   int stt;
//   String flagGiayTuin;
//   int ptbaoId;
//
//   factory PortalListInvoiceHdrTbao.fromJson(Map<String, dynamic> json) => PortalListInvoiceHdrTbao(
//     id: json["id"] == null ? null : json["id"],
//     idGoc: json["idGoc"] == null ? null : json["idGoc"],
//     dchinmua: json["dchinmua"],
//     hdongvchuyen: json["hdongvchuyen"],
//     lydodchinh: json["lydodchinh"] == null ? null : json["lydodchinh"],
//     mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
//     ndungddong: json["ndungddong"],
//     ngayddong: json["ngayddong"],
//     ngayvban: json["ngayvban"] == null ? null : json["ngayvban"],
//     nguoiddong: json["nguoiddong"],
//     nguoiduyet: json["nguoiduyet"],
//     nguoivchuyen: json["nguoivchuyen"],
//     pTbaoId: json["pTbaoId"] == null ? null : json["pTbaoId"],
//     ptienvchuyen: json["ptienvchuyen"],
//     sohdoncqtgoc: json["sohdoncqtgoc"] == null ? null : json["sohdoncqtgoc"],
//     solenhddonghdong: json["solenhddonghdong"],
//     sovban: json["sovban"] == null ? null : json["sovban"],
//     tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
//     sodthoainmua: json["sodthoainmua"],
//     emailNmua: json["emailNmua"],
//     tenknhap: json["tenknhap"],
//     tenkxuat: json["tenkxuat"],
//     tennmua: json["tennmua"],
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
//     hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
//     stt: json["stt"] == null ? null : json["stt"],
//     flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
//     ptbaoId: json["ptbaoId"] == null ? null : json["ptbaoId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "idGoc": idGoc == null ? null : idGoc,
//     "dchinmua": dchinmua,
//     "hdongvchuyen": hdongvchuyen,
//     "lydodchinh": lydodchinh == null ? null : lydodchinh,
//     "mstNmua": mstNmua == null ? null : mstNmua,
//     "ndungddong": ndungddong,
//     "ngayddong": ngayddong,
//     "ngayvban": ngayvban == null ? null : ngayvban,
//     "nguoiddong": nguoiddong,
//     "nguoiduyet": nguoiduyet,
//     "nguoivchuyen": nguoivchuyen,
//     "pTbaoId": pTbaoId == null ? null : pTbaoId,
//     "ptienvchuyen": ptienvchuyen,
//     "sohdoncqtgoc": sohdoncqtgoc == null ? null : sohdoncqtgoc,
//     "solenhddonghdong": solenhddonghdong,
//     "sovban": sovban == null ? null : sovban,
//     "tendvinmua": tendvinmua == null ? null : tendvinmua,
//     "sodthoainmua": sodthoainmua,
//     "emailNmua": emailNmua,
//     "tenknhap": tenknhap,
//     "tenkxuat": tenkxuat,
//     "tennmua": tennmua,
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
//     "hdongiay": hdongiay == null ? null : hdongiay,
//     "stt": stt == null ? null : stt,
//     "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
//     "ptbaoId": ptbaoId == null ? null : ptbaoId,
//   };
// }

