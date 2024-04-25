import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import 'components/widget/init_widget.dart';
import 'components/widget/input_widget/text_input.dart';


class ForgotPasswordScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {

  @override
  _ForgotPasswordScreenState createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> with GetItStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController mstController = TextEditingController();


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
              TabAppbarScreen(title: "", image: "assets/images/bg_dk_dich_vu.png", isShowBack: true, isShowHome: false,
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding_40),
                    child: Text("Quên mật khẩu", textAlign: TextAlign.start, style: text20Bold500,),
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
                              textEditingController: emailController,
                              hintText: "Địa chỉ email",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: padding_40, bottom: padding_40),
                            child: TextInput(
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: mstController,
                              hintText: "Mã số thuế",
                            ),
                          ),
                          
                          ButtonBottomNotStackWidget(title: "Gửi", onPressed: (){

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
