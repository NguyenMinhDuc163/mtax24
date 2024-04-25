import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/list_function_vertical.dart';
import '../../init_view.dart';

class TabHomeScreen extends StatefulWidget with GetItStatefulWidgetMixin {

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<TabHomeScreen> with GetItStateMixin {
  final scrollDirection = Axis.vertical;
  AnimationController controllerAni;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final menus = watchX((MenuHomeModel x) => x.menus);
    final user = watchX((MenuHomeModel x) => x.userInfo);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("assets/images/bg_home.png").image,
                // colorFilter: ColorFilter.mode(colorWhite.withOpacity(0.2), BlendMode.multiply),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //* ảnh dại diện
                      Padding(
                        padding: EdgeInsets.all(30.w),
                        child: AvatarCustomWidget(
                          height: 200.w,
                          width: 200.w,
                        ),
                      ),
                      //* Tên
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user?.tin ?? ""}",
                                style: text18bold600White,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                "${user?.nick ?? ""}",
                                style: text12Bold500White,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 650.h),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.h),
                topRight: Radius.circular(30.h),
              )
            ),
            child: SingleChildScrollView(
              scrollDirection: scrollDirection,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    if (menus != null)
                      for (var i = 0; i < menus.length; i++)
                        Container(
                          margin: EdgeInsets.only(left: 32.h, right: 32.h, top: 32.h),
                          child: ListFuntionVertical(
                              title: menus[i].title,
                              contextParent: context,
                              datas: menus[i].contains),
                        ),
                  ],
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: (){
          //   },
          //   child: Container(
          //     height: 50,
          //     margin: const EdgeInsets.only(top: 250, left: 50, right: 50),
          //     decoration: BoxDecoration(
          //         color: colorAE393F,
          //         borderRadius: BorderRadius.all(
          //             Radius.circular(25),
          //
          //         ),
          //         border: Border.all(color: colorWhite),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 0,
          //           blurRadius: 7,
          //           offset: Offset(0, 3), // changes position of shadow
          //         ),
          //       ],
          //
          //     ),
          //     child: InkWell(
          //       onTap: (){
          //         isHomeScreen = false;
          //         menuPageController.setInterfaceMenuPage(1);
          //       },
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.add, color: colorWhite, size: 40,),
          //           Text("Lập hóa đơn", style: text18bold600White,)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          // isHomeScreen = false;
          // menuPageController.setInterfaceMenuPage(1);
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => MenuPage(type: 1)));
          print("vao day");
        },
        backgroundColor: txtColorAction,
        child: const Icon(Icons.add),
      ),
    );
  }
}
