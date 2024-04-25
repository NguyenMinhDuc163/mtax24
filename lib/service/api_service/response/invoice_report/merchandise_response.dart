import 'dart:convert';

class MerchandiseResponse {
  MerchandiseResponse({
    this.id,
    this.pInvoiceId,
    this.productCode,
    this.productName,
    this.unitCode,
    this.unit,
    this.unitAmount,
    this.unitAmountImport,
    this.unitPrice,
    this.vat,
    this.amountWithoutVat,
    this.vatAmount,
    this.amountWithVat,
    this.promotion,
    this.isincreaseitem,
    this.adjustmentAmount,
    this.originalData,
    this.discountMoney,
    this.taxMoney,
    this.salesPromotion,
    this.currencyCode,
    this.taxCode,
    this.status,
    this.lstIccInvOtherInfoDtl,
    this.label1,
    this.value1,
    this.label2,
    this.value2,
    this.label3,
    this.value3,
    this.label4,
    this.value4,
    this.label5,
    this.value5,
    this.monthAmount,
    this.numberCode,
    this.lePhi,
    this.stt,
  });

  int id;
  int pInvoiceId;
  dynamic productCode;
  String productName;
  dynamic unitCode;
  dynamic unit;
  dynamic unitAmount;
  dynamic unitAmountImport;
  dynamic unitPrice;
  String vat;
  dynamic amountWithoutVat;
  dynamic vatAmount;
  dynamic amountWithVat;
  dynamic promotion;
  dynamic isincreaseitem;
  dynamic adjustmentAmount;
  dynamic originalData;
  dynamic discountMoney;
  dynamic taxMoney;
  dynamic salesPromotion;
  dynamic currencyCode;
  dynamic taxCode;
  dynamic status;
  List<dynamic> lstIccInvOtherInfoDtl;
  dynamic label1;
  dynamic value1;
  dynamic label2;
  dynamic value2;
  dynamic label3;
  dynamic value3;
  dynamic label4;
  dynamic value4;
  dynamic label5;
  dynamic value5;
  dynamic monthAmount;
  dynamic numberCode;
  dynamic lePhi;
  int stt;

  factory MerchandiseResponse.fromJson(String str) => MerchandiseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MerchandiseResponse.fromMap(Map<String, dynamic> json) => MerchandiseResponse(
    id: json["id"],
    pInvoiceId: json["p_invoice_id"],
    productCode: json["product_code"],
    productName: json["product_name"],
    unitCode: json["unit_code"],
    unit: json["unit"],
    unitAmount: json["unit_amount"],
    unitAmountImport: json["unit_amount_import"],
    unitPrice: json["unit_price"],
    vat: json["vat"],
    amountWithoutVat: json["amount_without_vat"],
    vatAmount: json["vat_amount"],
    amountWithVat: json["amount_with_vat"],
    promotion: json["promotion"],
    isincreaseitem: json["isincreaseitem"],
    adjustmentAmount: json["adjustment_amount"],
    originalData: json["original_data"],
    discountMoney: json["discount_money"],
    taxMoney: json["tax_money"],
    salesPromotion: json["sales_promotion"],
    currencyCode: json["currencyCode"],
    taxCode: json["taxCode"],
    status: json["status"],
    lstIccInvOtherInfoDtl: List<dynamic>.from(json["lstIccInvOtherInfoDtl"].map((x) => x)),
    label1: json["label1"],
    value1: json["value1"],
    label2: json["label2"],
    value2: json["value2"],
    label3: json["label3"],
    value3: json["value3"],
    label4: json["label4"],
    value4: json["value4"],
    label5: json["label5"],
    value5: json["value5"],
    monthAmount: json["month_amount"],
    numberCode: json["number_code"],
    lePhi: json["lePhi"],
    stt: json["stt"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "p_invoice_id": pInvoiceId,
    "product_code": productCode,
    "product_name": productName,
    "unit_code": unitCode,
    "unit": unit,
    "unit_amount": unitAmount,
    "unit_amount_import": unitAmountImport,
    "unit_price": unitPrice,
    "vat": vat,
    "amount_without_vat": amountWithoutVat,
    "vat_amount": vatAmount,
    "amount_with_vat": amountWithVat,
    "promotion": promotion,
    "isincreaseitem": isincreaseitem,
    "adjustment_amount": adjustmentAmount,
    "original_data": originalData,
    "discount_money": discountMoney,
    "tax_money": taxMoney,
    "sales_promotion": salesPromotion,
    "currencyCode": currencyCode,
    "taxCode": taxCode,
    "status": status,
    "lstIccInvOtherInfoDtl": List<dynamic>.from(lstIccInvOtherInfoDtl.map((x) => x)),
    "label1": label1,
    "value1": value1,
    "label2": label2,
    "value2": value2,
    "label3": label3,
    "value3": value3,
    "label4": label4,
    "value4": value4,
    "label5": label5,
    "value5": value5,
    "month_amount": monthAmount,
    "number_code": numberCode,
    "lePhi": lePhi,
    "stt": stt,
  };
}
