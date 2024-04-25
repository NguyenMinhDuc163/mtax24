import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/button_bottom_not_stack_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/data_search_widget.dart';
import 'package:mtax24/service/common/status_api.dart';

import '../../../../../init_view.dart';

class ReportUsageResultScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/ReportUsageReportResultScreen";
  final String message;
  ReportUsageResultScreen({Key key, this.message}) : super(key: key);

  @override
  _ReportUsageResultScreenState createState() => _ReportUsageResultScreenState();
}

class _ReportUsageResultScreenState extends State<ReportUsageResultScreen> with GetItStateMixin {

  var invoiceReportController = GetIt.I<InvoiceReportController>();

  @override
  Widget build(BuildContext context) {

    final represent = watchX((InvoiceReportModel x) => x.represent);
    final year = watchX((InvoiceReportModel x) => x.year);
    final time = watchX((InvoiceReportModel x) => x.time);
    final reportingPeriod = watchX((InvoiceReportModel x) => x.reportingPeriod);
    final fromDateUsageReport = watchX((InvoiceReportModel x) => x.fromDateUsageReport);
    final toDateUsageReport = watchX((InvoiceReportModel x) => x.toDateUsageReport);

    return Scaffold(
      // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_REPORT_USAGE_INVOICE),
      body: CustomerAppbarScreen(title: TitleFunction.TITLE_REPORT_USAGE_INVOICE, isShowHome: true, isShowBack: true,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height_24, horizontal: width_32),
              child: Column(
                children: [
                  DataSearchWidget(title: "Kỳ báo cáo", content: reportingPeriod),

                  DataSearchWidget(title: "Năm", content: year.text),

                  DataSearchWidget(title: reportingPeriod, content: time),

                  DataSearchWidget(title: "Người đại diện", content: represent.text),

                  // SearchDateWidget(
                  //   fromDate: fromDateUsageReport.text,
                  //   toDate: toDateUsageReport.text,
                  //   onSearchFunction: () {
                  //     Navigator.of(context).pop();
                  //   },
                  // ),

                  widget.message.isNotEmpty
                      ? Padding(
                    padding: EdgeInsets.only(top: height_70),
                    child: Text(widget.message, style: text50spBold700Red),
                  ) : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height_70),
                        child: Text("Vui lòng tài file excel để xem kết quả", style: text45spItalic,),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width_320),
                        child: ButtonBottomNotStackWidget(title: "Tải excel",
                          radius: 10,
                          isExcel: true,
                          onPressed: () {
                            invoiceReportController.getUsageReport(
                                context,
                                fromDate: fromDateUsageReport.text,
                                time: time,
                                toDate: toDateUsageReport.text,
                                reportingPeriod: reportingPeriod,
                                year: year.text,
                                represent: represent.text,
                                isReport: true
                            );
                          },),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class ReportUsageResultArguments {
  final String message;
  ReportUsageResultArguments({this.message});
}
