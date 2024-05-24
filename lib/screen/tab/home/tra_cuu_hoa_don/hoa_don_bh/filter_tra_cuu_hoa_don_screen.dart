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

class FilterTraCuuHoaDonScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String tuNgay;
  final String denNgay;


  FilterTraCuuHoaDonScreen({this.object, this.tuNgay, this.denNgay});

  @override
  State<StatefulWidget> createState() => _FilterTraCuuHoaDonScreenState();
}

class _FilterTraCuuHoaDonScreenState extends State<FilterTraCuuHoaDonScreen> with GetItStateMixin{

  TextEditingController soHoaDonController = TextEditingController();
  TextEditingController mauHoaDonController = TextEditingController();
  TextEditingController kyHieuHoaDonController = TextEditingController();
  TextEditingController mstNguoiMuaController = TextEditingController();
  TextEditingController emailNguoiMuaController = TextEditingController();
  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();
  String errorTuNgay, errorDenNgay;
  var dropLoaiHD, dropTinhChatTb, dropTrangThaiTb, dropTrangThaiGuiCQT;

  var controller = GetIt.I<ThongBaoController>();
  List<DanhMucHoaDonResponse> lstHoaDon = [];
  FilterTCHoaDon objectTB;

  String loaiHDId = "", tinhChatId ="", trangThaiId = "", trangThaiGuiCQT = "";

  List<String> lstLoaiHD = ["Tất cả"];
  List<String> lstTinhChatTB = [
    "Tất cả",
    "Hóa đơn gốc",
    "Hóa đơn thay thế",
    "Hóa đơn đã bị thay thế",
    "Hóa đơn điều chỉnh",
    "Hóa đơn đã bị điều chỉnh",
    "Hóa đơn đã bị xóa bỏ",
    "Hóa đơn đã bị điều chỉnh định danh",
    "Hóa đơn đã bị giải trình"
  ];
  List<String> lstTrangThaiTb = [
    "Tất cả",
    "Khởi tạo",
    "Đang chờ duyệt",
    "Chờ CQT phản hồi",
    "CQT từ chối",
    "Từ chối",
    "Thành công",
    "Đã hủy",
  ];

  List<String> lstTrangThaiGuiCQT = [
    "Tất cả",
    "Chưa gửi CQT",
    "Chờ CQT phản hồi",
    "Thành công",
    "CQT từ chối",
  ];

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
          soHoaDonController.text = objectTB.soHoaDon.isNotEmpty ? objectTB.soHoaDon : "";
          mauHoaDonController.text = objectTB.mauHoaDon.isNotEmpty ? objectTB.mauHoaDon : "";
          kyHieuHoaDonController.text = objectTB.kyHieuHoaDon.isNotEmpty ? objectTB.kyHieuHoaDon : "";
          mstNguoiMuaController.text = objectTB.mstNguoiMua.isNotEmpty ? objectTB.mstNguoiMua : "";
          emailNguoiMuaController.text = objectTB.emailNguoiMua.isNotEmpty ? objectTB.emailNguoiMua : "";
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
          dropTrangThaiGuiCQT = lstTrangThaiGuiCQT.first;
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
                                case "Hóa đơn gốc":
                                  tinhChatId = "01";
                                  break;
                                case "Hóa đơn thay thế":
                                  tinhChatId = "02";
                                  break;
                                case "Hóa đơn đã bị thay thế":
                                  tinhChatId = "03";
                                  break;
                                case "Hóa đơn điều chỉnh":
                                  tinhChatId = "04";
                                  break;
                                case "Hóa đơn đã bị điều chỉnh":
                                  tinhChatId = "05";
                                  break;
                                case "Hóa đơn đã bị xóa bỏ":
                                  tinhChatId = "06";
                                  break;
                                case "Hóa đơn đã bị điều chỉnh định danh":
                                  tinhChatId = "09";
                                  break;
                                case "Hóa đơn đã bị giải trình":
                                  tinhChatId = "13";
                                  break;
                              }
                            });
                          },
                          hint: "Tính chất hóa đơn",
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
                          hint: "Trạng thái hóa đơn",
                          itemsDropdown: lstTrangThaiTb,
                        ),

                        DropdownInput(
                          value: dropTrangThaiGuiCQT,
                          onChangedCustom: (String value){
                            setState(() {
                              dropTrangThaiGuiCQT = value;
                              switch(dropTrangThaiGuiCQT){
                                case "Tất cả":
                                  trangThaiGuiCQT = "";
                                  break;
                                case "Chưa gửi CQT":
                                  trangThaiGuiCQT = "00";
                                  break;
                                case "Chờ CQT phản hồi":
                                  trangThaiGuiCQT = "01";
                                  break;
                                case "Thành công":
                                  trangThaiGuiCQT = "03";
                                  break;
                                case "CQT từ chối":
                                  trangThaiGuiCQT = "02";
                                  break;
                              }
                            });
                          },
                          hint: "Trạng thái gửi CQT",
                          itemsDropdown: lstTrangThaiGuiCQT,
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
                                      if(errorTuNgay != null){
                                        Toast.showLongTop("Ngày không được lớn hơn ngày hiện tại");
                                      }
                                    }

                                    else {
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
                                      if(errorDenNgay != null){
                                        Toast.showLongTop("Ngày không được lớn hơn ngày hiện tại");
                                      }
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
                            hintText: "Số hóa đơn",
                            maxLength: 15,
                            textInputType: TextInputType.number
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: mauHoaDonController,
                            hintText: "Mẫu hóa đơn",
                            maxLength: 11,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: kyHieuHoaDonController,
                            hintText: "Ký hiệu hóa đơn",
                            maxLength: 8,
                            formats: [UpperCaseTextInputFormatter()],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: mstNguoiMuaController,
                            textInputType: TextInputType.number,
                            hintText: "MST người mua",
                            maxLength: 14,

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: emailNguoiMuaController,
                            hintText: "Email người mua",
                          ),
                        ),



                        ButtonBottomNotStackWidget(
                          title: "Tra cứu",
                          onPressed: (){
                            if(!Utils.compareDates(tuNgayController.text, denNgayController.text)){
                              Toast.showLongTop("Ngày bắt đầu không được lớn hơn ngày kết thúc");
                              return;
                            }
                            if(!Utils.validateMst(mstNguoiMuaController.text) ){
                              Toast.showLongTop("Mã số thuế sai cấu trúc!");
                              return;
                            }
                            objectTB = new FilterTCHoaDon(
                              tuNgay: tuNgayController.text,
                              denNgay: denNgayController.text,
                              loaiHdName: dropLoaiHD,
                              loaiHdID: loaiHDId,
                              tinhChatName: dropTinhChatTb,
                              tinhChatId: tinhChatId,
                              trangThaiTbName: dropTrangThaiTb,
                              trangThaiTbId: trangThaiId,
                              soHoaDon: soHoaDonController.text,
                              mauHoaDon: mauHoaDonController.text,
                              kyHieuHoaDon: kyHieuHoaDonController.text,
                              mstNguoiMua: mstNguoiMuaController.text,
                              emailNguoiMua: emailNguoiMuaController.text,
                              statusCQT: trangThaiGuiCQT,
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
  String statusCQT;

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
      this.emailNguoiMua,
      this.statusCQT,
  });
}
