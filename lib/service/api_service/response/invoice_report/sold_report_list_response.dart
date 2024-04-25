import 'dart:convert';

class SoldReportListResponse {
  SoldReportListResponse({
    this.lstTableSeller,
    this.tseller,
    this.htmlContent,
  });

  List<Seller> lstTableSeller;
  Seller tseller;
  dynamic htmlContent;

  factory SoldReportListResponse.fromJson(String str) => SoldReportListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SoldReportListResponse.fromMap(Map<String, dynamic> json) => SoldReportListResponse(
    lstTableSeller: List<Seller>.from(json["lstTableSeller"].map((x) => Seller.fromMap(x))),
    tseller: Seller.fromMap(json["tseller"]),
    htmlContent: json["htmlContent"],
  );

  Map<String, dynamic> toMap() => {
    "lstTableSeller": List<dynamic>.from(lstTableSeller.map((x) => x.toMap())),
    "tseller": tseller.toMap(),
    "htmlContent": htmlContent,
  };
}

class Seller {
  Seller({
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
    this.lkdlieu,
    this.kdlieu,
  });

  dynamic stt;
  dynamic khieuhdon;
  dynamic mauhdon;
  dynamic sohdon;
  dynamic ngayhdonStr;
  dynamic ngayhdon;
  dynamic tennguoimua;
  dynamic mstnmua;
  dynamic mathang;
  dynamic tongtienchuatsuat;
  dynamic tongtientsuat;
  dynamic tongtienkchiutsuatvnd;
  dynamic tongthuenovat;
  dynamic tongtien0Vnd;
  dynamic tongthue0Vnd;
  dynamic tongtien5Vnd;
  dynamic tongthue5Vnd;
  dynamic tongtien10Vnd;
  dynamic tongthue10Vnd;
  dynamic amountWithoutVatSum;
  dynamic vatAmountSum;
  String vat;
  dynamic tongtienttoanchuathue;
  dynamic tongtienthuettoan;
  dynamic tendvinmua;
  dynamic tongtienttoanvnd;
  dynamic donvitinh;
  dynamic soluong;
  dynamic userXuat;
  dynamic userDuyet;
  dynamic acbranch;
  dynamic trnrefno;
  dynamic channelCode;
  dynamic maTTe;
  dynamic tongtienchuatsuatStr;
  dynamic tongtientsuatStr;
  dynamic tongtienttoanvndStr;
  dynamic ghiChu;
  dynamic lanDau;
  dynamic boSung;
  dynamic tongtiensauthue;
  dynamic loaihdon;
  dynamic tgia;
  String checkInChuyenDoi;
  dynamic maktra;
  dynamic mstNban;
  dynamic tongtienttoanbchu;
  dynamic tinhChat;
  dynamic dchinmua;
  dynamic lydotuchoi;
  dynamic lydoxoabo;
  dynamic tenhdon;
  dynamic productName;
  int pInvoiceId;
  dynamic unitPrice;
  dynamic unitAmount;
  dynamic discountMoney;
  dynamic unit;
  dynamic promotion;
  dynamic currencyCode;
  dynamic tongtienckhauvnd;
  dynamic maGdich;
  int pIccId;
  dynamic value;
  dynamic dvi;
  dynamic lable;
  dynamic lydoxuly;
  dynamic linkxacminh;
  dynamic corpName;
  dynamic dchinban;
  dynamic lkdlieu;
  dynamic kdlieu;

  factory Seller.fromJson(String str) => Seller.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Seller.fromMap(Map<String, dynamic> json) => Seller(
    stt: json["stt"],
    khieuhdon: json["khieuhdon"],
    mauhdon: json["mauhdon"],
    sohdon: json["sohdon"],
    ngayhdonStr: json["ngayhdonStr"],
    ngayhdon: json["ngayhdon"],
    tennguoimua: json["tennguoimua"],
    mstnmua: json["mstnmua"],
    mathang: json["mathang"],
    tongtienchuatsuat: json["tongtienchuatsuat"],
    tongtientsuat: json["tongtientsuat"],
    tongtienkchiutsuatvnd: json["tongtienkchiutsuatvnd"],
    tongthuenovat: json["tongthuenovat"],
    tongtien0Vnd: json["tongtien0vnd"] == null ? null : json["tongtien0vnd"].toDouble(),
    tongthue0Vnd: json["tongthue0vnd"] == null ? null : json["tongthue0vnd"],
    tongtien5Vnd: json["tongtien5vnd"] == null ? null : json["tongtien5vnd"],
    tongthue5Vnd: json["tongthue5vnd"] == null ? null : json["tongthue5vnd"].toDouble(),
    tongtien10Vnd: json["tongtien10vnd"] == null ? null : json["tongtien10vnd"],
    tongthue10Vnd: json["tongthue10vnd"] == null ? null : json["tongthue10vnd"].toDouble(),
    amountWithoutVatSum: json["amount_without_vat_sum"] == null ? null : json["amount_without_vat_sum"].toDouble(),
    vatAmountSum: json["vat_amount_sum"] == null ? null : json["vat_amount_sum"].toDouble(),
    vat: json["vat"] == null ? null : json["vat"],
    tongtienttoanchuathue: json["tongtienttoanchuathue"] == null ? null : json["tongtienttoanchuathue"].toDouble(),
    tongtienthuettoan: json["tongtienthuettoan"] == null ? null : json["tongtienthuettoan"].toDouble(),
    tendvinmua: json["tendvinmua"],
    tongtienttoanvnd: json["tongtienttoanvnd"] == null ? null : json["tongtienttoanvnd"].toDouble(),
    donvitinh: json["donvitinh"],
    soluong: json["soluong"],
    userXuat: json["userXuat"],
    userDuyet: json["userDuyet"],
    acbranch: json["acbranch"],
    trnrefno: json["trnrefno"],
    channelCode: json["channelCode"],
    maTTe: json["maTTe"],
    tongtienchuatsuatStr: json["tongtienchuatsuatStr"],
    tongtientsuatStr: json["tongtientsuatStr"],
    tongtienttoanvndStr: json["tongtienttoanvndStr"],
    ghiChu: json["ghiChu"],
    lanDau: json["lanDau"],
    boSung: json["boSung"],
    tongtiensauthue: json["tongtiensauthue"],
    loaihdon: json["loaihdon"],
    tgia: json["tgia"],
    checkInChuyenDoi: json["checkInChuyenDoi"],
    maktra: json["maktra"],
    mstNban: json["mstNban"],
    tongtienttoanbchu: json["tongtienttoanbchu"],
    tinhChat: json["tinhChat"],
    dchinmua: json["dchinmua"],
    lydotuchoi: json["lydotuchoi"],
    lydoxoabo: json["lydoxoabo"],
    tenhdon: json["tenhdon"],
    productName: json["productName"],
    pInvoiceId: json["p_invoice_id"],
    unitPrice: json["unit_price"],
    unitAmount: json["unit_amount"],
    discountMoney: json["discount_money"],
    unit: json["unit"],
    promotion: json["promotion"],
    currencyCode: json["currency_code"],
    tongtienckhauvnd: json["tongtienckhauvnd"],
    maGdich: json["ma_gdich"],
    pIccId: json["p_icc_id"],
    value: json["value"],
    dvi: json["dvi"],
    lable: json["lable"],
    lydoxuly: json["lydoxuly"],
    linkxacminh: json["linkxacminh"],
    corpName: json["corp_name"],
    dchinban: json["dchinban"],
    lkdlieu: json["lkdlieu"],
    kdlieu: json["kdlieu"],
  );

