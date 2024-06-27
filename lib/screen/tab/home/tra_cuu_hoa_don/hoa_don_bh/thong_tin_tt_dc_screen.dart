import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/widget/home_back_ground.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/service/init.dart';

import '../../../../init_view.dart';

class ThongTinTTDCScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  final dynamic object;
  final String typeHD;
  final String sovban;
  final String ngayvb;
  final String lydo;
  final String adjustType;

  ThongTinTTDCScreen({this.object, this.typeHD, this.sovban, this.ngayvb, this.lydo, this.adjustType});


  @override
  State<StatefulWidget> createState() => _ThongTinVanChuyenScreenState();

}
class _ThongTinVanChuyenScreenState extends State<ThongTinTTDCScreen> with GetItStateMixin {

  TextEditingController hdDieuChinhController = TextEditingController();
  TextEditingController ngayHDController = TextEditingController();
  TextEditingController mauSoController = TextEditingController();
  TextEditingController kyHieuController = TextEditingController();
  TextEditingController soVanBanController = TextEditingController();
  TextEditingController lyDoController = TextEditingController();
  TextEditingController ngayKyVBController = TextEditingController();

  var hdDieuChinh = "Giảm";
  String errorDenNgay = '', errorNgayHD = '';
  TraCuuHdttResponse hdttResponse;
  TraCuuHddcResponse hddcResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('################### ${widget.ngayvb}');
    soVanBanController.text = (widget.sovban != null) ? widget.sovban : "";
    ngayKyVBController.text = (widget.ngayvb != null && widget.ngayvb != '') ? widget.ngayvb : '11/06/2024';
    lyDoController.text = (widget.lydo != null) ? widget.lydo : "";

    setState(() {
      ngayKyVBController.text = '11/06/2024';
    });

    if(widget.object != null){
      if(widget.typeHD == "HDTT"){
        // thay the
        hdttResponse = widget.object;

        setData(hdttResponse.sohdon,
            hdttResponse.ngayhdon != null ? Utils.convertTimestamp(hdttResponse.ngayhdon) : "",
            hdttResponse.mauhdon,
            hdttResponse.khieuhdon,
            hdttResponse.ngayvban);
      }else{
        // dieu chinh
        hddcResponse = widget.object;
        print("======hdttResponse: ${hddcResponse.toJson()}");
        hdDieuChinh = widget.adjustType ?? 'Giảm';
        setData(hddcResponse.sohdon,
            hddcResponse.ngayhdon != null ? Utils.convertTimestamp(hddcResponse.ngayhdon) : "",
            hddcResponse.mauhdon,
            hddcResponse.khieuhdon,
            (hddcResponse.ngayvbanStr != '') ? hddcResponse.ngayvbanStr :  widget.ngayvb);
      }

    }
  }

  void setData(String hd, String ngayHD, String mauSo, String kyHieu, String ngayVb){
    hdDieuChinhController.text = hd;
    ngayHDController.text = ngayHD;
    mauSoController.text = mauSo;
    kyHieuController.text = kyHieu;
    ngayKyVBController.text = ngayVb;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: buildAppBarMenuCustom(context, widget.typeHD == "HDTT" ? 'Thông tin thay thế' : "Thông tin điều chỉnh", isSave: true, onSave: (){
          if(widget.typeHD == "HDTT"){
            Navigator.pop(context, [soVanBanController.text.toString(), ngayKyVBController.text.toString()]);
          }else{
            if(lyDoController.text == ''){
              DialogAlert.showDialogAlertCancel(context, 'Vui lòng nhập lý do điều chỉnh');
              return;
            }
            if(ngayKyVBController.text == null || ngayKyVBController.text == ''){
              DialogAlert.showDialogAlertCancel(context, 'Vui lòng chọn ngày ký văn bản');
              return;
            }
            Navigator.pop(context, [soVanBanController.text.toString(),ngayKyVBController.text.toString(),
              lyDoController.text.toString(), hdDieuChinh]);
          }
        }),
        body: Stack(
          children: [
            HomeBackGround(
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: true,
                            showCursor: false,
                            textEditingController: hdDieuChinhController,
                            hintText: widget.typeHD == "HDTT" ? "Hóa đơn thay thế cho hóa đơn" : "Hóa đơn điều chỉnh",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CalendarInput(
                            textDateController: ngayHDController,
                            haveBorder: true,
                            title: "Ngày hóa đơn",
                            onClickChooseDate: (selectedDate){
                              setState(() {
                                if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                  errorNgayHD = "Ngày không hợp lệ";
                                } else {
                                  errorNgayHD = null;
                                  ngayHDController.text = selectedDate;
                                }
                              });
                            },
                            canSelectDate: false,
                            // errorText: errorNgayHD,
                          ),


                          // TextInput(
                          //   haveBorder: true,
                          //   readOnly: true,
                          //   showCursor: false,
                          //   textEditingController: ngayHDController,
                          //   hintText: "Ngày hóa đơn",
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: true,
                            showCursor: false,
                            textEditingController: mauSoController,
                            hintText: "Mẫu số",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: true,
                            showCursor: false,
                            textEditingController: kyHieuController,
                            hintText: "Ký hiệu",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: soVanBanController,
                            hintText: "Số văn bản thỏa thuận",
                          ),
                        ),
                        widget.typeHD == "HDTT" ? Container() :
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: lyDoController,
                            hintText: "Lý do điều chỉnh",
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CalendarInput(
                            textDateController: ngayKyVBController,
                            haveBorder: true,
                            title: "Ngày ký văn bản",
                            onClickChooseDate: (selectedDate){
                              setState(() {
                                if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                  DialogAlert.showDialogAlertCancel(context, 'Ngày không hợp lệ');
                                  return;
                                } else {
                                  ngayKyVBController.text = selectedDate;
                                }
                              });
                            },
                            // errorText: errorDenNgay,
                          ),
                        ),

                        widget.typeHD == "HDTT" ? Container() :
                        DropdownInput(
                          value: hdDieuChinh,
                          onChangedCustom: (String value){
                            setState(() {
                              hdDieuChinh = value;
                            });
                          },
                          hint: "Hóa đơn điều chỉnh",
                          itemsDropdown: ["Giảm", "Tăng", "Điều chỉnh thông tin"],
                        ),
                      ],

                    ),
                  ],
                )
              ],
            )

          ],
        )
    );
  }

}

