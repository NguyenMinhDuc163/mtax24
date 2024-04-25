import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/tra_cuu_thong_bao_cqt_controller.dart';
import 'package:mtax24/model/tra_cuu_thong_bao_cqt_model.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/dmuc_thong_bao_cqt_response.dart';
import '../../../../init_view.dart';

class FilterThongBaoHDCQTScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String tuNgay;
  final String denNgay;


  FilterThongBaoHDCQTScreen({this.object, this.tuNgay, this.denNgay});

  @override
  State<StatefulWidget> createState() => _FilterThongBaoScreenState();
}

class _FilterThongBaoScreenState extends State<FilterThongBaoHDCQTScreen> with GetItStateMixin{

  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();
  String errorTuNgay, errorDenNgay, loaiTb = '';
  var dropLoaiTB ;
  List<String> lstLoaiTB = ["Tât cả"];

  List<DMucThongBaoCqtResponse> lstDMuc = [];

  var controller = GetIt.I<TraCuuThongBaoCQTController>();
  FilterObjectTBHDCQT objectTB;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tuNgayController.text = widget.tuNgay;
    denNgayController.text = widget.denNgay;

    controller.dMucThongBaoCQT();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((TraCuuThongBaoCQTModel x) => x.lstDMucThongBaoCQT, (context, List<DMucThongBaoCqtResponse> list, cancel) {
      if(list.isNotEmpty){
        lstDMuc = list;
        lstDMuc.forEach((element) {
          lstLoaiTB.add(element.mauso + ": " + element.tentbao);
        });
        if(widget.object != null){
          objectTB = widget.object;
          dropLoaiTB = objectTB.tenTb;
        }else {
          dropLoaiTB = lstLoaiTB.first;
        }
      }
    });
    final loading = watchX((TraCuuThongBaoCQTModel x) => x.loading);

    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Tra cứu thông báo', showHome: false ),
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Tra cứu thông báo', isShowBack: true, isShowHome: true,
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownInput(
                          value: dropLoaiTB,
                          onChangedCustom: (String value){
                            setState(() {
                              dropLoaiTB = value;
                              for(int i = 0; i< lstLoaiTB.length; i++){
                                if(i == 0){
                                  loaiTb = "";
                                }else if(dropLoaiTB == lstLoaiTB[i]){
                                  loaiTb = lstDMuc[i - 1].mauso;
                                }
                              }

                            });
                          },
                          hint: "Loại thông báo",
                          itemsDropdown: lstLoaiTB,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CalendarInput(
                                textDateController: tuNgayController,
                                haveBorder: true,
                                title: "Từ ngày",
                                onClickChooseDate: (selectedDate){
                                  setState(() {
                                    if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                      errorTuNgay = "Ngày không hợp lệ";
                                    } else {
                                      errorTuNgay = null;
                                      tuNgayController.text = selectedDate;
                                    }
                                  });

                                },
                                errorText: errorTuNgay,
                              ),
                            ),
                            SizedBox(width: 20.h,),
                            Expanded(
                              child: CalendarInput(
                                textDateController: denNgayController,
                                haveBorder: true,
                                title: "Đến ngày",
                                onClickChooseDate: (selectedDate){
                                  setState(() {
                                    if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                      errorDenNgay = "Ngày không hợp lệ";
                                    } else {
                                      errorDenNgay = null;
                                      denNgayController.text = selectedDate;
                                    }
                                  });
                                },
                                errorText: errorDenNgay,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        ButtonBottomNotStackWidget(
                            title: "Tra cứu",
                            onPressed: () {
                              objectTB = new FilterObjectTBHDCQT(
                                tuNgay: tuNgayController.text,
                                denNgay: denNgayController.text,
                                loaiTB: loaiTb,
                                tenTb: dropLoaiTB,
                              );
                              Navigator.pop(context, objectTB);
                            }
                        ),
                      ],

                    ),
                  ],
                )
              ],
            ),
            loading ? LoadingWidget() : Container(),
          ],
        )



    );
  }

}

class FilterObjectTBHDCQT{
  String loaiTB;
  String tuNgay;
  String denNgay;
  String tenTb;


  FilterObjectTBHDCQT({
      this.loaiTB,
      this.tenTb,
      this.tuNgay,
      this.denNgay});
}
