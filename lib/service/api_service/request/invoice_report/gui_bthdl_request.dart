// To parse this JSON data, do
//
//     final guiBthdlRequest = guiBthdlRequestFromJson(jsonString);

import 'dart:convert';

GuiBthdlRequest guiBthdlRequestFromJson(String str) => GuiBthdlRequest.fromJson(json.decode(str));

String guiBthdlRequestToJson(GuiBthdlRequest data) => json.encode(data.toJson());

class GuiBthdlRequest {
  GuiBthdlRequest({
    this.listBthdLieu,
  });

  final List<ListBthdLieu> listBthdLieu;

  factory GuiBthdlRequest.fromJson(Map<String, dynamic> json) => GuiBthdlRequest(
    listBthdLieu: json["listBTHDLieu"] == null ? null : List<ListBthdLieu>.from(json["listBTHDLieu"].map((x) => ListBthdLieu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listBTHDLieu": listBthdLieu == null ? null : List<dynamic>.from(listBthdLieu.map((x) => x.toJson())),
  };
}

class ListBthdLieu {
  ListBthdLieu({
    this.stt,
    this.khieuhdon,
    this.mauhdon,
    this.sohdon,
    this.ngayhdonStr,
    this.ngayhdon,
    this.tennguoimua,
    this.mstnmua,
    this.mathang,
    this.tongtienchuatsuat,
    this.tongtientsuat,
    this.tongtienkchiutsuatvnd,
    this.tongthuenovat,
    this.tongtien0Vnd,
    this.tongthue0Vnd,
    this.tongtien5Vnd,
    this.tongthue5Vnd,
    this.tongtien10Vnd,
    this.tongthue10Vnd,
    this.tongtienmienthuevnd,
    this.tongthuemienthuevnd,
    this.tongtienthuekhacvnd,
    this.tongthuesuatkhacvnd,
    this.amountWithoutVatSum,
    this.vatAmountSum,
    this.vat,
    this.tongtienttoanchuathue,
    this.tongtienthuettoan,
    this.tendvinmua,
    this.tongtienttoanvnd,
    this.donvitinh,
    this.soluong,
    this.userXuat,
    this.userDuyet,
    this.acbranch,
    this.trnrefno,
    this.channelCode,
    this.maTTe,
    this.tongtienchuatsuatStr,
    this.tongtientsuatStr,
    this.tongtienttoanvndStr,
    this.ghiChu,
    this.lanDau,
    this.boSung,
    this.suaDoi,
    this.tongtiensauthue,
    this.loaihdon,
    this.tgia,
    this.checkInChuyenDoi,
    this.maktra,
    this.mstNban,
    this.tongtienttoanbchu,
    this.tinhChat,
    this.dchinmua,
    this.lydotuchoi,
    this.lydoxoabo,
    this.tenhdon,
    this.productName,
    this.pInvoiceId,
    this.unitPrice,
    this.unitAmount,
    this.discountMoney,
    this.unit,
    this.promotion,
    this.currencyCode,
    this.tongtienckhauvnd,
    this.maGdich,
    this.pIccId,
    this.value,
    this.dvi,
    this.lable,
    this.lydoxuly,
    this.linkxacminh,
    this.corpName,
    this.dchinban,
    this.maKhachHang,
    this.maHhoaDvu,
    this.trangthai,
    this.cdKhieuhdon,
    this.cdMauhdon,
    this.sohdongoc,
    this.sotbaocqt,
    this.ngaytbaocqt,
    this.hdonlquan,
    this.kdlieu,
    this.lkdlieu,
  });

  final dynamic stt;
  final String khieuhdon;
  final String mauhdon;
  final String sohdon;
  final dynamic ngayhdonStr;
  final int ngayhdon;
  final String tennguoimua;
  final String mstnmua;
  final String mathang;
  final dynamic tongtienchuatsuat;
  final dynamic tongtientsuat;
  final dynamic tongtienkchiutsuatvnd;
  final dynamic tongthuenovat;
  final dynamic tongtien0Vnd;
  final dynamic tongthue0Vnd;
  final dynamic tongtien5Vnd;
  final dynamic tongthue5Vnd;
  final dynamic tongtien10Vnd;
  final dynamic tongthue10Vnd;
  final dynamic tongtienmienthuevnd;
  final dynamic tongthuemienthuevnd;
  final dynamic tongtienthuekhacvnd;
  final dynamic tongthuesuatkhacvnd;
  final dynamic amountWithoutVatSum;
  final dynamic vatAmountSum;
  final String vat;
  final dynamic tongtienttoanchuathue;
  final dynamic tongtienthuettoan;
  final String tendvinmua;
  final dynamic tongtienttoanvnd;
  final String donvitinh;
  final String soluong;
  final dynamic userXuat;
  final dynamic userDuyet;
  final dynamic acbranch;
  final dynamic trnrefno;
  final dynamic channelCode;
  final String maTTe;
  final String tongtienchuatsuatStr;
  final String tongtientsuatStr;
  final String tongtienttoanvndStr;
  final String ghiChu;
  final String lanDau;
  final String boSung;
  final String suaDoi;
  final dynamic tongtiensauthue;
  final dynamic loaihdon;
  final dynamic tgia;
  final String checkInChuyenDoi;
  final dynamic maktra;
  final dynamic mstNban;
  final dynamic tongtienttoanbchu;
  final String tinhChat;
  final dynamic dchinmua;
  final dynamic lydotuchoi;
  final dynamic lydoxoabo;
  final dynamic tenhdon;
  final dynamic productName;
  final int pInvoiceId;
  final dynamic unitPrice;
  final dynamic unitAmount;
  final dynamic discountMoney;
  final dynamic unit;
  final dynamic promotion;
  final dynamic currencyCode;
  final dynamic tongtienckhauvnd;
  final dynamic maGdich;
  final int pIccId;
  final dynamic value;
  final dynamic dvi;
  final dynamic lable;
  final dynamic lydoxuly;
  final dynamic linkxacminh;
  final dynamic corpName;
  final dynamic dchinban;
  final dynamic maKhachHang;
  final dynamic maHhoaDvu;
  final String trangthai;
  final String cdKhieuhdon;
  final String cdMauhdon;
  final String sohdongoc;
  final dynamic sotbaocqt;
  final dynamic ngaytbaocqt;
  final dynamic hdonlquan;
  final String kdlieu;
  final String lkdlieu;

  factory ListBthdLieu.fromJson(Map<String, dynamic> json) => ListBthdLieu(
    stt: json["stt"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    ngayhdonStr: json["ngayhdonStr"],
    ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
    tennguoimua: json["tennguoimua"] == null ? null : json["tennguoimua"],
    mstnmua: json["mstnmua"] == null ? null : json["mstnmua"],
    mathang: json["mathang"] == null ? null : json["mathang"],
    tongtienchuatsuat: json["tongtienchuatsuat"],
    tongtientsuat: json["tongtientsuat"],
    tongtienkchiutsuatvnd: json["tongtienkchiutsuatvnd"],
    tongthuenovat: json["tongthuenovat"],
    tongtien0Vnd: json["tongtien0vnd"],
    tongthue0Vnd: json["tongthue0vnd"],
    tongtien5Vnd: json["tongtien5vnd"],
    tongthue5Vnd: json["tongthue5vnd"],
    tongtien10Vnd: json["tongtien10vnd"],
    tongthue10Vnd: json["tongthue10vnd"],
    tongtienmienthuevnd: json["tongtienmienthuevnd"],
    tongthuemienthuevnd: json["tongthuemienthuevnd"],
    tongtienthuekhacvnd: json["tongtienthuekhacvnd"],
    tongthuesuatkhacvnd: json["tongthuesuatkhacvnd"],
    amountWithoutVatSum: json["amount_without_vat_sum"],
    vatAmountSum: json["vat_amount_sum"],
    vat: json["vat"] == null ? null : json["vat"],
    tongtienttoanchuathue: json["tongtienttoanchuathue"],
    tongtienthuettoan: json["tongtienthuettoan"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    tongtienttoanvnd: json["tongtienttoanvnd"],
    donvitinh: json["donvitinh"] == null ? null : json["donvitinh"],
    soluong: json["soluong"] == null ? null : json["soluong"],
    userXuat: json["userXuat"],
    userDuyet: json["userDuyet"],
    acbranch: json["acbranch"],
    trnrefno: json["trnrefno"],
    channelCode: json["channelCode"],
    maTTe: json["maTTe"] == null ? null : json["maTTe"],
    tongtienchuatsuatStr: json["tongtienchuatsuatStr"] == null ? null : json["tongtienchuatsuatStr"],
    tongtientsuatStr: json["tongtientsuatStr"] == null ? null : json["tongtientsuatStr"],
    tongtienttoanvndStr: json["tongtienttoanvndStr"] == null ? null : json["tongtienttoanvndStr"],
    ghiChu: json["ghiChu"] == null ? null : json["ghiChu"],
    lanDau: json["lanDau"] == null ? null : json["lanDau"],
    boSung: json["boSung"] == null ? null : json["boSung"],
    suaDoi: json["suaDoi"] == null ? null : json["suaDoi"],
    tongtiensauthue: json["tongtiensauthue"],
    loaihdon: json["loaihdon"],
    tgia: json["tgia"],
    checkInChuyenDoi: json["checkInChuyenDoi"] == null ? null : json["checkInChuyenDoi"],
    maktra: json["maktra"],
    mstNban: json["mstNban"],
    tongtienttoanbchu: json["tongtienttoanbchu"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    dchinmua: json["dchinmua"],
    lydotuchoi: json["lydotuchoi"],
    lydoxoabo: json["lydoxoabo"],
    tenhdon: json["tenhdon"],
    productName: json["productName"],
    pInvoiceId: json["p_invoice_id"] == null ? null : json["p_invoice_id"],
    unitPrice: json["unit_price"],
    unitAmount: json["unit_amount"],
    discountMoney: json["discount_money"],
    unit: json["unit"],
    promotion: json["promotion"],
    currencyCode: json["currency_code"],
    tongtienckhauvnd: json["tongtienckhauvnd"],
    maGdich: json["ma_gdich"],
    pIccId: json["p_icc_id"] == null ? null : json["p_icc_id"],
    value: json["value"],
    dvi: json["dvi"],
    lable: json["lable"],
    lydoxuly: json["lydoxuly"],
    linkxacminh: json["linkxacminh"],
    corpName: json["corp_name"],
    dchinban: json["dchinban"],
    maKhachHang: json["maKhachHang"],
    maHhoaDvu: json["maHhoaDvu"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    sotbaocqt: json["sotbaocqt"],
    ngaytbaocqt: json["ngaytbaocqt"],
    hdonlquan: json["hdonlquan"],
    kdlieu: json["kdlieu"] == null ? null : json["kdlieu"],
    lkdlieu: json["lkdlieu"] == null ? null : json["lkdlieu"],
  );

  Map<String, dynamic> toJson() => {
    "stt": stt,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "sohdon": sohdon == null ? null : sohdon,
    "ngayhdonStr": ngayhdonStr,
    "ngayhdon": ngayhdon == null ? null : ngayhdon,
    "tennguoimua": tennguoimua == null ? null : tennguoimua,
    "mstnmua": mstnmua == null ? null : mstnmua,
    "mathang": mathang == null ? null : mathang,
    "tongtienchuatsuat": tongtienchuatsuat,
    "tongtientsuat": tongtientsuat,
    "tongtienkchiutsuatvnd": tongtienkchiutsuatvnd,
    "tongthuenovat": tongthuenovat,
    "tongtien0vnd": tongtien0Vnd,
    "tongthue0vnd": tongthue0Vnd,
    "tongtien5vnd": tongtien5Vnd,
    "tongthue5vnd": tongthue5Vnd,
    "tongtien10vnd": tongtien10Vnd,
    "tongthue10vnd": tongthue10Vnd,
    "tongtienmienthuevnd": tongtienmienthuevnd,
    "tongthuemienthuevnd": tongthuemienthuevnd,
    "tongtienthuekhacvnd": tongtienthuekhacvnd,
    "tongthuesuatkhacvnd": tongthuesuatkhacvnd,
    "amount_without_vat_sum": amountWithoutVatSum,
    "vat_amount_sum": vatAmountSum,
    "vat": vat == null ? null : vat,
    "tongtienttoanchuathue": tongtienttoanchuathue,
    "tongtienthuettoan": tongtienthuettoan,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "tongtienttoanvnd": tongtienttoanvnd,
    "donvitinh": donvitinh == null ? null : donvitinh,
    "soluong": soluong == null ? null : soluong,
    "userXuat": userXuat,
    "userDuyet": userDuyet,
    "acbranch": acbranch,
    "trnrefno": trnrefno,
    "channelCode": channelCode,
    "maTTe": maTTe == null ? null : maTTe,
    "tongtienchuatsuatStr": tongtienchuatsuatStr == null ? null : tongtienchuatsuatStr,
    "tongtientsuatStr": tongtientsuatStr == null ? null : tongtientsuatStr,
    "tongtienttoanvndStr": tongtienttoanvndStr == null ? null : tongtienttoanvndStr,
    "ghiChu": ghiChu == null ? null : ghiChu,
    "lanDau": lanDau == null ? null : lanDau,
    "boSung": boSung == null ? null : boSung,
    "suaDoi": suaDoi == null ? null : suaDoi,
    "tongtiensauthue": tongtiensauthue,
    "loaihdon": loaihdon,
    "tgia": tgia,
    "checkInChuyenDoi": checkInChuyenDoi == null ? null : checkInChuyenDoi,
    "maktra": maktra,
    "mstNban": mstNban,
    "tongtienttoanbchu": tongtienttoanbchu,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "dchinmua": dchinmua,
    "lydotuchoi": lydotuchoi,
    "lydoxoabo": lydoxoabo,
    "tenhdon": tenhdon,
    "productName": productName,
    "p_invoice_id": pInvoiceId == null ? null : pInvoiceId,
    "unit_price": unitPrice,
    "unit_amount": unitAmount,
    "discount_money": discountMoney,
    "unit": unit,
    "promotion": promotion,
    "currency_code": currencyCode,
    "tongtienckhauvnd": tongtienckhauvnd,
    "ma_gdich": maGdich,
    "p_icc_id": pIccId == null ? null : pIccId,
    "value": value,
    "dvi": dvi,
    "lable": lable,
    "lydoxuly": lydoxuly,
    "linkxacminh": linkxacminh,
    "corp_name": corpName,
    "dchinban": dchinban,
    "maKhachHang": maKhachHang,
    "maHhoaDvu": maHhoaDvu,
    "trangthai": trangthai == null ? null : trangthai,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "sotbaocqt": sotbaocqt,
    "ngaytbaocqt": ngaytbaocqt,
    "hdonlquan": hdonlquan,
    "kdlieu": kdlieu == null ? null : kdlieu,
    "lkdlieu": lkdlieu == null ? null : lkdlieu,
  };
}
