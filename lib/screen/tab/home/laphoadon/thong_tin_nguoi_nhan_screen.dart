import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../components/widget/base_screen_appbar.dart';
import '../../../components/widget/card_widget.dart';
import '../../../components/widget/input_widget/text_input.dart';

class ThongTinNguoiNhanScreen extends StatefulWidget with GetItStatefulWidgetMixin {

  final dynamic object;
  final String trangThai;
   ThongTinNguoiNhanScreen({this.object, this.trangThai});

  @override
  State<ThongTinNguoiNhanScreen> createState() => _ThongTinNguoiNhanScreenState();
}

class _ThongTinNguoiNhanScreenState extends State<ThongTinNguoiNhanScreen> with GetItStateMixin{

  TextEditingController recipientIdController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController warehouseAddressControler = TextEditingController();

  ThongTinNguoiNhanModel nguoiNhanModel;
  bool isTrangThai = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      nguoiNhanModel = widget.object;
      recipientIdController.text = nguoiNhanModel.recipientId;
      taxCodeController.text = nguoiNhanModel.taxCode;
      nameController.text = nguoiNhanModel.name;
      unitController.text = nguoiNhanModel.unit;
      warehouseAddressControler.text = nguoiNhanModel.warehouseAddress;
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
    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Thông tin người nhận hàng', isShowBack: true, isShowHome: false, isCreate: false, isSave: true,
              onSave: (){
                ThongTinNguoiNhanModel nguoiNhanModel = ThongTinNguoiNhanModel(
                  recipientId: recipientIdController.text,
                  taxCode: taxCodeController.text,
                  name: nameController.text,
                  unit: unitController.text,
                  warehouseAddress: warehouseAddressControler.text,
                );
                Navigator.pop(context, nguoiNhanModel);
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
                            textEditingController: recipientIdController,
                            hintText: "Mã người nhận hàng",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: taxCodeController,
                            hintText: "MST người nhận hàng",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: nameController,
                            hintText: "Tên người nhận hàng",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: unitController,
                            hintText: "Tên đơn vị người nhận hàng",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: warehouseAddressControler,
                            hintText: "Địa chỉ kho nhận hàng",
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

class ThongTinNguoiNhanModel{
  String recipientId;
  String taxCode;
  String name;
  String unit;
  String warehouseAddress;

  ThongTinNguoiNhanModel({this.recipientId, this.taxCode, this.name, this.unit, this.warehouseAddress});
}