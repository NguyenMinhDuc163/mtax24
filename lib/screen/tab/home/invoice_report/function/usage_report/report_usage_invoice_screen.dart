import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/constants.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/screen/components/widget/button_bottom_not_stack_widget.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart' as ti;
import 'package:mtax24/screen/components/widget/invoice_report/select_date_widget.dart';
import 'package:mtax24/service/common/status_api.dart';

import '../../../../../init_view.dart';

class ReportUsageInvoiceScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/ReportUsageInvoiceScreen";
  ReportUsageInvoiceScreen({Key key}) : super(key: key);

  @override
  _ReportUsageInvoiceScreenState createState() => _ReportUsageInvoiceScreenState();
}

class _ReportUsageInvoiceScreenState extends State<ReportUsageInvoiceScreen> with GetItStateMixin {

  var invoiceReportController = GetIt.I<InvoiceReportController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceReportController.resetDataUsageReport();
    invoiceReportController.resetDateUsageReport();
  }

  @override
  Widget build(BuildContext context) {

    final fromDateUsageReport = watchX((InvoiceReportModel x) => x.fromDateUsageReport);
    final toDateUsageReport = watchX((InvoiceReportModel x) => x.toDateUsageReport);
    final requiredRepresent = watchX((InvoiceReportModel x) => x.requiredRepresent);
    final represent = watchX((InvoiceReportModel x) => x.represent);
    final year = watchX((InvoiceReportModel x) => x.year);
    final time = watchX((InvoiceReportModel x) => x.time);
    final reportingPeriod = watchX((InvoiceReportModel x) => x.reportingPeriod);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_REPORT_USAGE_INVOICE),
        body: CustomerAppbarScreen(title: TitleFunction.TITLE_REPORT_USAGE_INVOICE, isShowHome: true, isShowBack: true,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height_24, horizontal: width_32),
                child: Column(
                  children: [
                    DropDownDialog(
                      title: "Kỳ báo cáo",
                      itemsDropdown: ["Tháng", "Quý"],
                      onChangedCustom: (_) => invoiceReportController.setReportingPeriod(reportingPeriod: _),
                      value: reportingPeriod,
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: height_24),
                      child: ti.TextInput(
                        haveBorder: true,
                        maxLength: 4,
                        hintText: "Năm",
                        textInputType: TextInputType.number,
                        textEditingController: year,
                        formats: [
                          FilteringTextInputFormatter.deny(RegExp(r'[-. ,]'))
                        ],
                        onChangedCustom: (_) {
                          invoiceReportController.setFromDateUsageReport();
                          invoiceReportController.setToDateUsageReport();
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: height_32),
                      child: DropDownDialog(
                        title: reportingPeriod,
                        itemsDropdown: reportingPeriod == "Tháng" ? Constants.months : Constants.periods,
                        value: time,
                        onChangedCustom: (_) => invoiceReportController.setTime(time: _),
                      ),
                    ),

                    SelectDateWidget(
                      fromDateController: fromDateUsageReport,
                      toDateController: toDateUsageReport,
                      onFromDateSelect: null,
                      onToDateSelect: null,
                      canSelectDate: false,
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: height_40),
                      child: ti.TextInput(
                        haveBorder: true,
                        hintText: "Người đại diện",
                        textEditingController: represent,
                        isRequired: requiredRepresent,
                        onChangedCustom: (_) {
                          invoiceReportController.setRequiredRepresentUsageReport();
                        },
                      ),
                    ),

                    ButtonBottomNotStackWidget(
                      title: "Lập báo cáo",
                      onPressed: () {
                        if(year.text.length != 4) {
                          DialogAlert.showDialogAlert(context, "Năm không hợp lệ");
                        } else if (represent.text.isEmpty) {
                          DialogAlert.showDialogAlert(context, "Vui lòng nhập người đại diện");
                        } else {
                          invoiceReportController.getUsageReport(
                            context,
                            fromDate: fromDateUsageReport.text,
                            time: time,
                            toDate: toDateUsageReport.text,
                            reportingPeriod: reportingPeriod,
                            year: year.text,
                            represent: represent.text,
                          );
                        }
                      },
                      marginTop: height_70,
                      radius: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),



      ),
    );
  }
}
