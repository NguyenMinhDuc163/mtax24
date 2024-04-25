import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';

class FilterTraCuuTongHopHDScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String tuNgay;
  final String denNgay;


  FilterTraCuuTongHopHDScreen({this.object, this.tuNgay, this.denNgay});

  @override
  State<StatefulWidget> createState() => _FilterThongBaoScreenState();
}

class _FilterThongBaoScreenState extends State<FilterTraCuuTongHopHDScreen> with GetItStateMixin{

  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();

  String errorTuNgay, errorDenNgay;
  var dropLoaiHD, dropTrangThai;

  var controller = GetIt.I<ThongBaoController>();
  TraCuuTongHopHDRequest request;

  String loaiHDId = "",  trangThaiId = "";

  List<String> lstLoaiHD = [
    "Tất cả",
    "Lần đầu",
    "Bổ sung"
  ];
  List<String> lstTrangThaiTB = [
    "Tất cả",
    "Chờ CQT phản hồi",
    "Thành công",
    "CQT từ chối"
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      request = widget.object;
      tuNgayController.text = request.fromDate;
      denNgayController.text = request.toDate;
      loaiHDId = request.loaitbao;
      trangThaiId = request.status;
      switch(request.loaitbao){
        case "1" :
          dropLoaiHD = lstLoaiHD[1].toString();

          break;
        case "0" :
          dropLoaiHD = lstLoaiHD[2].toString();
          break;
        default:
          dropLoaiHD = lstLoaiHD.first;
          break;
      }
      switch(request.status){
        case "CCQT" :
          dropTrangThai = lstTrangThaiTB[1].toString();
          break;
        case "SUCC" :
          dropTrangThai = lstTrangThaiTB[2].toString();
          break;
        case "CQTT" :
          dropTrangThai = lstTrangThaiTB[3].toString();
          break;
        default:
          dropTrangThai = lstTrangThaiTB.first;
          break;
      }

    }else {
      tuNgayController.text = widget.tuNgay;
      denNgayController.text = widget.denNgay;
      dropLoaiHD = lstLoaiHD.first;
      dropTrangThai = lstTrangThaiTB.first;
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final loading = watchX((ThongBaoModel x) => x.loading);

    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Tra cứu bảng tổng hợp dữ liệu hóa đơn', isShowBack: true, isShowHome: true,
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        DropdownInput(
                          value: dropLoaiHD,
                          onChangedCustom: (String value){
                            setState(() {
                              dropLoaiHD = value;
                              switch(dropLoaiHD){
                                case "Tất cả":
                                  loaiHDId = "";
                                  break;
                                case "Lần đầu":
                                  loaiHDId = "1";
                                  break;
                                case "Bổ sung":
                                  loaiHDId = "0";
                                  break;
                              }

                            });
                          },
                          hint: "Loại tổng hợp dữ liệu",
                          itemsDropdown: lstLoaiHD,
                        ),
                        DropdownInput(
                          value: dropTrangThai,
                          onChangedCustom: (String value){
                            setState(() {
                              dropTrangThai = value;
                              switch(dropTrangThai){
                                case "Tất cả":
                                  trangThaiId = "";
                                  break;
                                case "Chờ CQT phản hồi":
                                  trangThaiId = "CCQT";
                                  break;
                                case "Thành công":
                                  trangThaiId = "SUCC";
                                  break;
                                case "CQT từ chối":
                                  trangThaiId = "CQTT";
                                  break;
                              }
                            });
                          },
                          hint: "Trang thái",
                          itemsDropdown: lstTrangThaiTB,
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

                        ButtonBottomNotStackWidget(
                          title: "Tra cứu",
                          onPressed: (){
                            request = new TraCuuTongHopHDRequest(
                              loaitbao: loaiHDId,
                              fromDate: tuNgayController.text.toString(),
                              toDate: denNgayController.text.toString(),
                              status: trangThaiId,
                            );

                            Navigator.pop(context, request);
                          },
                        )
                      ],

                    ),
                  ],
                )
              ],
            ),

            // HomeBackGround(
            //   children: [
            //     CardWidget(
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //
            //             DropdownInput(
            //               value: dropLoaiHD,
            //               onChangedCustom: (String value){
            //                 setState(() {
            //                   dropLoaiHD = value;
            //                   switch(dropLoaiHD){
            //                     case "Tất cả":
            //                       loaiHDId = "";
            //                       break;
            //                     case "Lần đầu":
            //                       loaiHDId = "1";
            //                       break;
            //                     case "Bổ sung":
            //                       loaiHDId = "0";
            //                       break;
            //                   }
            //
            //                 });
            //               },
            //               hint: "Loại tổng hợp dữ liệu",
            //               itemsDropdown: lstLoaiHD,
            //             ),
            //             DropdownInput(
            //               value: dropTrangThai,
            //               onChangedCustom: (String value){
            //                 setState(() {
            //                   dropTrangThai = value;
            //                   switch(dropTrangThai){
            //                     case "Tất cả":
            //                       trangThaiId = "";
            //                       break;
            //                     case "Chờ CQT phản hồi":
            //                       trangThaiId = "CCQT";
            //                       break;
            //                     case "Thành công":
            //                       trangThaiId = "SUCC";
            //                       break;
            //                     case "CQT từ chối":
            //                       trangThaiId = "CQTT";
            //                       break;
            //                   }
            //                 });
            //               },
            //               hint: "Trang thái",
            //               itemsDropdown: lstTrangThaiTB,
            //             ),
            //
            //             Row(
            //               children: [
            //                 Expanded(
            //                   child: CalendarInput(
            //                     textDateController: tuNgayController,
            //                     haveBorder: true,
            //                     title: "Từ ngày",
            //                     onClickChooseDate: (selectedDate){
            //                       setState(() {
            //                         if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
            //                           errorTuNgay = "Ngày không hợp lệ";
            //                         } else {
            //                           errorTuNgay = null;
            //                           tuNgayController.text = selectedDate;
            //                         }
            //                       });
            //
            //                     },
            //                     errorText: errorTuNgay,
            //                   ),
            //                 ),
            //                 SizedBox(width: 20.h,),
            //                 Expanded(
            //                   child: CalendarInput(
            //                     textDateController: denNgayController,
            //                     haveBorder: true,
            //                     title: "Đến ngày",
            //                     onClickChooseDate: (selectedDate){
            //                       setState(() {
            //                         if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
            //                           errorDenNgay = "Ngày không hợp lệ";
            //                         } else {
            //                           errorDenNgay = null;
            //                           denNgayController.text = selectedDate;
            //                         }
            //                       });
            //                     },
            //                     errorText: errorDenNgay,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //
            //             ButtonBottomNotStackWidget(
            //               title: "Tra cứu",
            //               onPressed: (){
            //                 request = new TraCuuTongHopHDRequest(
            //                     loaitbao: loaiHDId,
            //                     fromDate: tuNgayController.text.toString(),
            //                     toDate: denNgayController.text.toString(),
            //                     status: trangThaiId,
            //                 );
            //
            //                 Navigator.pop(context, request);
            //               },
            //             )
            //           ],
            //
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            loading ? LoadingWidget() : Container(),
          ],
        )



    );
  }

}

