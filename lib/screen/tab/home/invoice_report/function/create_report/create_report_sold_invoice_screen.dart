import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/widget/init_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/data_search_widget.dart';
import 'package:mtax24/screen/components/widget/invoice_report/search_date_widget.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/create_report/search_create_report_screen.dart';
import 'package:mtax24/service/common/status_api.dart';

class CreateReportSoldInvoiceScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/CreateReportSoldInvoiceScreen";
  CreateReportSoldInvoiceScreen({Key key}) : super(key: key);

  @override
  _CreateReportSoldInvoiceScreenState createState() => _CreateReportSoldInvoiceScreenState();
}

class _CreateReportSoldInvoiceScreenState extends State<CreateReportSoldInvoiceScreen> with GetItStateMixin {

  var invoiceReportController = GetIt.I<InvoiceReportController>();
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceReportController.resetDateCreateReport();
    invoiceReportController.resetDataCreateReport();
    invoiceReportController.getSoldReportList(context, fromDate: DateTime(now.year, now.month - 1, now.day), toDate: now, tinBuyer: "", invoiceProperty: "", merchandise: "");
  }

  @override
  Widget build(BuildContext context) {
    final soldReportList = watchX((InvoiceReportModel x) => x.soldReportList);
    final lstSeller = watchX((InvoiceReportModel x) => x.lstSeller);
    final tinBuyerCreateReport = watchX((InvoiceReportModel x) => x.tinBuyerCreateReport);
    final invoicePropertyCreateReport = watchX((InvoiceReportModel x) => x.invoicePropertyCreateReport);
    final merchandiseName = watchX((InvoiceReportModel x) => x.merchandiseName);
    final seller = watchX((InvoiceReportModel x) => x.seller);
    final fromDateCreateReport = watchX((InvoiceReportModel x) => x.fromDateCreateReport);
    final toDateCreateReport = watchX((InvoiceReportModel x) => x.toDateCreateReport);
    final loading = watchX((InvoiceReportModel x) => x.loading);

    return Scaffold(
      // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE, showHome: true),
      body: Stack(
        children: [
          CustomerAppbarScreen(title: TitleFunction.TITLE_CREATE_REPORT_SOLD_INVOICE, isShowHome: true, isShowBack: true,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height_40, horizontal: width_32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          tinBuyerCreateReport.text.isNotEmpty
                              ? DataSearchWidget(title: "Mã số thuế người mua", content: tinBuyerCreateReport.text)
                              : Container(),

                          invoicePropertyCreateReport != Constants.ALL
                              ? DataSearchWidget(title: "Tính chất hóa đơn", content: invoicePropertyCreateReport)
                              : Container(),

                          merchandiseName != Constants.ALL
                              ? DataSearchWidget(title: "Hàng hóa", content: merchandiseName)
                              : Container(),

                          SearchDateWidget(
                            fromDate: fromDateCreateReport.text,
                            toDate: toDateCreateReport.text,
                            onSearchFunction: () {
                              Navigator.of(context).pushNamed(SearchCreateReportScreen.routeName);
                            },
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: height_40),
                          //   child: Container(
                          //       width: double.infinity,
                          //       child: Text("Đơn vị tính: VND", style: text45sp, textAlign: TextAlign.end,)),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_32),
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: Text("Thuế suất GTGT", style: text14OpacityBold400, textAlign: TextAlign.center,)),
                                Expanded(flex: 1, child: Text("Doanh thu trước thuế", style: text14OpacityBold400, textAlign: TextAlign.center,)),
                                Expanded(flex: 1, child: Text("Tồng tiền thuế GTGT", style: text14OpacityBold400, textAlign: TextAlign.center,)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              lstSeller != null && lstSeller.isNotEmpty ?
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: lstSeller.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: height_16),
                                      child: Container(
                                        // color: (index + 1) % 2 == 0 ? colorGrey.withOpacity(.3) : Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.all(height_16),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(flex: 1, child: Text(lstSeller[index].vat != "KCT" ? lstSeller[index].vat + "%" : "Không chịu thuế GTGT", style: text_action_font14, textAlign: TextAlign.start,)),
                                                  Expanded(flex: 1, child: Text(lstSeller[index].amountWithoutVatSum != null ? Utils.formatCurrency(lstSeller[index].amountWithoutVatSum) : "0.0" , style: text14Bold400, textAlign: TextAlign.center,)),
                                                  Expanded(flex: 1, child: Text(lstSeller[index].vatAmountSum != null ? Utils.formatCurrency(lstSeller[index].vatAmountSum) : "0.0", style: text14Bold400, textAlign: TextAlign.center,)),
                                                ],
                                              ),
                                              lstSeller.length - 1 == index ? Container() :
                                              Padding(
                                                padding: EdgeInsets.only(top: padding_32),
                                                child: Divider(height: 1,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              ) : Padding(
                                  padding: EdgeInsets.symmetric(vertical: height_120, horizontal: width_40),
                                  child: Text("Không có dữ liệu nào thỏa mãn điều kiện", style: text50spBold700Red, textAlign: TextAlign.center)),


                              // ReportListWidget(reportList: lstSeller, loading: loading,),

                            ],
                          ),
                        ],
                      ),
                    ),
                    soldReportList != null && soldReportList.isNotEmpty ? Column(
                      children: [
                        BottomView(context, "Tổng doanh thu hàng hóa, dịch vụ bán ra", Utils.formatCurrency(seller.tongtienttoanvnd ?? 0)),
                        Divider(height: 1,),
                        BottomView(context, "Tổng doanh thu hàng hóa, dịch vụ bán ra chịu thuế GTGT", Utils.formatCurrency(seller.tongtienttoanchuathue ?? 0)),
                        Divider(height: 1,),
                        BottomView(context, "Tổng số thuế GTGT của hàng hóa, dịch vụ bán ra", Utils.formatCurrency(seller.tongtienthuettoan ?? 0)),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width_320, vertical: height_32),
                          child: ButtonBottomNotStackWidget(
                            title: "Tải excel",
                            radius: 10,
                            isExcel: true,
                            onPressed: () {
                              invoiceReportController.getSoldReportList(
                                  context,
                                  fromDate: DateFormat('dd/MM/yyyy').parse(fromDateCreateReport.text),
                                  toDate: DateFormat('dd/MM/yyyy').parse(toDateCreateReport.text),
                                  tinBuyer: tinBuyerCreateReport.text,
                                  invoiceProperty: invoicePropertyCreateReport == Constants.ALL ? "" : invoicePropertyCreateReport,
                                  merchandise: merchandiseName,
                                  isReport: true
                              );
                            },
                          ),
                        ),
                      ],
                    ) : Container(),
                  ],
                ),
              ),
            ],
          ),
          loading ? LoadingWidget() : Container(),

        ],
      ),
    );
  }
  Widget BottomView(BuildContext context, String title, String name){

    return Container(
      padding: EdgeInsets.all(padding_40),
      color: colorF4FAFF,
      child: Row(
        children: [
          Expanded(child: Text(title, style: text14Bold400,)),
          Padding(
            padding: EdgeInsets.only(left: padding_24),
            child: Text(name, style: text16Bold600,),
          )
        ],
      ),
    );

  }
}

