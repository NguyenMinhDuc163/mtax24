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

class SearchReportScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/SearchReportScreen";

  SearchReportScreen({Key key}) : super(key: key);

  @override
  _SearchReportScreenState createState() => _SearchReportScreenState();
}

class _SearchReportScreenState extends State<SearchReportScreen>
    with GetItStateMixin {

  var invoiceReportController = GetIt.I<InvoiceReportController>();
  List<String> namesInvoiceKind = [];
  List<String> namesInvoiceProperty = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.invoiceKindList.forEach((element) {
      namesInvoiceKind.add(element["name"]);
    });
    Constants.invoicePropertyList.forEach((element) {
      namesInvoiceProperty.add(element["name"]);
    });
    invoiceReportController.getMoneyKindList();
  }

  @override
  Widget build(BuildContext context) {
    final invoiceKind = watchX((InvoiceReportModel x) => x.invoiceKind);
    final invoiceProperty = watchX((InvoiceReportModel x) => x.invoicePropertyReport);
    final moneyKind = watchX((InvoiceReportModel x) => x.moneyKind);
    final moneyKindList = watchX((InvoiceReportModel x) => x.moneyKindList);
    final fromDate = watchX((InvoiceReportModel x) => x.fromDateReport);
    final toDate = watchX((InvoiceReportModel x) => x.toDateReport);
    final tinBuyerReport = watchX((InvoiceReportModel x) => x.tinBuyerReport);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_REPORT_INVOICE,
        //     showHome: true),
        body: CustomerAppbarScreen(title: TitleFunction.TITLE_REPORT_INVOICE, isShowHome: true, isShowBack: true,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: width_32, vertical: height_32),
                child: Column(
                  children: [
                    TextInput(
                      textEditingController: tinBuyerReport,
                      hintText: "Mã số thuế người mua",
                      haveBorder: true,
                      textInputType: TextInputType.numberWithOptions(signed: true, decimal: false),
                      maxLength: 14,
                    ),
                    DropDownDialog(
                      value: invoiceKind,
                      itemsDropdown: namesInvoiceKind,
                      title: "Loại hóa đơn",
                      onChangedCustom: (_) {
                        invoiceReportController.setInvoiceKind(invoiceKind: _);
                      },
                    ),
                    DropDownDialog(
                      value: invoiceProperty,
                      itemsDropdown: namesInvoiceProperty,
                      title: "Tính chất hóa đơn",
                      onChangedCustom: (_) {
                        invoiceReportController.setInvoiceProperty(
                            invoiceProperty: _);
                      },
                    ),
                    DropDownDialog(
                      value: moneyKind,
                      itemsDropdown: moneyKindList,
                      title: "Loại tiền",
                      onChangedCustom: (_) {
                        invoiceReportController.setMoneyKind(moneyKind: _);
                      },
                    ),

                    SelectDateWidget(
                        fromDateController: fromDate,
                        toDateController: toDate,
                        onFromDateSelect: (_) => invoiceReportController.setFromDateReport(fromDate: _),
                        onToDateSelect: (_) => invoiceReportController.setToDateReport(toDate: _)),

                    ButtonBottomNotStackWidget(
                      title: "Lập báo cáo",
                      onPressed: () {
                        if(!Utils.validateMst(tinBuyerReport.text) || tinBuyerReport.text == ''){
                          Toast.showLongTop("Mã số thuế sai cấu trúc!");
                          return;
                        }

                        invoiceReportController.getInvoiceReportList(
                            context,
                            fromDate: DateFormat('dd/MM/yyyy').parse(fromDate.text),
                            toDate: DateFormat('dd/MM/yyyy').parse(toDate.text),
                            kindInvoice: Constants.invoiceKindList[Constants.invoiceKindList.indexWhere((element) => element["name"] == invoiceKind)]["key"],
                            propertyInvoice: Constants.invoicePropertyList[Constants.invoicePropertyList.indexWhere((element) =>  element["name"] == invoiceProperty)]["key"],
                            moneyKind: moneyKind,
                            tinBuyer: tinBuyerReport.text
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
        )



      ),
    );
  }
}
