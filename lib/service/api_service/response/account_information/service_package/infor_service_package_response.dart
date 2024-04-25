import 'dart:convert';

class InforServicePackageResponse {
  InforServicePackageResponse({
    this.serviceCode,
    this.status,
    this.trans,
  });

  ServiceCode serviceCode;
  String status;
  List<Tran> trans;

  factory InforServicePackageResponse.fromJson(String str) => InforServicePackageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InforServicePackageResponse.fromMap(Map<String, dynamic> json) => InforServicePackageResponse(
    serviceCode: ServiceCode.fromMap(json["serviceCode"]),
    status: json["status"],
    trans: List<Tran>.from(json["trans"].map((x) => Tran.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "serviceCode": serviceCode.toMap(),
    "status": status,
    "trans": List<dynamic>.from(trans.map((x) => x.toMap())),
  };
}

class ServiceCode {
  ServiceCode({
    this.servicecode,
    this.servicename,
    this.servicetype,
    this.amount,
    this.fixMonth,
    this.fixAmoutInvoice,
    this.groupIb,
    this.groupMb,
    this.status,
    this.maxInvoice,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.descr,
    this.hthuchdon,
    this.ngonngu,
    this.isApprove,
    this.cifno,
    this.validatetime,
    this.expriredTime,
    this.fixAmountInvoce,
    this.customerId,
    this.check,
    this.flagLienhe,
    this.openSms,
    this.flagKm,
    this.flagAmount,
    this.flagDate,
    this.flagBranch,
    this.flagService,
    this.minusAmountToken,
    this.hsm,
    this.amountInvoiceKm,
  });

  String servicecode;
  String servicename;
  String servicetype;
  int amount;
  dynamic fixMonth;
  dynamic fixAmoutInvoice;
  dynamic groupIb;
  dynamic groupMb;
  dynamic status;
  dynamic maxInvoice;
  dynamic createBy;
  dynamic createTime;
  dynamic updateBy;
  dynamic updateTime;
  dynamic descr;
  dynamic hthuchdon;
  dynamic ngonngu;
  dynamic isApprove;
  dynamic cifno;
  int validatetime;
  int expriredTime;
  int fixAmountInvoce;
  String customerId;
  dynamic check;
  dynamic flagLienhe;
  dynamic openSms;
  dynamic flagKm;
  dynamic flagAmount;
  dynamic flagDate;
  dynamic flagBranch;
  dynamic flagService;
  dynamic minusAmountToken;
  dynamic hsm;
  dynamic amountInvoiceKm;

  factory ServiceCode.fromJson(String str) => ServiceCode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCode.fromMap(Map<String, dynamic> json) => ServiceCode(
    servicecode: json["servicecode"],
    servicename: json["servicename"],
    servicetype: json["servicetype"],
    amount: json["amount"],
    fixMonth: json["fix_month"],
    fixAmoutInvoice: json["fix_amout_invoice"],
    groupIb: json["group_ib"],
    groupMb: json["group_mb"],
    status: json["status"],
    maxInvoice: json["max_invoice"],
    createBy: json["create_by"],
    createTime: json["create_time"],
    updateBy: json["update_by"],
    updateTime: json["update_time"],
    descr: json["descr"],
    hthuchdon: json["hthuchdon"],
    ngonngu: json["ngonngu"],
    isApprove: json["is_approve"],
    cifno: json["cifno"],
    validatetime: json["validatetime"],
    expriredTime: json["exprired_time"],
    fixAmountInvoce: json["fix_amount_invoce"],
    customerId: json["customerId"],
    check: json["check"],
    flagLienhe: json["flag_lienhe"],
    openSms: json["open_sms"],
    flagKm: json["flag_KM"],
    flagAmount: json["flag_amount"],
    flagDate: json["flag_date"],
    flagBranch: json["flagBranch"],
    flagService: json["flag_service"],
    minusAmountToken: json["minus_amount_token"],
    hsm: json["hsm"],
    amountInvoiceKm: json["amount_invoice_km"],
  );

  Map<String, dynamic> toMap() => {
    "servicecode": servicecode,
    "servicename": servicename,
    "servicetype": servicetype,
    "amount": amount,
    "fix_month": fixMonth,
    "fix_amout_invoice": fixAmoutInvoice,
    "group_ib": groupIb,
    "group_mb": groupMb,
    "status": status,
    "max_invoice": maxInvoice,
    "create_by": createBy,
    "create_time": createTime,
    "update_by": updateBy,
    "update_time": updateTime,
    "descr": descr,
    "hthuchdon": hthuchdon,
    "ngonngu": ngonngu,
    "is_approve": isApprove,
    "cifno": cifno,
    "validatetime": validatetime,
    "exprired_time": expriredTime,
    "fix_amount_invoce": fixAmountInvoce,
    "customerId": customerId,
    "check": check,
    "flag_lienhe": flagLienhe,
    "open_sms": openSms,
    "flag_KM": flagKm,
    "flag_amount": flagAmount,
    "flag_date": flagDate,
    "flagBranch": flagBranch,
    "flag_service": flagService,
    "minus_amount_token": minusAmountToken,
    "hsm": hsm,
    "amount_invoice_km": amountInvoiceKm,
  };
}

class Tran {
  Tran({
    this.customerid,
    this.custommername,
    this.acctno,
    this.servicecode,
    this.servicetype,
    this.sellerid,
    this.sellername,
    this.amount,
    this.createby,
    this.updateby,
    this.desc,
    this.status,
    this.monthAmount,
    this.hthuchdon,
    this.createTime,
    this.maGdich,
    this.flagSystem,
    this.paymentStatus,
    this.orgNo,
  });

  String customerid;
  dynamic custommername;
  String acctno;
  String servicecode;
  dynamic servicetype;
  dynamic sellerid;
  dynamic sellername;
  int amount;
  dynamic createby;
  dynamic updateby;
  dynamic desc;
  dynamic status;
  dynamic monthAmount;
  dynamic hthuchdon;
  int createTime;
  dynamic maGdich;
  dynamic flagSystem;
  dynamic paymentStatus;
  dynamic orgNo;

  factory Tran.fromJson(String str) => Tran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tran.fromMap(Map<String, dynamic> json) => Tran(
    customerid: json["customerid"],
    custommername: json["custommername"],
    acctno: json["acctno"],
    servicecode: json["servicecode"],
    servicetype: json["servicetype"],
    sellerid: json["sellerid"],
    sellername: json["sellername"],
    amount: json["amount"],
    createby: json["createby"],
    updateby: json["updateby"],
    desc: json["desc"],
    status: json["status"],
    monthAmount: json["month_amount"],
    hthuchdon: json["hthuchdon"],
    createTime: json["createTime"],
    maGdich: json["ma_gdich"],
    flagSystem: json["flag_system"],
    paymentStatus: json["payment_status"],
    orgNo: json["org_no"],
  );

  Map<String, dynamic> toMap() => {
    "customerid": customerid,
    "custommername": custommername,
    "acctno": acctno,
    "servicecode": servicecode,
    "servicetype": servicetype,
    "sellerid": sellerid,
    "sellername": sellername,
    "amount": amount,
    "createby": createby,
    "updateby": updateby,
    "desc": desc,
    "status": status,
    "month_amount": monthAmount,
    "hthuchdon": hthuchdon,
    "createTime": createTime,
    "ma_gdich": maGdich,
    "flag_system": flagSystem,
    "payment_status": paymentStatus,
    "org_no": orgNo,
  };
}
