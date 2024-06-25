
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';

class FilterThongBaoScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String tuNgay;
  final String denNgay;


  FilterThongBaoScreen({this.object, this.tuNgay, this.denNgay});

  @override
  State<StatefulWidget> createState() => _FilterThongBaoScreenState();
}

class _FilterThongBaoScreenState extends State<FilterThongBaoScreen> with GetItStateMixin{

  TextEditingController soTbController = TextEditingController();
  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();
  String errorTuNgay, errorDenNgay;
  var dropLoaiHD, dropTinhChatTb, dropTrangThaiTb;

  var controller = GetIt.I<ThongBaoController>();
  List<DanhMucHoaDonResponse> lstHoaDon = [];
  FilterObjectTB objectTB;

  String loaiHDId = "", tinhChatId ="", trangThaiId = "";

  List<String> lstLoaiHD = ["Tất cả"];
  List<String> lstTinhChatTB = [
    "Tất cả",
    "Thông báo điều chỉnh định danh",
    "Thông báo xóa bỏ",
    "Thông báo điều chỉnh",
    "Thông báo thay thế",
    "Thông báo giải trình",
  ];
  List<String> lstTrangThaiTb = [
    "Tất cả",
    "Khởi tạo",
    "Đang chờ duyệt",
    "Chờ CQT phản hồi",
    "CQT từ chối",
    "Từ chối",
    "Thành công",
    "Đã hủy"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDMucHoaDon();
    tuNgayController.text = widget.tuNgay;
    denNgayController.text = widget.denNgay;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((ThongBaoModel x) => x.dMucHoaDon, (context, List<DanhMucHoaDonResponse> list, cancel) { 
      if(list.isNotEmpty){
        lstHoaDon = list;
        list.forEach((element) {
          lstLoaiHD.add(element.invoiceName);
        });
        if(widget.object != null){
          objectTB = widget.object;
          soTbController.text = objectTB.soTb.isNotEmpty ? objectTB.soTb : "";
          dropLoaiHD = objectTB.loaiHdName.isNotEmpty ? objectTB.loaiHdName : "";
          dropTinhChatTb = objectTB.tinhChatName.isNotEmpty ? objectTB.tinhChatName : "";
          dropTrangThaiTb = objectTB.trangThaiTbName.isNotEmpty ? objectTB.trangThaiTbName : "";

          loaiHDId = objectTB.loaiHdID;
          tinhChatId = objectTB.tinhChatId;
          trangThaiId = objectTB.trangThaiTbId;

        }else {
          dropLoaiHD = lstLoaiHD.first;
          dropTinhChatTb = lstTinhChatTB.first;
          dropTrangThaiTb = lstTrangThaiTb.first;
        }
      }
    });
    final loading = watchX((ThongBaoModel x) => x.loading);

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
                          value: dropLoaiHD,
                          onChangedCustom: (String value){
                            setState(() {
                              dropLoaiHD = value;
                              for(int i = 0; i< lstLoaiHD.length; i++){
                                if(i == 0){
                                  loaiHDId = "";
                                }else if(dropLoaiHD == lstLoaiHD[i]){
                                  loaiHDId = lstHoaDon[i - 1].invoiceCode;
                                }
                              }

                            });
                          },
                          hint: "Loại hóa đơn",
                          itemsDropdown: lstLoaiHD,
                        ),
                        DropdownInput(
                          value: dropTinhChatTb,
                          onChangedCustom: (String value){
                            setState(() {
                              dropTinhChatTb = value;
                              switch(dropTinhChatTb){
                                case "Tất cả":
                                  tinhChatId = "";
                                  break;
                                case "Thông báo điều chỉnh định danh":
                                  // tinhChatId = "10";
                                  tinhChatId = "13";
                                  break;
                                case "Thông báo xóa bỏ":
                                  tinhChatId = "07";
                                  break;
                                case "Thông báo điều chỉnh":
                                  // tinhChatId = "11";
                                  tinhChatId = "10";
                                  break;
                                case "Thông báo thay thế":
                                  // tinhChatId = "12";
                                  tinhChatId = "11";
                                  break;
                                case "Thông báo giải trình":
                                  // tinhChatId = "13";
                                  tinhChatId = "12";
                                  break;
                              }
                            });
                          },
                          hint: "Tính chất thông báo",
                          itemsDropdown: lstTinhChatTB,
                        ),
                        DropdownInput(
                          value: dropTrangThaiTb,
                          onChangedCustom: (String value){
                            setState(() {
                              dropTrangThaiTb = value;
                              switch(dropTrangThaiTb){
                                case "Tất cả":
                                  trangThaiId = "";
                                  break;
                                case "Khởi tạo":
                                  trangThaiId = "NEWR";
                                  break;
                                case "Đang chờ duyệt":
                                  trangThaiId = "CKNG";
                                  break;
                                case "Chờ CQT phản hồi":
                                  trangThaiId = "CCQT";
                                  break;
                                case "CQT từ chối":
                                  trangThaiId = "CQTT";
                                  break;
                                case "Từ chối":
                                  trangThaiId = "CKRJ";
                                  break;
                                case "Thành công":
                                  trangThaiId = "SUCC";
                                  break;
                                case "Đã hủy":
                                  trangThaiId = "DLTD";
                                  break;
                              }
                            });
                          },
                          hint: "Trang thái thông báo",
                          itemsDropdown: lstTrangThaiTb,
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20.h, ),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: soTbController,
                            hintText: "Số thông báo",
                          ),
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
                            SizedBox(width: 16.h,),
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
                            objectTB = new FilterObjectTB(
                                tuNgay: tuNgayController.text,
                                denNgay: denNgayController.text,
                                soTb: soTbController.text,
                                loaiHdName: dropLoaiHD,
                                loaiHdID: loaiHDId,
                                tinhChatName: dropTinhChatTb,
                                tinhChatId: tinhChatId,
                                trangThaiTbName: dropTrangThaiTb,
                                trangThaiTbId: trangThaiId
                            );

                            Navigator.pop(context, objectTB);
                          },
                        )
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

class FilterObjectTB{
  String loaiHdID;
  String loaiHdName;
  String tinhChatId;
  String tinhChatName;
  String trangThaiTbId;
  String trangThaiTbName;
  String soTb;
  String tuNgay;
  String denNgay;


  FilterObjectTB({
      this.loaiHdID,
      this.loaiHdName,
      this.tinhChatId,
      this.tinhChatName,
      this.trangThaiTbId,
      this.trangThaiTbName,
      this.soTb,
      this.tuNgay,
      this.denNgay});
}
