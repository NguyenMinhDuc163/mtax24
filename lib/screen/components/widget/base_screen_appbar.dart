import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import '../../menu_tab.dart';
import 'avatar_custom_widget.dart';
import 'marquee_widget.dart';

class BaseAppbarScreen extends StatelessWidget{
  final String title;
  final bool isShowIcon;
  final bool isShowList;
  final int total;
  final Function onBack;
  final List<Widget> children;
  final Widget bottomNavBar;

  BaseAppbarScreen({this.title, this.isShowIcon, this.isShowList, this.total, this.onBack, this.children, this.bottomNavBar});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: colorWhite.withOpacity(0.3),
            child: KeyboardDismisser(
              child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)
                        ),
                        child: Image.asset(
                          "assets/images/bg_login.png",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      margin: const EdgeInsets.only(top: 65,),
                      child: Column(
                        children: [
                        Image.asset(
                        "assets/images/bg_text.png",
                        width: 300,
                          height: 100,
                        )
                        //   Text("DỊCH VỤ THUẾ ĐIỆN TỬ", style: text20Bold300White,),
                        //   Text("TAX24", style: text50Bold900White,),
                        ],

                      ),

                    ),
                    //// code cu

                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 150,
                    //   margin: const EdgeInsets.only(top: 170,),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 15.0),
                    //     child: Image.asset('assets/images/avatar.png',
                    //         width: width_300),
                    //   ),
                    // ),

                    Container(
                      width: MediaQuery.of(context).size.width, // Chiều rộng của container bằng với chiều rộng màn hình
                      height: 90, // Chiều cao cố định của container
                      margin: const EdgeInsets.only(top: 200,), // Khoảng cách từ đỉnh
                      decoration: BoxDecoration(
                        color: Colors.white, // Thêm màu nền trắng cho toàn bộ container
                        shape: BoxShape.circle, // Làm cho container có dạng hình tròn
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0), // Khoảng cách đệm theo chiều dọc
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar3.png',
                            width: 100, // Chiều rộng cố định của ảnh
                            height: 100, // Chiều cao cố định của ảnh// Đảm bảo ảnh phủ kín khuôn hình tròn
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        // height: MediaQuery.of(context).size.height ,
                        margin: const EdgeInsets.only(top: 340),
                        child: Column(
                          children: children,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ));
  }

}


class CustomerAppbarScreen extends StatelessWidget{
  final String title;
  final bool isShowBack;
  final bool isShowHome;
  final bool isSave ;
  final bool isCreate ;
  final int total;
  final Function onBack;
  final List<Widget> children;
  final Widget bottomNavBar;
  final Function onCreate;
  final Function onSave;

  CustomerAppbarScreen({this.title, this.isShowBack, this.isShowHome, this.isSave, this.isCreate, this.total, this.onBack, this.children, this.bottomNavBar, this.onCreate, this.onSave});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: Container(
          child: KeyboardDismisser(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: colorWhite,
                  padding: EdgeInsets.only(top: margin_56, left: margin_32, right: margin_32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isShowBack ? Padding(
                            padding: EdgeInsets.only(top: padding_40, bottom: padding_40, right: padding_40),
                            child: InkWell(
                                child: Icon(Icons.arrow_back, color: color_icon,),
                                onTap: (){
                                  if(onBack == null){
                                    Navigator.of(context).pop();
                                  }else{
                                    onBack();
                                  }
                                }
                            ),
                          ): SizedBox(),

                          Container(
                            child: isShowHome ? IconButton(
                              icon: Icon(
                                Icons.home,
                                color: color_icon,
                              ),
                              onPressed: (){
                                Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => MenuPage()));
                                // GetIt.I<MenuPageController>().setInterfaceMenuPage(0);
                              },
                            ) :
                              isCreate ? IconButton(
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: color_icon,
                                ),
                                onPressed: onCreate,
                              ) :
                              isSave ? IconButton(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: color_icon,
                                ),
                                onPressed: onSave,
                              ) : SizedBox(),
                          )
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: padding_32),
                        child: MarqueeWidget(
                          child: Text(title ?? "", style: text20Bold500),
                        ),
                      )

                    ],
                  ),
                ),
                Container(
                  margin: isShowBack == true ? EdgeInsets.only(top: margin_325) : EdgeInsets.only(top: margin_200),
                  color: colorWhite,
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}

class CustomerListViewAppbarScreen extends StatelessWidget{
  final String title;
  final bool isShowBack;
  final bool isShowHome;
  final int total;
  final Function onBack;
  final Widget children;
  final Widget bottomNavBar;

  CustomerListViewAppbarScreen({this.title, this.isShowBack, this.isShowHome, this.total, this.onBack, this.children, this.bottomNavBar});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: Container(
          child: KeyboardDismisser(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: colorWhite,
                  padding: EdgeInsets.only(top: margin_56, left: margin_32, right: margin_32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isShowBack ? InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(top: padding_40, bottom: padding_40, right: padding_40),
                                child: Icon(Icons.arrow_back, color: color_icon,),
                              ),
                              onTap: (){
                                if(onBack == null){
                                  Navigator.of(context).pop();
                                }else{
                                  onBack();
                                }
                              }
                          ): SizedBox(),
                          isShowHome == null || isShowHome == false ? SizedBox() :
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: color_icon,
                            ),
                            onPressed: (){
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: padding_32),
                        child: MarqueeWidget(
                          child: Text(title ?? "", style: text20Bold500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: isShowBack == true ? EdgeInsets.only(top: margin_325) : EdgeInsets.only(top: margin_200),
                  color: colorWhite,
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  child: children,
                ),
              ],
            ),
          ),
        ));
  }

}

