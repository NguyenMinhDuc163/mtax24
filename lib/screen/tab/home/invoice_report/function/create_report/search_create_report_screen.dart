import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/constants.dart';
import 'package:mtax24/screen/components/widget/button_bottom_not_stack_widget.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/screen/components/widget/invoice_report/select_date_widget.dart';
import 'package:mtax24/service/common/status_api.dart';

import '../../../../../init_view.dart';

class SearchCreateReportScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  static const String routeName = "/SearchCreateReportScreen";
  SearchCreateReportScreen({Key key}) : super(key: key);

  @override
  _SearchCreateReportScreenState createState() => _SearchCreateReportScreenState();
}

class _SearchCreateReportScreenState extends State<SearchCreateReportScreen> with GetItStateMixin {

  var invoiceReportController = GetIt.I<InvoiceReportController>();
  List<String> namesInvoiceProperty = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.invoicePropertyList.forEach((element) {
      namesInvoiceProperty.add(element["name"]);
    });
    invoiceReportController.getMerchandiseNameList();
  }


  @override
  Widget build(BuildContext context) {
    final invoicePropertyCreateReport = watchX((InvoiceReportModel x) => x.invoicePropertyCreateReport);
    final fromDateCreateReport = watchX((InvoiceReportModel x) => x.fromDateCreateReport);
    final toDateCreateReport = watchX((InvoiceReportModel x) => x.toDateCreateReport);
    final merchandiseNameList = watchX((InvoiceReportModel x) => x.merchandiseNameList);
    final merchandiseName = watchX((InvoiceReportModel x) => x.merchandiseName);
    final tinBuyerCreateReport = watchX((InvoiceReportModel x) => x.tinBuyerCreateReport);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE, showHome: true),
        body: CustomerAppbarScreen(title: TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE, isShowHome: true, isShowBack: true,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: width_32, vertical: height_32),
                child: Column(
                  children: [
                    TextInput(
                      textEditingController: tinBuyerCreateReport,
                      hintText: "Mã số thuế người mua",
                      haveBorder: true,
                    ),
                    DropDownDialog(
                      value: invoicePropertyCreateReport,
                      itemsDropdown: namesInvoiceProperty,
                      title: "Tính chất hóa đơn",
                      onChangedCustom: (_) {
                        invoiceReportController.setInvoicePropertyCreateReport(invoicePropertyCreateReport: _);
                      },
                    ),

                    DropDownDialog(
                      value: merchandiseName,
                      itemsDropdown: merchandiseNameList,
                      title: "Hàng hóa",
                      onChangedCustom: (_) {
                        invoiceReportController.setMerchandiseName(
                            merchandiseName: _);
                      },
                    ),

                    SelectDateWidget(
                        fromDateController: fromDateCreateReport,
                        toDateController: toDateCreateReport,
                        onFromDateSelect: (_) => invoiceReportController.setFromDateCreateReport(fromDate: _),
                        onToDateSelect: (_) => invoiceReportController.setToDateCreateReport(toDate: _)),

                    ButtonBottomNotStackWidget(
                      title: "Lập báo cáo",
                      onPressed: () {
                        invoiceReportController.getSoldReportList(
                            context,
                            fromDate: DateFormat('dd/MM/yyyy').parse(fromDateCreateReport.text),
                            toDate: DateFormat('dd/MM/yyyy').parse(toDateCreateReport.text),
                            tinBuyer: tinBuyerCreateReport.text,
                            invoiceProperty: Constants.invoicePropertyList[Constants.invoicePropertyList.indexWhere((element) =>  element["name"] == invoicePropertyCreateReport)]["key"],
                            merchandise: merchandiseName
                        );
                        Navigator.of(context).pop();
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
