import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import '../../../init_view.dart';

class VersionScreen extends StatefulWidget {
  static const String routeName = "/VersionScreen";
  const VersionScreen({Key key}) : super(key: key);

  @override
  _VersionScreenState createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  bool isLogin = false;

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
            CustomerAppbarScreen(title: "Phiên bản", isShowBack: true, isShowHome: isLogin,
              isCreate: false, isSave: false,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height_32, horizontal: width_24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phiên bản Tax24 E-invoice: 1.5.0", style: text50spBold700,),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text("Tax24 eInvoice là ứng dụng trên thiết bị di động giúp khách hàng thực hiện xuất hóa đơn một cách nhanh chóng, mọi lúc, mọi nơi. Ứng dụng có thể chạy trên các thiết bị thông minh (smart phone, tablet với hệ điều hành iOS,Android...) có kết nối Internet.",
                              style: text45sp
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text("Các tính năng chính:", style: text45sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text(" - Tạo lập và quản lý hóa đơn bán hàng.", style: text45sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text(" - In và xuất hóa đơn gửi cho khách hàng thông qua nhiều kênh khác nhau.", style: text45sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text(" - Tra cứu hóa đơn theo các điều kiện tìm kiếm: Loại hóa đơn, Ngày hóa đơn, Số hóa đơn...", style: text45sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text(" - Hỗ trợ tạo lập và theo dõi báo cáo bán hàng.", style: text45sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height_24),
                          child: Text(" - Hỗ trợ thiết lập bảo mật bằng vân tay.", style: text45sp),
                        ),
                      ],
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
