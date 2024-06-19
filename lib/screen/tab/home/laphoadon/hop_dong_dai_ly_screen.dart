import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import '../../../init_view.dart';

class HopDongDaiLyScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final int type;
  final dynamic object;
  final String trangThai;
  HopDongDaiLyScreen({this.type, this.object, this.trangThai});

  @override
  State<StatefulWidget> createState() => _HopDongDaiLyScreenState();

}
class _HopDongDaiLyScreenState extends State<HopDongDaiLyScreen> with GetItStateMixin {

  TextEditingController mstController = TextEditingController();
  TextEditingController hdKinhTeController = TextEditingController();
  TextEditingController doanhNghiepKyController = TextEditingController();
  TextEditingController caNhanDaiLyController = TextEditingController();
  TextEditingController ngayKyController = TextEditingController();
  String errorNgayKy;
  ObjectHopdong objectHopdong;
  bool isTrangThai = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      objectHopdong = widget.object;
       mstController.text = objectHopdong.mst ?? objectHopdong.lenh;
       hdKinhTeController.text = objectHopdong.hdKinhTeSo ?? objectHopdong.dvDieuDong;
       doanhNghiepKyController.text = objectHopdong.doanhNghiepKy ?? objectHopdong.noiDung;
       caNhanDaiLyController.text = objectHopdong.tcCaNhan;
       ngayKyController.text = objectHopdong.ngayKy ?? objectHopdong.ngayDieuDong;
    }
    if(widget.trangThai != null){
      if(widget.trangThai == "NEWR"){
        isTrangThai = false;
      }else{
        isTrangThai = true;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: widget.type == 4 ? 'Căn cứ điều động' : 'Thông tin người mua', isShowBack: true, isShowHome: false, isCreate: false, isSave: true,
              onSave: (){
                if(widget.type == 3){
                  objectHopdong = ObjectHopdong(
                      mst: mstController.text,
                      doanhNghiepKy: doanhNghiepKyController.text,
                      hdKinhTeSo: hdKinhTeController.text,
                      tcCaNhan: caNhanDaiLyController.text,
                      ngayKy: ngayKyController.text
                  );
                }else{
                  objectHopdong = ObjectHopdong(
                    lenh: mstController.text,
                    noiDung: doanhNghiepKyController.text,
                    ngayDieuDong: ngayKyController.text,
                    dvDieuDong: doanhNghiepKyController.text,
                  );
                }
                Navigator.pop(context, objectHopdong);
              },
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: mstController,
                            hintText: widget.type == 3 ? "Mã số thuế": "Lệnh điều động số",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: hdKinhTeController,
                            hintText: widget.type == 3 ? "Hợp đồng kinh tế số" : "Người/Đơn vị điều động",
                          ),
                        ),
                        CalendarInput(
                          textDateController: ngayKyController,
                          haveBorder: true,
                          title: widget.type == 3 ? "Ngày ký": "Ngày điều động",
                          onClickChooseDate: (selectedDate){
                            if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                              setState(() {
                                errorNgayKy = "Ngày không hợp lệ";
                              });
                            } else {
                              setState(() {
                                errorNgayKy = null;
                                ngayKyController.text = selectedDate;
                              });
                            }
                          },
                          errorText: errorNgayKy,
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: doanhNghiepKyController,
                            hintText: widget.type == 3 ? "Đại diện doanh nghiệp ký" : "Nội dung điều động",
                          ),
                        ),
                        widget.type == 3 ?
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: caNhanDaiLyController,
                            hintText: "Tổ chức cá nhân đại lý",
                          ),
                        ) : Container(),
                      ],

                    ),
                  ],
                )
              ],
            ),
          ],
        )
    );
  }

}

class ObjectHopdong{

  String mst;
  String hdKinhTeSo;
  String ngayKy;
  String doanhNghiepKy;
  String tcCaNhan;

  String lenh;
  String dvDieuDong;
  String ngayDieuDong;
  String noiDung;

  ObjectHopdong({
    this.mst,
    this.hdKinhTeSo,
    this.ngayKy,
    this.doanhNghiepKy,
    this.tcCaNhan,
    this.lenh,
    this.dvDieuDong,
    this.ngayDieuDong,
    this.noiDung,

  });

  @override
  String toString() {
    return 'ObjectHopdong{mst: $mst, hdKinhTeSo: $hdKinhTeSo, ngayKy: $ngayKy, doanhNghiepKy: $doanhNghiepKy, tcCaNhan: $tcCaNhan, lenh: $lenh, dvDieuDong: $dvDieuDong, ngayDieuDong: $ngayDieuDong, noiDung: $noiDung}';
  }
}

