import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mtax24/model/base_model.dart';
import 'package:mtax24/screen/components/utils/constants.dart';
import 'package:mtax24/service/api_service/response/invoice_report/sold_report_list_response.dart';
import 'package:mtax24/service/api_service/response/invoice_report/usage_report_response.dart';

class InvoiceReportModel extends BaseModel {

  //report
  final ValueNotifier<List<Map<String, dynamic>>> invoiceReportList = ValueNotifier<List<Map<String, dynamic>>>([]);
  final ValueNotifier<List<String>> moneyKindList = ValueNotifier<List<String>>([]);
  final ValueNotifier<String> invoiceKind = ValueNotifier<String>(Constants.ALL);
  final ValueNotifier<String> invoicePropertyReport = ValueNotifier<String>(Constants.ALL);
  final ValueNotifier<String> moneyKind = ValueNotifier<String>(Constants.ALL);
  final ValueNotifier<TextEditingController> fromDateReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> toDateReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> tinBuyerReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> invoiceTemplate = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> invoiceSymbol = ValueNotifier<TextEditingController>(TextEditingController());

  //create report
  final ValueNotifier<List<Map<String, dynamic>>> soldReportList = ValueNotifier<List<Map<String, dynamic>>>([]);

  final ValueNotifier<List<Seller>> lstSeller = ValueNotifier<List<Seller>>([]);
  final ValueNotifier<Seller> seller = ValueNotifier<Seller>(Seller());
  final ValueNotifier<TextEditingController> fromDateCreateReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> toDateCreateReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> tinBuyerCreateReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<String> invoicePropertyCreateReport = ValueNotifier<String>(Constants.ALL);
  final ValueNotifier<String> merchandiseName = ValueNotifier<String>(Constants.ALL);
  final ValueNotifier<List<String>> merchandiseNameList = ValueNotifier<List<String>>([]);

  //usage report
  final ValueNotifier<TextEditingController> fromDateUsageReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> toDateUsageReport = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> represent = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> year = ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<bool> requiredRepresent = ValueNotifier<bool>(true);
  final ValueNotifier<String> reportingPeriod = ValueNotifier<String>("Tháng");
  final ValueNotifier<String> time = ValueNotifier<String>("1");
  final ValueNotifier<String> typeTH = ValueNotifier<String>("Lần đầu");
  final ValueNotifier<String> loaiHoaDon = ValueNotifier<String>(null);
  final ValueNotifier<String> invoiceType = ValueNotifier<String>(null);
  final ValueNotifier<UsageReportResponse> usageReportResponse = ValueNotifier<UsageReportResponse>(UsageReportResponse());

  void setInvoiceReportList({@required List<Map<String, dynamic>> invoiceReportList}) {
    this.invoiceReportList.value = invoiceReportList;
    clearError();
  }

  void setInvoiceKind({@required String invoiceKind}) {
    this.invoiceKind.value = invoiceKind;
    clearError();
  }

  void setInvoiceProperty({@required String invoiceProperty}) {
    this.invoicePropertyReport.value = invoiceProperty;
    clearError();
  }

  void setMoneyKind({@required String moneyKind}) {
    this.moneyKind.value = moneyKind;
    clearError();
  }

  void setMoneyKindList({@required List<String> moneyKindList}) {
    this.moneyKindList.value = moneyKindList;
    clearError();
  }

  void setFromDateReport({@required String fromDate}) {
    this.fromDateReport.value.text = fromDate;
    clearError();
  }



  void setToDateReport({@required String toDate}) {
    this.toDateReport.value.text = toDate;
    clearError();
  }
  void resetDateReport() {
    DateTime now = DateTime.now();
    this.fromDateReport.value.text = DateFormat("dd/MM/yyyy").format(DateTime(now.year, now.month - 1, now.day)).toString();
    this.toDateReport.value.text = DateFormat("dd/MM/yyyy").format(now).toString();
    clearError();
  }

  void resetDataReport() {
    this.invoiceKind.value = Constants.ALL;
    this.invoicePropertyReport.value = Constants.ALL;
    this.moneyKind.value = Constants.ALL;
    this.tinBuyerReport.value.text = "";
    this.invoiceSymbol.value.text = "";
    this.invoiceTemplate.value.text = "";
    clearError();
  }

  void setSoldReportList({@required List<Map<String, dynamic>> soldReportList}) {
    this.soldReportList.value = soldReportList;
    clearError();
  }

  void setFromDateCreateReport({@required String fromDate}) {
    this.fromDateCreateReport.value.text = fromDate;
    clearError();
  }

  void setToDateCreateReport({@required String toDate}) {
    this.toDateCreateReport.value.text = toDate;
    clearError();
  }

  void resetDateCreateReport() {
    DateTime now = DateTime.now();
    this.fromDateCreateReport.value.text = DateFormat("dd/MM/yyyy").format(DateTime(now.year, now.month - 1, now.day)).toString();
    this.toDateCreateReport.value.text = DateFormat("dd/MM/yyyy").format(now).toString();
    clearError();
  }

