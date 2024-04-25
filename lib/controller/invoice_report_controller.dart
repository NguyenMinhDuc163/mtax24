import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/base_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/usage_report/report_usage_report_result_screen.dart';
import 'package:mtax24/service/api_service/api_services.dart';
import 'package:mtax24/service/api_service/request/invoice_report/invoice_report_list_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/merchandise_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/money_kind_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/sold_report_list_request.dart';
import 'package:mtax24/service/api_service/response/base_response.dart';
import 'package:mtax24/service/api_service/response/invoice_report/invoice_report_list_response.dart';
import 'package:mtax24/service/api_service/response/invoice_report/sold_report_list_response.dart';
import 'package:mtax24/service/api_service/response/invoice_report/usage_report_response.dart';
import 'package:mtax24/service/common/status_api.dart';

class InvoiceReportController extends BaseController {

  final ApiServices apiServices;
  InvoiceReportController(this.apiServices);

  @override
  // TODO: implement model
  InvoiceReportModel get model => GetIt.I<InvoiceReportModel>();

  void getInvoiceReportList(BuildContext context, {@required DateTime fromDate, @required DateTime toDate, @required String kindInvoice, @required String propertyInvoice, @required String moneyKind, @required String tinBuyer, bool isReport}) {
    SharePreferUtils.getUserInfo().then((userInfo) {
      execute(() => apiServices.getInvoiceReportList(request: InvoiceReportListRequest(
          fromDate: DateFormat("dd/MM/yyyy").format(fromDate),
          fromDateShow: DateTime.parse(DateFormat("yyyy-MM-dd").format(fromDate)),
          hthuchdon: "-1",
          isReport: isReport != null && isReport ? "Y" : "N",
          kyHieuHDon: "",
          loaihdon: kindInvoice,
          matte: moneyKind == Constants.ALL ? "" : moneyKind,
          mauhdon: "",
          mstNban: userInfo.tin,
          mstNmua: tinBuyer,
          page: 1,
          sohdon: "",
          tinhChat: propertyInvoice,
          toDate: DateFormat("dd/MM/yyyy").format(toDate),
          toDateShow: DateTime.parse(DateFormat("yyyy-MM-dd").format(toDate)),
      )),
          onCompleted: (BaseResponse baseResponse) {
            if (baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
              List<Map<String, dynamic>> invoiceReportList = [];
              InvoiceReportListResponse invoiceReportListResponse = InvoiceReportListResponse.fromJson(baseResponse?.object);
              if(isReport != null && isReport) {
                Utils.saveAndOpenBase64ByExcel(invoiceReportListResponse.htmlContent.toString()).then((_) {
                  model.clearError();
                });
              } else {
                List invoiceReportListRequested = invoiceReportListResponse.listIccInvHdrReport;
                invoiceReportListRequested.forEach((element) {
                  invoiceReportList.add({
                    "Loại tiền": element.matte ?? "",
                    "Tổng số lượng hóa đơn": element.counthdon ?? "",
                    "Tổng tiền hàng trước thuế": Utils.formatCurrency(element.tongtienttoannte - element.tongTienThueNTe),
                    "Tổng tiền thuế": Utils.formatCurrency(element.tongTienThueNTe),
                    "Tổng tiền": Utils.formatCurrency(element.tongtienttoannte)
                  });
                });
                model.setInvoiceReportList(invoiceReportList: invoiceReportList);
              }
            } else {
              DialogAlert.showDialogAlertCancel(context, baseResponse.message.toString());
              model.setError(error: baseResponse.message, source: "getInvoiceReportList");
            }
      },
          source: "InvoiceReportController: getInvoiceReportList");
    });
  }

  void getMoneyKindList() {
    SharePreferUtils.getUserInfo().then((userInfo) {
      execute(() => apiServices.getMoneyKindList(request: MoneyKindRequest(
         loaiHDon: "",
          mstNban: userInfo.tin
      )), onCompleted: (BaseResponse baseResponse) {
            if (baseResponse.responseCode == StatusApi.MONEY_KIND_SUCCESS) {
              List<String> moneyKindList = [Constants.ALL];
              json.decode(baseResponse.object)["dmucTTe"].toList().forEach((e){
                moneyKindList.add(e);
              });
          model.setMoneyKindList(moneyKindList: moneyKindList);
            } else {
              model.setError(error: baseResponse.message, source: "getMoneyKindList");
            }
          },
          source: "InvoiceReportController: getMoneyKindList");
    });
  }

