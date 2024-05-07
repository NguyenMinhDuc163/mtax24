import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/widget/base_screen_appbar.dart';
import 'package:mtax24/screen/components/widget/button_bottom_not_stack_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/data_search_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/report_list_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/search_date_widget.dart';
import 'package:mtax24/screen/components/widget/loading_widget.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/report/search_report_screen.dart';
import 'package:mtax24/service/common/status_api.dart';

class ReportScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/ReportScreen";
  ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> with GetItStateMixin {
  var invoiceReportController = GetIt.I<InvoiceReportController>();
  DateTime now = DateTime.now();
  String name = "";
  String tin = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharePreferUtils.getUserInfo().then((userInfo) {
      name = userInfo.fullName ?? "";
      tin = userInfo.tin ?? "";
    });
    invoiceReportController.resetDateReport();
    invoiceReportController.resetDataReport();
    invoiceReportController.getInvoiceReportList(context, fromDate: DateTime(now.year, now.month - 1, now.day), toDate: now, kindInvoice: "", propertyInvoice: "", moneyKind: "", tinBuyer: "");
  }

  @override
  Widget build(BuildContext context) {
    final invoiceReportList = watchX((InvoiceReportModel x) => x.invoiceReportList);
    final invoiceKind = watchX((InvoiceReportModel x) => x.invoiceKind);
    final invoiceProperty = watchX((InvoiceReportModel x) => x.invoicePropertyReport);
    final moneyKind = watchX((InvoiceReportModel x) => x.moneyKind);
    final fromDate = watchX((InvoiceReportModel x) => x.fromDateReport);
    final toDate = watchX((InvoiceReportModel x) => x.toDateReport);
    final tinBuyerReport = watchX((InvoiceReportModel x) => x.tinBuyerReport);
    final loading = watchX((InvoiceReportModel x) => x.loading);

    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_REPORT_INVOICE, showHome: true),
        body: CustomerAppbarScreen(title: TitleFunction.TITLE_REPORT_INVOICE, isShowHome: true, isShowBack: true,
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height_40, horizontal: width_32),
                    child: Column(
                      children: [
                        tinBuyerReport.text.isNotEmpty
                            ? DataSearchWidget(title: "Mã số thuế người mua", content: tinBuyerReport.text)
                            : Container(),

                        invoiceKind != Constants.ALL
                            ? DataSearchWidget(title: "Loại hóa đơn", content: invoiceKind)
                            : Container(),

                        invoiceProperty != Constants.ALL
                            ? DataSearchWidget(title: "Tính chất hóa đơn", content: invoiceProperty)
                            : Container(),

                        moneyKind != Constants.ALL
                            ? DataSearchWidget(title: "Loại tiền", content: moneyKind)
                            : Container(),

                        SearchDateWidget(
                            fromDate: fromDate.text,
                            toDate: toDate.text,
                            onSearchFunction: () {
                              Navigator.of(context).pushNamed(SearchReportScreen.routeName);
                            }
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: height_32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mã số thuế người bán:", style: text45spBold700),
                              Expanded(
                                  child: Text(tin, style: text45sp))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tên đơn vị bán: ", style: text45spBold700),
                              Expanded(
                                  child: Text(name, style: text45sp)
                              )
                            ],
                          ),
                        ),
                        ReportListWidget(reportList: invoiceReportList, loading: loading,),
                        invoiceReportList != null && invoiceReportList.isNotEmpty ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: width_320, vertical: height_32),
                          child: ButtonBottomNotStackWidget(title: "Tải excel", radius: 10, isExcel: true, onPressed: () {
                            invoiceReportController.getInvoiceReportList(
                                context,
                                fromDate: DateFormat('dd/MM/yyyy').parse(fromDate.text),
                                toDate: DateFormat('dd/MM/yyyy').parse(toDate.text),
                                kindInvoice: invoiceKind == Constants.ALL ? "" : invoiceKind,
                                propertyInvoice: invoiceProperty == Constants.ALL ? "" : invoiceProperty,
                                moneyKind: moneyKind,
                                tinBuyer: tinBuyerReport.text,
                                isReport: true
                            );

                          },),
                        ) : Container(),
                      ],
                    ),
                  ),
                  loading ? LoadingWidget() : Container(),
                ],
              ),
            ),
          ],
        )


    );
  }
}
