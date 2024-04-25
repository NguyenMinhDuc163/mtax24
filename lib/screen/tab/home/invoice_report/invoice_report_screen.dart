import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/data_synthesis/report_data_synthesis_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/report/report_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/usage_report/report_usage_invoice_screen.dart';
import 'package:mtax24/service/common/status_api.dart';
import 'function/create_report/create_report_sold_invoice_screen.dart';

class InvoiceReportScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/InvoiceReportScreen";

  @override
  _InvoiceReportScreenState createState() => _InvoiceReportScreenState();
}

class _InvoiceReportScreenState extends State<InvoiceReportScreen> with GetItStateMixin{

  List<String> invoiceReportFunctionList = [
    TitleFunction.TITLE_REPORT_INVOICE,
    TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE,
    TitleFunction.TITLE_REPORT_USAGE_INVOICE,
    TitleFunction.TITLE_REPORT_DATA_SYNTHESIS
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorE5E5E5,
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              padding: EdgeInsets.all(padding_40),
              itemCount: invoiceReportFunctionList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: height_16),
                  child: InkWell(
                    onTap: () {
                      String routeName = "";
                      if(invoiceReportFunctionList[index] == TitleFunction.TITLE_REPORT_INVOICE) {
                        routeName = ReportScreen.routeName;
                      } else if (invoiceReportFunctionList[index] == TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE) {
                        routeName = CreateReportSoldInvoiceScreen.routeName;
                      } else if (invoiceReportFunctionList[index] == TitleFunction.TITLE_REPORT_USAGE_INVOICE) {
                        routeName = ReportUsageInvoiceScreen.routeName;
                      } else if(invoiceReportFunctionList[index] == TitleFunction.TITLE_REPORT_DATA_SYNTHESIS){
                        routeName = ReportDataSynthesisScreen.routeName;
                      }
                      Navigator.of(context).pushNamed(routeName);
                    },
                    child: Card(
                      elevation: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: colorE5E5E5),
                          borderRadius: BorderRadius.circular(radius_10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(padding_32),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(invoiceReportFunctionList[index], style: text45sp,)
                              ),
                              Icon(Icons.arrow_forward_ios, size: icon_50sp,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
