import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/utils/pdf_base64/create_invoice.dart';
import 'package:mtax24/screen/components/utils/pdf_base64/introduce_app.dart';
import 'package:mtax24/screen/components/utils/pdf_base64/login_setting.dart';
import 'package:mtax24/screen/components/utils/pdf_base64/report_invoice.dart';
import 'package:mtax24/screen/components/utils/pdf_base64/search_invoice.dart';

import '../../../init_view.dart';

class GuideUsageScreen extends StatefulWidget {
  static const String routeName = "/GuideUsageScreen";
  const GuideUsageScreen({Key key}) : super(key: key);

  @override
  _GuideUsageScreenState createState() => _GuideUsageScreenState();
}

class _GuideUsageScreenState extends State<GuideUsageScreen> {
  bool isLogin = false;
  List<String> functions = [
    "Giới thiệu ứng dụng",
    "Lập hóa đơn",
    "Tra cứu hóa đơn",
    "Báo cáo hóa đơn",
    "Cài đặt đăng nhập",
  ];


  @override
  void initState() {
    super.initState();
    getLoginInfo();
  }

  void getLoginInfo() async {
    String token = await SharePreferUtils.getAccessToken();
    if(token == null) return;
    if(token.isNotEmpty){
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: "Hướng dẫn sử dụng", isShowBack: true, isShowHome: isLogin,
              isCreate: false, isSave: false,
              children: [
                Container(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height_32, horizontal: width_24),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: functions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Card(
                                  elevation: 1.5,
                                  child: Padding(
                                    padding: EdgeInsets.all(height_50),
                                    child: InkWell(
                                      onTap: () {
                                        switch (functions[index]) {
                                          case "Giới thiệu ứng dụng":
                                            Utils.saveAndOpenBase64ByPDF(introduceAppPDFBase64, nameFile: "tax24_introduce");
                                            break;

                                          case "Lập hóa đơn":
                                            Utils.saveAndOpenBase64ByPDF(createInvoicePDFBase64, nameFile: "tax24_guide_create_invoice");
                                            break;

                                          case "Tra cứu hóa đơn":
                                            Utils.saveAndOpenBase64ByPDF(searchInvoicePDFBase64, nameFile: "tax24_guide_search_invoice");
                                            break;

                                          case "Báo cáo hóa đơn":
                                            Utils.saveAndOpenBase64ByPDF(reportInvoicePDFBase64, nameFile: "tax24_guide_report_invoice");
                                            break;

                                          case "Cài đặt đăng nhập":
                                            Utils.saveAndOpenBase64ByPDF(loginSettingPDFBase64, nameFile: "tax24_login_setting");
                                            break;

                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(functions[index], style: text50sp,),
                                          Icon(Icons.arrow_forward_ios, size: icon_40sp,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}
