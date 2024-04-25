import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import 'components/widget/init_widget.dart';
import 'components/widget/input_widget/text_input.dart';


class DangKyDichVuScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {

  @override
  _DangKyDichVuScreenState createState() =>
      _DangKyDichVuScreenState();
}

class _DangKyDichVuScreenState
    extends State<DangKyDichVuScreen> with GetItStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController mstController = TextEditingController();
  TextEditingController noiDungDKController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController diaChiController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Stack(
            children: [
              TabAppbarScreen(title: "", image: "assets/images/bg_forgot_password.png", isShowBack: true, isShowHome: false,
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding_40),
                    // padding: EdgeInsets.only(top: 40.h, left: 40.h, right: 40.h, bottom: 40.h),
                    child: Text("Đăng ký dịch vụ", textAlign: TextAlign.start, style: text20Bold500,),
                  ),

                  CardWidget(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: mstController,
                              hintText: "Mã số thuế",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: emailController,
                              hintText: "Email",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: noiDungDKController,
                              hintText: "Nội dung đăng ký",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: sdtController,
                              hintText: "Số điện thoại",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: fullNameController,
                              hintText: "Họ và tên",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40,),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: diaChiController,
                              hintText: "Địa chỉ ",
                            ),
                          ),

                          ButtonBottomNotStackWidget(title: "Đăng ký", onPressed: (){

                          })
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // loading ? LoadingWidget() : Container(),
            ],
          )



      ),
    );
  }
}