  Map<String, dynamic> toMap() => {
    "stt": stt,
    "khieuhdon": khieuhdon,
    "mauhdon": mauhdon,
    "sohdon": sohdon,
    "ngayhdonStr": ngayhdonStr,
    "ngayhdon": ngayhdon,
    "tennguoimua": tennguoimua,
    "mstnmua": mstnmua,
    "mathang": mathang,
    "tongtienchuatsuat": tongtienchuatsuat,
    "tongtientsuat": tongtientsuat,
    "tongtienkchiutsuatvnd": tongtienkchiutsuatvnd,
    "tongthuenovat": tongthuenovat,
    "tongtien0vnd": tongtien0Vnd == null ? null : tongtien0Vnd,
    "tongthue0vnd": tongthue0Vnd == null ? null : tongthue0Vnd,
    "tongtien5vnd": tongtien5Vnd == null ? null : tongtien5Vnd,
    "tongthue5vnd": tongthue5Vnd == null ? null : tongthue5Vnd,
    "tongtien10vnd": tongtien10Vnd == null ? null : tongtien10Vnd,
    "tongthue10vnd": tongthue10Vnd == null ? null : tongthue10Vnd,
    "amount_without_vat_sum": amountWithoutVatSum == null ? null : amountWithoutVatSum,
    "vat_amount_sum": vatAmountSum == null ? null : vatAmountSum,
    "vat": vat == null ? null : vat,
    "tongtienttoanchuathue": tongtienttoanchuathue == null ? null : tongtienttoanchuathue,
    "tongtienthuettoan": tongtienthuettoan == null ? null : tongtienthuettoan,
    "tendvinmua": tendvinmua,
    "tongtienttoanvnd": tongtienttoanvnd == null ? null : tongtienttoanvnd,
    "donvitinh": donvitinh,
    "soluong": soluong,
    "userXuat": userXuat,
    "userDuyet": userDuyet,
    "acbranch": acbranch,
    "trnrefno": trnrefno,
    "channelCode": channelCode,
    "maTTe": maTTe,
    "tongtienchuatsuatStr": tongtienchuatsuatStr,
    "tongtientsuatStr": tongtientsuatStr,
    "tongtienttoanvndStr": tongtienttoanvndStr,
    "ghiChu": ghiChu,
    "lanDau": lanDau,
    "boSung": boSung,
    "tongtiensauthue": tongtiensauthue,
    "loaihdon": loaihdon,
    "tgia": tgia,
    "checkInChuyenDoi": checkInChuyenDoi,
    "maktra": maktra,
    "mstNban": mstNban,
    "tongtienttoanbchu": tongtienttoanbchu,
    "tinhChat": tinhChat,
    "dchinmua": dchinmua,
    "lydotuchoi": lydotuchoi,
    "lydoxoabo": lydoxoabo,
    "tenhdon": tenhdon,
    "productName": productName,
    "p_invoice_id": pInvoiceId,
    "unit_price": unitPrice,
    "unit_amount": unitAmount,
    "discount_money": discountMoney,
    "unit": unit,
    "promotion": promotion,
    "currency_code": currencyCode,
    "tongtienckhauvnd": tongtienckhauvnd,
    "ma_gdich": maGdich,
    "p_icc_id": pIccId,
    "value": value,
    "dvi": dvi,
    "lable": lable,
    "lydoxuly": lydoxuly,
    "linkxacminh": linkxacminh,
    "corp_name": corpName,
    "dchinban": dchinban,
    "lkdlieu": lkdlieu,
    "kdlieu": kdlieu,
  };
}