  void resetDataCreateReport() {
    this.invoicePropertyCreateReport.value = Constants.ALL;
    this.merchandiseName.value = Constants.ALL;
    this.tinBuyerCreateReport.value.text = "";
    this.invoiceType.value = Constants.ALL;

    clearError();
  }

  void setInvoicePropertyCreateReport({@required String invoicePropertyCreateReport}) {
    this.invoicePropertyCreateReport.value = invoicePropertyCreateReport;
    clearError();
  }

  void setSeller({@required Seller seller}) {
    this.seller.value = seller;
    clearError();
  }

  void setListSeller({@required List<Seller> lstSeller}) {
    this.lstSeller.value = lstSeller;
    clearError();
  }

  void setMerchandiseNameList({@required List<String> merchandiseNameList}) {
    this.merchandiseNameList.value = merchandiseNameList;
    clearError();
  }

  void setMerchandiseName({@required String merchandiseName}) {
    this.merchandiseName.value = merchandiseName;
    clearError();
  }

  void setFromDateUsageReport() {
    String month = "01";
    String ngay = "01";
    if(reportingPeriod.value == "Quý") {
      if(time.value == "2") {
        month = "04";
      } else if (time.value == "3") {
        month = "07";
      } else if (time.value == "4") {
        month = "10";
      }
    } else if (reportingPeriod.value == "Tháng") {
        month = time.value.length == 1 ? ("0" + time.value) : time.value;
    }else if(reportingPeriod.value == "Ngày"){
      var now = new DateTime.now();
      month = now.month.toString().length == 1 ? ("0" + now.month.toString()) : now.month.toString();
      ngay = now.day.toString().length == 1 ? ("0" + now.day.toString()) : now.day.toString();
    }
    this.fromDateUsageReport.value.text = ngay + "/" + month + '/' + year.value.text;
    clearError();
  }

  void setToDateUsageReport() {
    String date = "31";
    String month = "01";
    if(reportingPeriod.value == "Quý") {
      if(time.value == "1") {
        month = "03";
      } else if (time.value == "2") {
        date = "30";
        month = "06";
      } else if (time.value == "3") {
        date = "30";
        month = "09";
      } else if (time.value == "4") {
        date = "31";
        month = "12";
      }
    } else if (reportingPeriod.value == "Tháng") {
      switch(time.value) {
        case "2":
          int yearNumber = int.parse(year.value.text);
          date = (yearNumber % 400 == 0 || (yearNumber % 4 == 0 && yearNumber % 100 != 0)) ? "29" : "28";
          break;
        case "4":
          date = "30";
          break;
        case "6":
          date = "30";
          break;
        case "9":
          date = "30";
          break;
        case "11":
          date = "30";
          break;
        default:
          date = "31";
      }
      month = time.value.length == 1 ? "0" + time.value : time.value;
    }else if(reportingPeriod.value == "Ngày"){
      var now = new DateTime.now();
      month = now.month.toString().length == 1 ? ("0" + now.month.toString()) : now.month.toString();
      date = now.day.toString().length == 1 ? ("0" + now.day.toString()) : now.day.toString();
    }
    this.toDateUsageReport.value.text = date + '/' + month + '/' + year.value.text;
    clearError();
  }

  void setReportingPeriod({@required String reportingPeriod}) {
    this.reportingPeriod.value = reportingPeriod;
    clearError();
  }

  void setTypeTH({@required String type}) {
    this.typeTH.value = type;
    clearError();
  }
  void setLoaiHoaDon({@required String loaiHD}) {
    this.loaiHoaDon.value = loaiHD;
    clearError();
  }

  void setTime({@required String time}) {
    this.time.value = time;
    clearError();
  }

  void setRequiredRepresent() {
    if(this.represent.value.text.isEmpty) {
      this.requiredRepresent.value = true;
    } else {
      this.requiredRepresent.value = false;
    }
    clearError();
  }

  void setUsageReport({@required UsageReportResponse usageReport}) {
    this.usageReportResponse.value = usageReport;
    clearError();
  }

  void resetDateUsageReport() {
    this.fromDateUsageReport.value.text = "01/01/" + year.value.text;
    this.toDateUsageReport.value.text = "31/01/" + year.value.text;
    clearError();
  }

  void resetDataUsageReport() {
    this.represent.value.text = "";
    this.year.value.text = DateTime.now().year.toString();
    this.requiredRepresent.value = true;
    this.reportingPeriod.value = "Tháng";
    this.time.value = "1";
    clearError();
  }

  void setInvoiceType({String invoiceType}) {
    this.invoiceType.value = invoiceType;
    clearError();
  }

  void setInvoiceTemplate({@required String invoiceTemplate}) {
    this.invoiceTemplate.value.text = invoiceTemplate;
    clearError();
  }
  void setInvoiceSymbol({@required String invoiceSymbol}) {
    this.invoiceSymbol.value.text = invoiceSymbol;
    clearError();
  }

}