import 'dart:convert';

class SoldReportListRequest {
  SoldReportListRequest({
    this.fromDate,
    this.fromDateShow,
    this.hanghoa,
    this.hthuchdon,
    this.isReport,
    this.mstNban,
    this.mstNmua,
    this.page,
    this.tinhChat,
    this.toDate,
    this.toDateShow,
  });

  String fromDate;
  DateTime fromDateShow;
  String hanghoa;
  String hthuchdon;
  String isReport;
  String mstNban;
  String mstNmua;
  int page;
  String tinhChat;
  String toDate;
  DateTime toDateShow;

  factory SoldReportListRequest.fromJson(String str) => SoldReportListRequest.fromMap(json.decode(str));

  String toJsonData() => json.encode(toJson());

  factory SoldReportListRequest.fromMap(Map<String, dynamic> json) => SoldReportListRequest(
    fromDate: json["fromDate"],
    fromDateShow: DateTime.parse(json["fromDateShow"]),
    hanghoa: json["hanghoa"],
    hthuchdon: json["hthuchdon"],
    isReport: json["isReport"],
    mstNban: json["mstNBAN"],
    mstNmua: json["mstNmua"],
    page: json["page"],
    tinhChat: json["tinhChat"],
    toDate: json["toDate"],
    toDateShow: DateTime.parse(json["toDateShow"]),
  );

  Map<String, dynamic> toJson() => {
    "fromDate": fromDate,
    "fromDateShow": "${fromDateShow.year.toString().padLeft(4, '0')}-${fromDateShow.month.toString().padLeft(2, '0')}-${fromDateShow.day.toString().padLeft(2, '0')}",
    "hanghoa": hanghoa,
    "hthuchdon": hthuchdon,
    "isReport": isReport,
    "mstNBAN": mstNban,
    "mstNmua": mstNmua,
    "page": page,
    "tinhChat": tinhChat,
    "toDate": toDate,
    "toDateShow": "${toDateShow.year.toString().padLeft(4, '0')}-${toDateShow.month.toString().padLeft(2, '0')}-${toDateShow.day.toString().padLeft(2, '0')}",
  };
}
