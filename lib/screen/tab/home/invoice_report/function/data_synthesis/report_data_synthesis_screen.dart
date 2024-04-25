import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/bao_cao_tong_hop_hd_controller.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/controller/invoice_report_controller.dart';
import 'package:mtax24/model/bao_cao_tong_hop_hd_model.dart';
import 'package:mtax24/model/invoice_report_model.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/screen/components/widget/button_bottom_not_stack_widget.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart' as ti;
import 'package:mtax24/screen/components/widget/invoice_report/select_date_widget.dart';
import 'package:mtax24/screen/components/widget/loading_widget.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/data_synthesis/danh_sach_lap_bao_cao_th_screen.dart';
import 'package:mtax24/service/api_service/request/invoice_report/gui_bthdl_request.dart';
import 'package:mtax24/service/api_service/request/invoice_report/lap_bth_request.dart';
import 'package:mtax24/service/common/status_api.dart';
import 'package:mtax24/service/init.dart';

import '../../../../../init_view.dart';

class ReportDataSynthesisScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String routeName = "/ReportDataSynthesisScreen";
  ReportDataSynthesisScreen({Key key}) : super(key: key);

  @override
  _ReportDataSynthesisScreenState createState() => _ReportDataSynthesisScreenState();
}

class _ReportDataSynthesisScreenState extends State<ReportDataSynthesisScreen> with GetItStateMixin {

