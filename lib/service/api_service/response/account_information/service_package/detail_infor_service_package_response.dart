// To parse this JSON data, do
//
//     final detailInforServicePackageResponse = detailInforServicePackageResponseFromMap(jsonString);

import 'dart:convert';

class DetailInforServicePackageResponse {
  DetailInforServicePackageResponse({
    this.listPay,
    this.serviceCode,
  });

  List<ListPay> listPay;
  ServiceCode serviceCode;

  factory DetailInforServicePackageResponse.fromJson(String str) => DetailInforServicePackageResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailInforServicePackageResponse.fromMap(Map<String, dynamic> json) => DetailInforServicePackageResponse(
    listPay: List<ListPay>.from(json["listPay"].map((x) => ListPay.fromMap(x))),
    serviceCode: ServiceCode.fromMap(json["serviceCode"]),
  );

  Map<String, dynamic> toMap() => {
    "listPay": List<dynamic>.from(listPay.map((x) => x.toMap())),
    "serviceCode": serviceCode.toMap(),
  };
}

class ListPay {
  ListPay({
    this.customerId,
    this.customerName,
    this.acctNo,
    this.orgAmount,
    this.paymentAmount,
    this.paymentTime,
    this.paymentType,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.serviceCode,
    this.status,
    this.stt,
    this.paymentDesc,
    this.userId,
    this.paymentHistoryId,
    this.cardType,
    this.flagSystem,
    this.transId,
    this.integratAmount,
    this.exportAmount,
    this.rateIntegrat,
    this.totalRateIntegrat,
  });

  String customerId;
  String customerName;
  String acctNo;
  int orgAmount;
  int paymentAmount;
  int paymentTime;
  String paymentType;
  String createBy;
  int createTime;
  dynamic updateBy;
  int updateTime;
  String serviceCode;
  String status;
  int stt;
  dynamic paymentDesc;
  int userId;
  String paymentHistoryId;
  dynamic cardType;
  dynamic flagSystem;
  dynamic transId;
  dynamic integratAmount;
  dynamic exportAmount;
  dynamic rateIntegrat;
  dynamic totalRateIntegrat;

  factory ListPay.fromJson(String str) => ListPay.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListPay.fromMap(Map<String, dynamic> json) => ListPay(
    customerId: json["customerId"],
    customerName: json["customerName"],
    acctNo: json["acctNo"],
    orgAmount: json["orgAmount"],
    paymentAmount: json["paymentAmount"],
    paymentTime: json["paymentTime"],
    paymentType: json["paymentType"],
    createBy: json["createBy"],
    createTime: json["createTime"],
    updateBy: json["updateBy"],
    updateTime: json["updateTime"],
    serviceCode: json["serviceCode"],
    status: json["status"],
    stt: json["stt"],
    paymentDesc: json["paymentDesc"],
    userId: json["userId"],
    paymentHistoryId: json["paymentHistoryId"],
    cardType: json["card_type"],
    flagSystem: json["flag_system"],
    transId: json["trans_id"],
    integratAmount: json["integrat_amount"],
    exportAmount: json["export_amount"],
    rateIntegrat: json["rate_integrat"],
    totalRateIntegrat: json["total_rate_integrat"],
  );

  Map<String, dynamic> toMap() => {
    "customerId": customerId,
    "customerName": customerName,
    "acctNo": acctNo,
    "orgAmount": orgAmount,
    "paymentAmount": paymentAmount,
    "paymentTime": paymentTime,
    "paymentType": paymentType,
    "createBy": createBy,
    "createTime": createTime,
    "updateBy": updateBy,
    "updateTime": updateTime,
    "serviceCode": serviceCode,
    "status": status,
    "stt": stt,
    "paymentDesc": paymentDesc,
    "userId": userId,
    "paymentHistoryId": paymentHistoryId,
    "card_type": cardType,
    "flag_system": flagSystem,
    "trans_id": transId,
    "integrat_amount": integratAmount,
    "export_amount": exportAmount,
    "rate_integrat": rateIntegrat,
    "total_rate_integrat": totalRateIntegrat,
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
  dynamic validatetime;
  dynamic expriredTime;
  dynamic fixAmountInvoce;
  dynamic customerId;
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