  void setInvoiceKind({@required String invoiceKind}) {
    model.setInvoiceKind(invoiceKind: invoiceKind);
  }

  void setInvoiceProperty({@required String invoiceProperty}) {
    model.setInvoiceProperty(invoiceProperty: invoiceProperty);
  }

  void setMoneyKind({@required String moneyKind}) {
    model.setMoneyKind(moneyKind: moneyKind);
  }

  void setFromDateReport({@required String fromDate}) {
    model.setFromDateReport(fromDate: fromDate);
  }

  void setToDateReport({@required String toDate}) {
    model.setToDateReport(toDate: toDate);
  }

  void resetDateReport() {
    model.resetDateReport();
  }

  void resetDataReport() {
    model.resetDataReport();
  }

  void getSoldReportList(BuildContext context, {@required DateTime fromDate, @required DateTime toDate, @required String tinBuyer, @required String invoiceProperty, @required String merchandise, bool isReport}) {
    SharePreferUtils.getUserInfo().then((userInfo) {
      execute(() => apiServices.getSoldReportList(request: SoldReportListRequest(
        fromDate: DateFormat("dd/MM/yyyy").format(fromDate),
        fromDateShow: DateTime.parse(DateFormat("yyyy-MM-dd").format(fromDate)),
        hanghoa: merchandise == Constants.ALL ? "" : merchandise,
        hthuchdon: "02",
        isReport: isReport != null && isReport ? "Y" : "N",
        mstNban: userInfo.tin,
        mstNmua: tinBuyer,
        page: 1,
        tinhChat: invoiceProperty,
        toDate: DateFormat("dd/MM/yyyy").format(toDate),
        toDateShow:  DateTime.parse(DateFormat("yyyy-MM-dd").format(toDate)),
      )),
          onCompleted: (BaseResponse baseResponse) {
            List<Map<String, dynamic>> soldReportList = [];
            if (baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
              SoldReportListResponse soldReportListResponse = SoldReportListResponse.fromJson(baseResponse.object);
              if(isReport != null && isReport) {
                Utils.saveAndOpenBase64ByExcel(soldReportListResponse.htmlContent.toString()).then((_) {
                  model.clearError();
                });
              } else {
                soldReportListResponse.lstTableSeller.forEach((element) {
                  soldReportList.add({
                    "Thuế suất": element.vat != "KCT" ? "Thuế suất " + element.vat + "%" : "Không chịu thuế GTGT",
                    "Doanh thu": Utils.formatCurrency(element.amountWithoutVatSum),
                    "Tổng tiền": Utils.formatCurrency(element.vatAmountSum),
                  });
                });
                model.setSeller(seller: soldReportListResponse.tseller);
                model.setSoldReportList(soldReportList: soldReportList);
                model.setListSeller(lstSeller: soldReportListResponse.lstTableSeller);
              }
            } else {
              model.setSeller(seller: Seller());
              model.setSoldReportList(soldReportList: soldReportList);
              DialogAlert.showDialogAlert(context, baseResponse.message.toString());
              model.setError(error: baseResponse.message, source: "getSoldReportList");
            }
          },
          source: "InvoiceReportController: getSoldReportList");
    });
  }

  void getMerchandiseNameList() {
    SharePreferUtils.getUserInfo().then((userInfo) {
      execute(() => apiServices.getMerchandiseList(request: MerchandiseRequest(
          taxCode: userInfo.tin
      )), onCompleted: (BaseResponse baseResponse) {
        if (baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
          List<String> merchandiseNameList = [Constants.ALL];
          json.decode(baseResponse.object).forEach((element) {
            merchandiseNameList.add(element["product_name"]);
          });
          model.setMerchandiseNameList(merchandiseNameList: merchandiseNameList);
        } else {
          model.setError(error: baseResponse.message, source: "getMoneyKindList");
        }
      }, source: "InvoiceReportController: getMerchandiseNameList");
    });
  }

