import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/tra_cuu_hoa_don_screen.dart';
import 'package:mtax24/screen/tab/home/view_chi_tiet.dart';
import 'package:mtax24/service/init.dart';
import '../../init_view.dart';

class HomeScreen extends StatefulWidget with GetItStatefulWidgetMixin {

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with GetItStateMixin {

  final scrollDirection = Axis.vertical;
  AnimationController controllerAni;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = watchX((MenuHomeModel x) => x.userInfo);
    final listTinTuc = watchX((MenuHomeModel x) => x.lstTinTuc);
    final loading = watchX((MenuHomeModel x) => x.loading);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/bg_home.png").image,
                  // colorFilter: ColorFilter.mode(colorWhite.withOpacity(0.2), BlendMode.multiply),
                  fit: BoxFit.fill),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: scrollDirection,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                        style: text18Bold700,
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        "${user?.nick ?? ""}",
                                        style: text_fontSize14_717788,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],),
                  listTinTuc != null && listTinTuc.length > 0 ?
                  ItemHome(context, listTinTuc) : Container(),
                ],
              ),
            ),
          ),
          loading ? LoadingWidget() : Container()
        ],
      ),
    );
  }

  Widget ItemHome(BuildContext context, List<TieuDeTinTucResponse> listTinTuc){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 8, bottom: 16, right: 8, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
            ),
            child: Text(
              "Tính năng chính".toUpperCase(),
              style: text12Bold600,
            )
        ),
        Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => LapHoaDonScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 0, top: 0),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(lap_hoa_don, fit: BoxFit.fitHeight,),
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(left: 16, right: 0, top: 0),
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   width: MediaQuery.of(context).size.width * 0.45,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment
              //               .topLeft,
              //           end: Alignment
              //               .bottomRight,
              //           colors: <Color>[
              //             color_background, color406BAC
              //           ]),
              //       borderRadius: BorderRadius.all(Radius.circular(5))),
              //     child: Center(
              //       child: Text("Lập hóa đơn", style: text_default_white_home,
              //       ),
              //     )
              //
              // ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8, right: 16, top: 0),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => TraCuuHoaDonScreen()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(tra_cuu_hoa_don, fit: BoxFit.fitHeight,),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           begin: Alignment
                        //               .topLeft,
                        //           end: Alignment
                        //               .bottomRight,
                        //           colors: <Color>[
                        //             color_background, color406BAC
                        //           ]),
                        //       borderRadius: BorderRadius.all(Radius.circular(5))),
                        //     child: Center(
                        //       child: Text(
                        //         "Tra cứu hóa đơn",
                        //         style: text_default_white_home,
                        //
                        //       ),
                        //     )
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: height_32,
                    ),
                    Expanded(
                      child:
                      InkWell(
                        onTap: () {
                          // isHomeScreen = false;
                          // menuPageController.setInterfaceMenuPage(4);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(png_invoice_report, fit: BoxFit.fitHeight,),
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
            padding: EdgeInsets.only(left: 8, bottom: 16, right: 8, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
              // color: Color(0x15FFFFFF),

            ),

            child: Text(
              "Tin tức mới".toUpperCase(),
              style: text12Bold600,

            )
        ),

        listTinTuc.isNotEmpty ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: listTinTuc.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => ViewChiTiet(listTinTuc[index].categorynewsContent, true)));
                  },
                  child: CardWidget(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width ,
                          decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                )
                              ]
                          ),

                          child: Column(
                            children: [
                              Image.network("https://tax24.com.vn/thuedientu/servlet/CmsImageServlet?attachmentId=${listTinTuc[index].attachmentId}",
                                fit: BoxFit.cover,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(listTinTuc[index].categorynewsTitle),
                              )
                            ],
                          )

                      ),
                      SizedBox(height: 8,),

                    ],
                  )
              );
            }) :
        Container(),

      ],
    );
  }
}
