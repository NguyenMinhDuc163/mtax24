import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/service/init.dart';

import 'init_view.dart';
import 'tab/home/tab_home.dart';
import 'tab/thongbao/tab_thong_bao.dart';

class MenuPage extends StatefulWidget with GetItStatefulWidgetMixin {
  final int type;


  MenuPage({this.type});

  @override
  _MenuPageState createState() => _MenuPageState();
}

bool isHomeScreen = true;


class _MenuPageState extends State<MenuPage> with GetItStateMixin {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  var controller = GetIt.I<MenuHomeController>();
  // var menuPageController = GetIt.I<MenuPageController>();
  var accountInformationController = GetIt.I<AccountInformationController>();
  String title = "Trang chủ";
  int currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.type != null)
      currentIndex = widget.type;
    isHomeScreen = true;
    controller.getMenuHome();
    controller.getTinTuc(TinTucRequest(
        lang: "vi_VN"
    ));
  }

  Future<bool> _onBackPressed() {
    DialogAlert.logOut(context);
    return Future.value(true);
  }

  // void onBack(Widget interface) {
  //   String interfaceS = interface.toString();
  //   if(interfaceS == "TabHomeScreen" || interfaceS == "InformationAccountScreen") {
  //     DialogAlert.logOut(context);
  //   } else if (interfaceS == "InvoiceReportScreen") {
  //     menuPageController.setInterfaceMenuPage(0);
  //   } else {
  //     menuPageController.setInterfaceMenuPage(3);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _key,
        // appBar: buildAppBarMenuCustom(context, title,
        //     key: _key,
        //     showHome: page != 7 ? showHome : false,
        //     showBack: showBack,
        //     onBack: () {
        //       onBack(interface);
        //     },
        //     isSave: page == 7 ? true : false,
        //     onSave: () {
        //       if(page == 7) {
        //           accountInformationController.changePassword(context,
        //               oldPassword: oldPasswordController.text,
        //               newPassword: newPasswordController.text,
        //               reNewPassword: reNewPasswordController.text);
        //       }
        //     }
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.only(top: 0),
        //   child: isHomeScreen ? TabHomeScreen() : interface,
        // ),

        body: callPage(currentIndex),
        bottomNavigationBar: bottomNavBar(context, currentIndex),
      ),
    );
  }


  Widget bottomNavBar(BuildContext context, int page) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color_background,
          
          // boxShadow: [BoxShadow(
          //     color: color_background.withOpacity(0.6),
          //     offset: Offset(5,0),
          //     blurRadius: 5.0,
          //     spreadRadius: 0
          // )]
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height_16),
            
            child: Stack(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Icon(Icons.home,
                              color: page == 0
                                  ? colorWhite
                                  : colorWhite),
                            page == 0 ?
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text("Trang chủ", style: TextStyle(color: page == 0
                                  ? colorWhite
                                  : color_background, fontWeight: page == 0 ? FontWeight.w500 : FontWeight.normal),),
                            ): SizedBox()
                          ],
                        ),
                        onTap: () {
                          setBottomBarIndex(0);
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment(1, -1),
                              children: [
                                Icon(Icons.create, color: page == 1
                                    ? colorWhite
                                    : colorWhite, size: 20,),
                              ],
                            ),
                            page == 1 ?
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text("Lập hóa đơn", style: TextStyle(color: page == 1
                                  ? colorWhite
                                  : color_background, fontWeight: page == 1 ? FontWeight.w500 : FontWeight.normal)),
                            ): SizedBox()
                          ],
                        ),
                        onTap: (){
                          // isHomeScreen = false;
                          // menuPageController.setInterfaceMenuPage(1);
                          setBottomBarIndex(1);
                        },
                      ),
                      InkWell(
                          child: Row(
                            children: [
                              Icon(Icons.notifications_none, color: page == 2
                                  ? colorWhite
                                  : colorWhite),
                              page == 2 ?
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text("Thông báo", style: TextStyle(color: page == 2
                                    ? colorWhite
                                    : color_background, fontWeight: page == 2 ? FontWeight.w500 : FontWeight.normal)),
                              ): SizedBox()
                            ],
                          ),
                          onTap: (){
                            // isHomeScreen = false;
                            // menuPageController.setInterfaceMenuPage(2);
                            setBottomBarIndex(2);
                          },
                        ),
                      InkWell(
                        child: Row(
                          children: [
                            Icon(Icons.person, color: page == 3
                                ? colorWhite
                                : colorWhite),
                            page == 3 ?
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text("Tài khoản", style: TextStyle(color: page == 3
                                  ? colorWhite
                                  : color_background, fontWeight: page == 3 ? FontWeight.w500 : FontWeight.normal)),
                            ): SizedBox()
                          ],
                        ),
                        onTap: (){
                          // isHomeScreen = false;
                          // menuPageController.setInterfaceMenuPage(3);
                          setBottomBarIndex(3);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callPage(int page) {
    switch (page) {
      case 0:
        return TabHomeScreen();
      case 1:
        return LapHoaDonScreen();
      case 2:
        return TabThongBaoScreen();
      case 3:
        return InformationAccountScreen();

      default:
        return TabHomeScreen();
    }
  }
  setBottomBarIndex(index) {
    setState(() {
      switch(index){
        case 0:
          title = "Trang chủ";
          break;
        case 1:
          title = "Lập hóa đơn";
          break;
        case 2:
          title = "Thông báo";
          break;
        case 3:
          title = "Tài khoản";
          break;

      }
      currentIndex = index;

    });
  }
}