class TabAppbarScreen extends StatelessWidget{
  final String title;
  final String image;
  final bool isShowBack;
  final bool isShowHome;
  final Color color;
  final Function onBack;
  final List<Widget> children;
  final Widget bottomNavBar;

  TabAppbarScreen({this.title, this.image, this.isShowBack, this.isShowHome, this.color, this.onBack, this.children, this.bottomNavBar});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: Container(
          child: KeyboardDismisser(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(image == null || image == "" ? "assets/images/bg_hoa_don.png" : image).image,
                      // colorFilter: ColorFilter.mode(colorWhite.withOpacity(0.2), BlendMode.multiply),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.only(top: margin_56, left: margin_32, right: margin_32, ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isShowBack ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                child: Icon(Icons.arrow_back, color: colorWhite,),
                                onTap: (){
                                  if(onBack == null){
                                    Navigator.of(context).pop();
                                  }else{
                                    onBack();
                                  }
                                }
                            ),
                          ): SizedBox(),
                          isShowHome == null || isShowHome == false ? SizedBox() :
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: colorWhite,
                            ),
                            onPressed: (){
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MenuPage()));


                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: margin_32),
                        child: Text("$title", style: text20Bold500White,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: margin_405) ,
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius_32),
                        topRight: Radius.circular(radius_32),
                      )
                  ),
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}


class AppbarScreen extends StatelessWidget{
  final String title;
  final String image;
  final String trangThai;
  final bool isShowBack;
  final bool isShowHome;
  final Color color;
  final Function onBack;
  final List<Widget> children;
  final List<Widget> childrenAppBar;
  final Widget bottomNavBar;
  final EdgeInsetsGeometry heightTop;
  final double heightBackgroundTop;

  AppbarScreen({this.title, this.image, this.trangThai, this.isShowBack, this.isShowHome, this.color, this.onBack, this.children, this.childrenAppBar, this.bottomNavBar, this.heightTop, this.heightBackgroundTop});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: colorWhite,
          child: KeyboardDismisser(
            child: Stack(
              children: [
                Container(
                  height: heightBackgroundTop == null ? height_500 : heightBackgroundTop,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius_60),
                      bottomRight: Radius.circular(radius_60),
                    ),
                    child: Image.asset(image == null || image == "" ? "assets/images/bg_hoa_don.png" : image,
                      fit: BoxFit.cover,),
                  ),
                ),
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(margin_32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height_16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isShowBack ? Padding(
                                padding: EdgeInsets.only(top: padding_40, bottom: padding_40, right: padding_40),
                                child: InkWell(
                                    child: Icon(Icons.arrow_back, color: colorWhite,),
                                    onTap: (){
                                      if(onBack == null){
                                        Navigator.of(context).pop();
                                      }else{
                                        onBack();
                                      }
                                    }
                                ),
                              ): SizedBox(),
                              isShowHome == null || isShowHome == false ? SizedBox() :
                              IconButton(
                                icon: Icon(
                                  Icons.home,
                                  color: colorWhite,
                                ),
                                onPressed: (){
                                  Navigator.pushReplacement(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => MenuPage()));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: margin_32),
                            child: Text("$title", style: text20Bold500White,),
                          ),
                          trangThai == "" || trangThai == null ? SizedBox() :
                          Container(
                            margin: EdgeInsets.only( top: margin_16),
                            padding: EdgeInsets.all(height_4),
                            decoration: BoxDecoration(
                                color: color_gray,
                                borderRadius: BorderRadius.all(Radius.circular(radius_44))
                            ),
                            // width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Wrap(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 4.0,),
                                      decoration: BoxDecoration(
                                          color: color59A5FE,
                                          borderRadius: BorderRadius.all(Radius.circular(radius_44))
                                      ),
                                      height: 12,
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: padding_16, right: padding_16),
                                      child: Text("$trangThai", textAlign: TextAlign.start, style: text12Bold500White),
                                    ),
                                  ],
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                ),

                              ],

                            ),
                          ),
                          childrenAppBar != null ?
                          Container(
                            margin: EdgeInsets.only(top: margin_16,),
                            padding: EdgeInsets.all(padding_32),
                            decoration: BoxDecoration(
                                color: color == null ? colorWhite : color,
                                borderRadius: BorderRadius.all(Radius.circular(radius_32)
                                ),
                                boxShadow: [BoxShadow(
                                    color: color == null ? color_gray : color.withOpacity(0.6),
                                    offset: Offset(0,5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0
                                )]
                            ),
                            child: Column(
                              children: childrenAppBar,
                            ),
                          ) : Container()

                        ],
                      ),
                    ),

                  ],
                ),
                Container(
                  margin: heightTop == null ? EdgeInsets.only(top: margin_775) : heightTop,
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: children,
                    ),
                  ),
                ),


              ],
            ),
          ),
        ));
  }

}