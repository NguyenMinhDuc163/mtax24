import 'dart:convert';

class InvoiceReportListRequest {
  InvoiceReportListRequest({
    this.fromDate,
    this.fromDateShow,
    this.hthuchdon,
    this.isReport,
    this.kyHieuHDon,
    this.loaihdon,
    this.matte,
    this.mauhdon,
    this.mstNban,
    this.mstNmua,
    this.page,
    this.sohdon,
    this.tinhChat,
    this.toDate,
    this.toDateShow,
  });

  String fromDate;
  DateTime fromDateShow;
  String hthuchdon;
  String isReport;
  String kyHieuHDon;
  String loaihdon;
  String matte;
  String mauhdon;
  String mstNban;
  String mstNmua;
  int page;
  String sohdon;
  String tinhChat;
  String toDate;
  DateTime toDateShow;

  factory InvoiceReportListRequest.fromJson(String str) => InvoiceReportListRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory InvoiceReportListRequest.fromMap(Map<String, dynamic> json) => InvoiceReportListRequest(
    fromDate: json["fromDate"],
    fromDateShow: DateTime.parse(json["fromDateShow"]),
    hthuchdon: json["hthuchdon"],
    isReport: json["isReport"],
    kyHieuHDon: json["kyHieuHDon"],
    loaihdon: json["loaihdon"],
    matte: json["matte"],
    mauhdon: json["mauhdon"],
    mstNban: json["mstNBAN"],
    mstNmua: json["mstNmua"],
    page: json["page"],
    sohdon: json["sohdon"],
    tinhChat: json["tinhChat"],
    toDate: json["toDate"],
    toDateShow: DateTime.parse(json["toDateShow"]),
  );

  Map<String, dynamic> toJson() => {
    "fromDate": fromDate,
    "fromDateShow": "${fromDateShow.year.toString().padLeft(4, '0')}-${fromDateShow.month.toString().padLeft(2, '0')}-${fromDateShow.day.toString().padLeft(2, '0')}",
    "hthuchdon": hthuchdon,
    "isReport": isReport,
    "kyHieuHDon": kyHieuHDon,
    "loaihdon": loaihdon,
    "matte": matte,
    "mauhdon": mauhdon,
    "mstNBAN": mstNban,
    "mstNmua": mstNmua,
    "page": page,
    "sohdon": sohdon,
    "tinhChat": tinhChat,
    "toDate": toDate,
    "toDateShow": "${toDateShow.year.toString().padLeft(4, '0')}-${toDateShow.month.toString().padLeft(2, '0')}-${toDateShow.day.toString().padLeft(2, '0')}",
  };
}
