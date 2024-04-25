import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import '../../../init_view.dart';

class ThongTinVanChuyenScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  final dynamic object;
  final String trangThai;


  ThongTinVanChuyenScreen({this.object, this.trangThai});


  @override
  State<StatefulWidget> createState() => _ThongTinVanChuyenScreenState();

}
class _ThongTinVanChuyenScreenState extends State<ThongTinVanChuyenScreen> with GetItStateMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController hdSoController = TextEditingController();
  TextEditingController phuongTienController = TextEditingController();
  TextEditingController khoXuatController = TextEditingController();
  TextEditingController khoNhapController = TextEditingController();

  ThongTinVanChuyenModel vanChuyenModel;
  bool isTrangThai = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      vanChuyenModel = widget.object;
      nameController.text = vanChuyenModel.name;
      hdSoController.text = vanChuyenModel.hdSo;
      phuongTienController.text = vanChuyenModel.phuongTien;
      khoXuatController.text = vanChuyenModel.khoXuat;
      khoNhapController.text = vanChuyenModel.khoNhap;
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
            CustomerAppbarScreen(title: 'Thông tin người mua', isShowBack: true, isShowHome: false, isCreate: false, isSave: true,
              onSave: (){
                vanChuyenModel = ThongTinVanChuyenModel(
                  name: nameController.text,
                  hdSo: hdSoController.text,
                  phuongTien: phuongTienController.text,
                  khoXuat: khoXuatController.text,
                  khoNhap: khoNhapController.text,

                );
                Navigator.pop(context, vanChuyenModel);
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
                            textEditingController: nameController,
                            hintText: "Tên người vân chuyển",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: hdSoController,
                            hintText: "Hợp đồng số",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: phuongTienController,
                            hintText: "Phương tiện vận chuyển",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: khoXuatController,
                            hintText: "Kho xuất",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: khoNhapController,
                            hintText: "Kho nhập",
                          ),
                        ),
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

class ThongTinVanChuyenModel{
  String name;
  String hdSo;
  String phuongTien;
  String khoXuat;
  String khoNhap;

  ThongTinVanChuyenModel({
      this.name, this.hdSo, this.phuongTien, this.khoXuat, this.khoNhap});
}