  TextEditingController lanThuContronller = TextEditingController();
  List<String> months = [];
  List<String> periods = [];
  List<String> lstDmuc = ["Chọn hóa đơn"];
  String loaiHoaDon = '', loaiTHDl = 'Lần đầu', thang = '1';
  String name = '', mst = '', kyDl = 'Tháng';
  var invoiceReportController = GetIt.I<InvoiceReportController>();
  var baoCaoTHController = GetIt.I<BaoCaoTongHopHDController>();
  List<ListBthdLieu> lstGuiBTH;
  List<DanhMucHoaDonResponse> lstDMucHD = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 1; i <= 12; i++) {
      months.add(i.toString());
    }
    for(int i = 1; i <= 4; i++) {
      periods.add(i.toString());
    }
    invoiceReportController.resetDataUsageReport();
    invoiceReportController.resetDateUsageReport();
    invoiceReportController.setLoaiHoaDon(loaiHd: lstDmuc.first);
    GetIt.I<LapHoaDonController>().getDMucHoaDon();
    SharePreferUtils.getUserInfo().then((value) {
      name = value.nick;
      mst = value.tin;
    });
  }

  @override
  Widget build(BuildContext context) {

    final fromDateUsageReport = watchX((InvoiceReportModel x) => x.fromDateUsageReport);
    final toDateUsageReport = watchX((InvoiceReportModel x) => x.toDateUsageReport);
    final represent = watchX((InvoiceReportModel x) => x.represent);
    final year = watchX((InvoiceReportModel x) => x.year);
    final time = watchX((InvoiceReportModel x) => x.time);
    final reportingPeriod = watchX((InvoiceReportModel x) => x.reportingPeriod);
    final typeTH = watchX((InvoiceReportModel x) => x.typeTH);
    final loaiHD = watchX((InvoiceReportModel x) => x.loaiHoaDon);

    registerHandler((BaoCaoTongHopHdModel x) => x.lstLapBTH, (context, List<ListBthdLieu> lst, cancel) {
      if(lst != null && lst.length > 0){
        lstGuiBTH = lst;
        print("reportingPeriod: $kyDl");
        LapHoaDonObject object = LapHoaDonObject(
            kyDl: kyDl,
            thang: thang,
            nam: year.text.toString(),
            loaiDL: loaiTHDl,
            lanThu: lanThuContronller.text.toString(),
            tenNN: name,
            mstNN: mst,
            tuNgay: fromDateUsageReport.text.toString(),
            denNgay: toDateUsageReport.text.toString()
        );

        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => DanhSachLapBaoCaoTHScreen(lstGuiBTH, object)));
      }else {
        DialogAlert.showDialogAlertCancel(context, "Không có dữ liệu báo cáo");
      }
    });

    registerHandler((LapHoaDonModel x) => x.dMucHoaDon, (context, List<DanhMucHoaDonResponse> lst, cancel) {
      if(lst.isNotEmpty){
        setState(() {
          lstDMucHD = lst;
          lstDMucHD.forEach((element) {
            lstDmuc.add(element.invoiceName);
          });
        });
      }
    });

    final loading = watchX((BaoCaoTongHopHdModel x) => x.loading);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: buildAppBarMenuCustom(context, TitleFunction.TITLE_REPORT_DATA_SYNTHESIS, showHome: true),
        body: Stack(
          children: [
            CustomerAppbarScreen(title: TitleFunction.TITLE_REPORT_DATA_SYNTHESIS, isShowHome: true, isShowBack: true,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height_24, horizontal: width_32),
                    child: Column(
                      children: [
                        DropDownDialog(
                          title: "Loại hóa đơn",
                          itemsDropdown:  lstDmuc,
                          onChangedCustom: (value) {
                            setState(() {
                              invoiceReportController.setLoaiHoaDon(loaiHd: value);
                              for(int i = 0; i < lstDmuc.length - 1; i++){
                                if(i == 0){
                                  loaiHoaDon = "";
                                }else if(value == lstDmuc[i]){
                                  loaiHoaDon = lstDMucHD[i - 1].invoiceCode;
                                }
                              }
                            });


                          },
                          value: loaiHD,
                        ),

                        DropDownDialog(
                          title: "Kỳ dữ liệu",
                          itemsDropdown: ["Tháng", "Quý", "Ngày"],
                          onChangedCustom: (value) {
                            invoiceReportController.setReportingPeriod(reportingPeriod: value);
                            kyDl = value;
                          },
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
                        reportingPeriod == "Ngày" ? Container() :
                        Padding(
                          padding: EdgeInsets.only(top: height_32),
                          child: DropDownDialog(
                            title: reportingPeriod,
                            itemsDropdown: reportingPeriod == "Tháng" ? months : periods,
                            value: time,
                            onChangedCustom: (value) {
                              invoiceReportController.setTime(time: value);
                              thang = value;
                            },
                          ),
                        ),

                        DropDownDialog(
                          title: "Loại tổng hợp dữ liệu",
                          itemsDropdown: ["Lần đầu", "Bổ sung", ],
                          onChangedCustom: (value) {
                            invoiceReportController.setTypeTH(type: value);
                            loaiTHDl = value;
                          },
                          value: typeTH,
                        ),
                        typeTH == "Bổ sung" ? Padding(
                          padding: EdgeInsets.only(top: height_40),
                          child: ti.TextInput(
                            haveBorder: true,
                            hintText: "Lần thứ",
                            textInputType: TextInputType.number,
                            textEditingController: lanThuContronller,

                          ),
                        ) : Container(),

                        SelectDateWidget(
                          fromDateController: fromDateUsageReport,
                          toDateController: toDateUsageReport,
                          onFromDateSelect: reportingPeriod == "Ngày" ? (selectedDate){
                            setState(() {
                              fromDateUsageReport.text = selectedDate;
                            });

                          } : null,
                          onToDateSelect: reportingPeriod == "Ngày" ? (selectedDate){
                            setState(() {
                              toDateUsageReport.text = selectedDate;
                            });
                          } : null,
                          canSelectDate: reportingPeriod == "Ngày" ? true : false,
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: height_40),
                          child: ti.TextInput(
                            haveBorder: true,
                            hintText: "Ghi chú",
                            textEditingController: represent,
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
                            }else if(loaiHoaDon == ""){
                              DialogAlert.showDialogAlertCancel(context, "Chọn một loại hóa đơn");
                            }else {
                              baoCaoTHController.lapBTH(LapBthRequest(
                                nam: year.text,
                                thang: reportingPeriod == "Tháng" ? time : "",
                                quy: reportingPeriod == "Quý" ? time : "",
                                ghiChu: represent.text,
                                bctheo: reportingPeriod == "Tháng" ? "T" : reportingPeriod == "Quý" ? "Q" : "N",
                                lanDau: typeTH == "Lần đầu" ? "1" : "0",
                                loaihoadon: loaiHoaDon,
                                boSung: lanThuContronller.text,
                                fromDate: fromDateUsageReport.text,
                                toDate: toDateUsageReport.text,
                              ));
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
            loading ? LoadingWidget() : Container(),
          ],
        )



      ),
    );
  }
}


class LapHoaDonObject{
  String kyDl;
  String thang;
  String nam;
  String loaiDL;
  String lanThu;
  String tenNN;
  String mstNN;
  String tuNgay;
  String denNgay;

  LapHoaDonObject({this.kyDl, this.thang, this.nam, this.loaiDL, this.lanThu,
      this.tenNN, this.mstNN, this.tuNgay, this.denNgay});
}