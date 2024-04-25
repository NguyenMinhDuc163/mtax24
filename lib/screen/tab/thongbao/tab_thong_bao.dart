import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/view_chi_tiet.dart';
import 'package:mtax24/service/init.dart';
import '../../init_view.dart';

class TabThongBaoScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _LapHoaDonScreenScreenState();
}

class _LapHoaDonScreenScreenState extends State<TabThongBaoScreen> with GetItStateMixin{

  var controller = GetIt.I<MenuHomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getTieuDeTinTucChung(TinTucRequest(
        lang: "vi_VN"
    ));

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final listTinTuc = watchX((MenuHomeModel x) => x.lstTinTucChung);
    final loading = watchX((MenuHomeModel x) => x.loading);
    
    return Scaffold(
        body: Stack(
          children: [
            TabAppbarScreen(title: "", image: "assets/images/bg_thong_bao.png", isShowBack: false, isShowHome: false,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 40.h, right: 40.h),
                  child: Text("Thông báo", textAlign: TextAlign.start, style: text20Bold500,),
                ),

                listTinTuc != null && listTinTuc.length > 0 ?
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 40.h, right: 40.h),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        // mainAxisSpacing: 16.w,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      // shrinkWrap: true,
                      // primary: false,
                      itemCount: listTinTuc.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (context) => ViewChiTiet(listTinTuc[index].categorynewsContent, false)));
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width ,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFf9f9f9),
                                          // color: colorWhite,
                                          borderRadius: BorderRadius.all(Radius.circular(12.h)),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.grey.withOpacity(0.5),
                                          //     spreadRadius: 2,
                                          //     blurRadius: 3,
                                          //     offset: Offset(0, 1),
                                          //   )
                                          // ]
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12.h),
                                                topRight: Radius.circular(12.h),
                                              ),
                                              child: Image.network("https://tax24.com.vn/thuedientu/servlet/CmsImageServlet?attachmentId=${listTinTuc[index].attachmentId}",
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(20.h),
                                            child: Text(listTinTuc[index].categorynewsTitle,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,),
                                          )
                                        ],
                                      )

                                  ),
                                  SizedBox(height: 20.h,),
                                ],
                              ),
                            )
                        );
                      }),
                ) :
                Container(),
              ],

            ),
            loading ? LoadingWidget() : Container()

          ],
        )
    );
  }


}

