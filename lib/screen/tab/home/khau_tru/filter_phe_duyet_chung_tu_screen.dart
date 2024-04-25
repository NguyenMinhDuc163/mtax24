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

import '../../../init_view.dart';

class FilterPheDuyetChungTuScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String tuNgay;
  final String denNgay;


  FilterPheDuyetChungTuScreen({this.object, this.tuNgay, this.denNgay});

  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends State<FilterPheDuyetChungTuScreen> with GetItStateMixin{

  TextEditingController soHoaDonController = TextEditingController();
  TextEditingController mauHoaDonController = TextEditingController();
  TextEditingController kyHieuHoaDonController = TextEditingController();
  TextEditingController mstNguoiMuaController = TextEditingController();
  TextEditingController soCMNDController = TextEditingController();
  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();
  TextEditingController nguoiLapController = TextEditingController();
  String errorTuNgay, errorDenNgay;
  var dropLoaiHD, dropTrangThai;

  var controller = GetIt.I<ThongBaoController>();
  List<DanhMucHoaDonResponse> lstHoaDon = [];
  FilterTCHoaDon objectTB;

  String loaiHDId = "", tinhChatId ="", trangThaiId = "";

  List<String> lstLoaiHD = ["Chứng từ khâu trừ thuế thu nhập cá nhân"];
  List<String> lstTrangThai = ["Tất cả", "Khởi tạo", "Chờ phê duyệt", "Thành công", "Từ chối", "Đã hủy"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDMucHoaDon();
    tuNgayController.text = widget.tuNgay;
    denNgayController.text = widget.denNgay;
    dropLoaiHD = lstLoaiHD.first;
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
          soHoaDonController.text = objectTB.soHoaDon.isNotEmpty ? objectTB.soHoaDon : "";
          mauHoaDonController.text = objectTB.mauHoaDon.isNotEmpty ? objectTB.mauHoaDon : "";
          kyHieuHoaDonController.text = objectTB.kyHieuHoaDon.isNotEmpty ? objectTB.kyHieuHoaDon : "";
          mstNguoiMuaController.text = objectTB.mstNguoiMua.isNotEmpty ? objectTB.mstNguoiMua : "";
          soCMNDController.text = objectTB.emailNguoiMua.isNotEmpty ? objectTB.emailNguoiMua : "";
          dropLoaiHD = objectTB.loaiHdName.isNotEmpty ? objectTB.loaiHdName : "";

          loaiHDId = objectTB.loaiHdID;
          tinhChatId = objectTB.tinhChatId;
          trangThaiId = objectTB.trangThaiTbId;

        }
      }
    });
    final loading = watchX((ThongBaoModel x) => x.loading);

    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Tra cứu thông báo', showHome: false ),
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Tra cứu hóa đơn bán hàng', isShowBack: true, isShowHome: true,
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
                          hint: "Loại chứng từ",
                          itemsDropdown: lstLoaiHD,
                        ),
                        DropdownInput(
                          value: dropTrangThai,
                          onChangedCustom: (String value){
                            setState(() {
                            });
                          },
                          hint: "Trạng thái",
                          itemsDropdown: lstTrangThai,
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
                            SizedBox(width: 8,),
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
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: soHoaDonController,
                            hintText: "Số chứng từ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: mauHoaDonController,
                            hintText: "Mẫu chứng từ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: kyHieuHoaDonController,
                            hintText: "Ký hiệu chứng từ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: mstNguoiMuaController,
                            hintText: "Mst người nộp",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: soCMNDController,
                            hintText: "CMND/CCCD/Hộ chiếu",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: nguoiLapController,
                            hintText: "Người lập",
                          ),
                        ),



                        ButtonBottomNotStackWidget(
                          title: "Tra cứu",
                          onPressed: (){
                            objectTB = new FilterTCHoaDon(
                              tuNgay: tuNgayController.text,
                              denNgay: denNgayController.text,
                              loaiHdName: dropLoaiHD,
                              loaiHdID: loaiHDId,
                              tinhChatId: tinhChatId,
                              trangThaiTbId: trangThaiId,
                              soHoaDon: soHoaDonController.text,
                              mauHoaDon: mauHoaDonController.text,
                              kyHieuHoaDon: kyHieuHoaDonController.text,
                              mstNguoiMua: mstNguoiMuaController.text,
                              emailNguoiMua: soCMNDController.text,
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

class FilterTCHoaDon{
  String loaiHdID;
  String loaiHdName;
  String tinhChatId;
  String tinhChatName;
  String trangThaiTbId;
  String trangThaiTbName;
  String tuNgay;
  String denNgay;

  String soHoaDon;
  String mauHoaDon;
  String kyHieuHoaDon;
  String mstNguoiMua;
  String emailNguoiMua;

  FilterTCHoaDon({
      this.loaiHdID,
      this.loaiHdName,
      this.tinhChatId,
      this.tinhChatName,
      this.trangThaiTbId,
      this.trangThaiTbName,
      this.tuNgay,
      this.denNgay,
      this.soHoaDon,
      this.mauHoaDon,
      this.kyHieuHoaDon,
      this.mstNguoiMua,
      this.emailNguoiMua});
}