  void setInvoicePropertyCreateReport({@required String invoicePropertyCreateReport}) {
    model.setInvoicePropertyCreateReport(invoicePropertyCreateReport: invoicePropertyCreateReport);
  }

  void setMerchandiseName({@required String merchandiseName}) {
    model.setMerchandiseName(merchandiseName: merchandiseName);
  }

  void setFromDateCreateReport({@required String fromDate}) {
    model.setFromDateCreateReport(fromDate: fromDate);
  }

  void setToDateCreateReport({@required String toDate}) {
    model.setToDateCreateReport(toDate: toDate);
  }

  void resetDateCreateReport() {
    model.resetDateCreateReport();
  }

  void resetDataCreateReport() {
    model.resetDataCreateReport();
  }

  void setFromDateUsageReport() {
    model.setFromDateUsageReport();
  }

  void setToDateUsageReport() {
    model.setToDateUsageReport();
  }

  void setRequiredRepresentUsageReport() {
    model.setRequiredRepresent();
  }

  void setReportingPeriod({@required String reportingPeriod}) {
    model.setReportingPeriod(reportingPeriod: reportingPeriod);
    model.setTime(time: "1");
    setFromDateUsageReport();
    setToDateUsageReport();
  }

  void setTypeTH({@required String type}) {
    model.setTypeTH(type: type);
  }

  void setLoaiHoaDon({@required String loaiHd}) {
    model.setLoaiHoaDon(loaiHD: loaiHd);
  }

  void setTime({@required String time}) {
    model.setTime(time: time);
    setFromDateUsageReport();
    setToDateUsageReport();
  }

  void resetDateUsageReport() {
    model.resetDateUsageReport();
  }

  void resetDataUsageReport() {
    model.resetDataUsageReport();
  }

  void getUsageReport(BuildContext context, {@required String fromDate, @required String toDate, @required String year, @required String represent, @required String reportingPeriod, @required String time, bool isReport}) {
    String reportingPeriodCode = reportingPeriod == "Quý" ? "quy" : "thang";
    SharePreferUtils.getUserInfo().then((userInfo) {
      Map<String, dynamic> request = {
        "taxCode": userInfo.tin,
        "fromDate": fromDate,
        "toDate": toDate,
        "bctheo": reportingPeriodCode,
        "nam": year,
        "nguoidaidien": represent,
        "quy": reportingPeriodCode == "quy" ? (reportingPeriodCode + time) : "",
        "thang": reportingPeriodCode == "thang" ? (reportingPeriodCode + time) : ""
      };

      if(isReport != null && isReport) {
        request["isReport"] = "Y";
        request["page"] = "1";
      } else {
        request["fromDateShow"] = fromDate;
        request["toDateShow"] = toDate;
      }

      execute(() => apiServices.getUsageReport(request: request), onCompleted: (BaseResponse baseResponse) {
        String message = "";
        if (baseResponse.responseCode == StatusApi.INVOICE_REPORT_SUCCESS) {
          UsageReportResponse usageReportResponse = UsageReportResponse.fromJson(baseResponse.object);
          if(isReport != null && isReport) {
            Utils.saveAndOpenBase64ByExcel(usageReportResponse.htmlContent.toString()).then((_) {
              model.clearError();
            });
          } else {
            model.setUsageReport(usageReport: usageReportResponse);
          }
        } else {
          message = baseResponse.message.toString();
          if(isReport != null && isReport) {
            DialogAlert.showDialogAlert(context, message);
          }
          model.setError(error: baseResponse.message, source: "getMoneyKindList");
        }
        if(isReport == null || isReport == false) {
          Navigator.of(context).pushNamed(ReportUsageResultScreen.routeName, arguments: ReportUsageResultArguments(message: message));
        }
      }, source: "InvoiceReportController: getMerchandiseNameList");
    });
  }
  
}