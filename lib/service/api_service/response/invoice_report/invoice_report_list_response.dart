import 'dart:convert';

class InvoiceReportListResponse {
  InvoiceReportListResponse({
    this.tongcongVnd,
    this.tongthueVnd,
    this.listIccInvHdrReport,
    this.totalPage,
    this.htmlContent,
  });

  String tongcongVnd;
  String tongthueVnd;
  dynamic listIccInvHdrReport;
  String totalPage;
  dynamic htmlContent;

  factory InvoiceReportListResponse.fromJson(String str) => InvoiceReportListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoiceReportListResponse.fromMap(Map<String, dynamic> json) => InvoiceReportListResponse(
    tongcongVnd: json["tongcongVND"],
    tongthueVnd: json["tongthueVND"],
    listIccInvHdrReport: json["listIccInvHdrReport"] != null ? List<ListIccInvHdrReport>.from(json["listIccInvHdrReport"].map((x) => ListIccInvHdrReport.fromMap(x))) : json["listIccInvHdrReport"],
    totalPage: json["totalPage"],
    htmlContent: json["htmlContent"],
  );

  Map<String, dynamic> toMap() => {
    "tongcongVND": tongcongVnd,
    "tongthueVND": tongthueVnd,
    "listIccInvHdrReport": List<dynamic>.from(listIccInvHdrReport.map((x) => x.toMap())),
    "totalPage": totalPage,
    "htmlContent": htmlContent,
  };
}

class ListIccInvHdrReport {
  ListIccInvHdrReport({
    this.matte,
    this.tongtienttoannte,
    this.tongtienttoannteStr,
    this.tongtienttoanvnd,
    this.tongtienttoanvndStr,
    this.khieuhdon,
    this.loaihdon,
    this.mauhdon,
    this.tongHdonDaCapMa,
    this.soLuongHdonGoc,
    this.soLuongHdonThayThe,
    this.soLuongHdonDChinh,
    this.soLuongHdonBiDChinhDd,
    this.soLuongHdonBiXoaBo,
    this.tongTienThueNTe,
    this.tongTienThueNTeStr,
    this.counthdon,
    this.tongTienThueVndStr,
    this.tongtienhangnte,
    this.tongtienhangvnd,
    this.tongTienThue,
  });

  String matte;
  dynamic tongtienttoannte;
  dynamic tongtienttoannteStr;
  dynamic tongtienttoanvnd;
  dynamic tongtienttoanvndStr;
  dynamic khieuhdon;
  dynamic loaihdon;
  dynamic mauhdon;
  dynamic tongHdonDaCapMa;
  dynamic soLuongHdonGoc;
  dynamic soLuongHdonThayThe;
  dynamic soLuongHdonDChinh;
  dynamic soLuongHdonBiDChinhDd;
  dynamic soLuongHdonBiXoaBo;
  dynamic tongTienThueNTe;
  dynamic tongTienThueNTeStr;
  int counthdon;
  dynamic tongTienThueVndStr;
  dynamic tongtienhangnte;
  dynamic tongtienhangvnd;
  dynamic tongTienThue;

  factory ListIccInvHdrReport.fromJson(String str) => ListIccInvHdrReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListIccInvHdrReport.fromMap(Map<String, dynamic> json) => ListIccInvHdrReport(
    matte: json["matte"],
    tongtienttoannte: json["tongtienttoannte"],
    tongtienttoannteStr: json["tongtienttoannteStr"],
    tongtienttoanvnd: json["tongtienttoanvnd"],
    tongtienttoanvndStr: json["tongtienttoanvndStr"],
    khieuhdon: json["khieuhdon"],
    loaihdon: json["loaihdon"],
    mauhdon: json["mauhdon"],
    tongHdonDaCapMa: json["tongHdonDaCapMa"],
    soLuongHdonGoc: json["soLuongHdonGoc"],
    soLuongHdonThayThe: json["soLuongHdonThayThe"],
    soLuongHdonDChinh: json["soLuongHdonDChinh"],
    soLuongHdonBiDChinhDd: json["soLuongHdonBiDChinhDD"],
    soLuongHdonBiXoaBo: json["soLuongHdonBiXoaBo"],
    tongTienThueNTe: json["tongTienThueNTe"],
    tongTienThueNTeStr: json["tongTienThueNTeStr"],
    counthdon: json["counthdon"],
    tongTienThueVndStr: json["tongTienThueVNDStr"],
    tongtienhangnte: json["tongtienhangnte"],
    tongtienhangvnd: json["tongtienhangvnd"],
    tongTienThue: json["tongTienThue"],
  );

  Map<String, dynamic> toMap() => {
    "matte": matte,
    "tongtienttoannte": tongtienttoannte,
    "tongtienttoannteStr": tongtienttoannteStr,
    "tongtienttoanvnd": tongtienttoanvnd,
    "tongtienttoanvndStr": tongtienttoanvndStr,
    "khieuhdon": khieuhdon,
    "loaihdon": loaihdon,
    "mauhdon": mauhdon,
    "tongHdonDaCapMa": tongHdonDaCapMa,
    "soLuongHdonGoc": soLuongHdonGoc,
    "soLuongHdonThayThe": soLuongHdonThayThe,
    "soLuongHdonDChinh": soLuongHdonDChinh,
    "soLuongHdonBiDChinhDD": soLuongHdonBiDChinhDd,
    "soLuongHdonBiXoaBo": soLuongHdonBiXoaBo,
    "tongTienThueNTe": tongTienThueNTe,
    "tongTienThueNTeStr": tongTienThueNTeStr,
    "counthdon": counthdon,
    "tongTienThueVNDStr": tongTienThueVndStr,
    "tongtienhangnte": tongtienhangnte,
    "tongtienhangvnd": tongtienhangvnd,
    "tongTienThue": tongTienThue,
  };
}
