import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/bao_cao_tong_hop_hd_controller.dart';
import 'package:mtax24/model/bao_cao_tong_hop_hd_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tong_hop_hd/list_bang_thop_response.dart';

import '../../../../init_view.dart';
import 'chi_tiet_tong_hop_hd_screen.dart';


class ViewTongHopHDScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;


  ViewTongHopHDScreen( this.object);

  @override
  State<StatefulWidget> createState() => ViewTongHopHDScreenState();
}

class ViewTongHopHDScreenState extends State<ViewTongHopHDScreen> with GetItStateMixin{

  var baoCaoTHController = GetIt.I<BaoCaoTongHopHDController>();
  ListBangThopResponse lapHoaDonObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.object != null){
      lapHoaDonObject = widget.object;
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final loading = watchX((BaoCaoTongHopHdModel x) => x.loading);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // appBar: buildAppBarMenuCustom(context, "Bảng tổng hợp dữ liệu hóa đơn điện tử gửi cơ quan thuế"),
          body: Stack(
            children: [
              AppbarScreen(title: "Bảng tổng hợp dữ liệu hóa đơn điện tử gửi cơ quan thuế", isShowBack: true, isShowHome: true,
                childrenAppBar: [
                  lapHoaDonObject.kdlieu != null && lapHoaDonObject.kdlieu != "" ?
                  ItemFilterTB("Kỳ dữ liệu", lapHoaDonObject.kdlieu ) : SizedBox(),
                  lapHoaDonObject.lanDau != null && lapHoaDonObject.lanDau != "" ?
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ItemFilterTB("Lần đâu", lapHoaDonObject.lanDau),
                  ) : SizedBox(),
                  lapHoaDonObject.bslthu != null && lapHoaDonObject.bslthu != "" ?
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ItemFilterTB("Bổ sung lần thứ", lapHoaDonObject.bslthu),
                  ) : SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ItemFilterTB("Tên người nộp", lapHoaDonObject.tnnt),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ItemFilterTB("Mã số thuế", lapHoaDonObject.mst),
                  ),
                ],

                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height_24, horizontal: width_32),
                    child: Column(
                      children: [
                        lapHoaDonObject.listBangThop != null && lapHoaDonObject.listBangThop.length > 0 ?
                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: lapHoaDonObject.listBangThop.length ?? 0,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context, new MaterialPageRoute(builder: (context) => ChiTietTongHopHDScreen(lapHoaDonObject.listBangThop[index])));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.h),
                                          child: Icon(Icons.event_note_outlined, color: color_background, size: 87.sp,),
                                        ),

                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              lapHoaDonObject.listBangThop[index].tnmua != null ?
                                              Text(lapHoaDonObject.listBangThop[index].tnmua != null ? lapHoaDonObject.listBangThop[index].tnmua : "", style: text_action_Bold600) : SizedBox(),
                                              lapHoaDonObject.listBangThop[index].mhhdvu == null ? SizedBox() :
                                              Padding(
                                                padding: EdgeInsets.only(top: 10.h),
                                                child: Text(lapHoaDonObject.listBangThop[index].mhhdvu == null ? "" : lapHoaDonObject.listBangThop[index].mhhdvu, style: text12OpacityBold400),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(top: 10.h),
                                                child: Text("${lapHoaDonObject.listBangThop[index].tgtttoan == null ? "" : Utils.covertToMoney(double.parse(lapHoaDonObject.listBangThop[index].tgtttoan))} đ", style: text14Red400,),
                                              )
                                            ],
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(lapHoaDonObject.listBangThop[index].khhdon != null ? lapHoaDonObject.listBangThop[index].khhdon : "", style: text16Bold600, textAlign: TextAlign.end,),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10.h),
                                                child: Text("${lapHoaDonObject.listBangThop[index].shdon != null ? lapHoaDonObject.listBangThop[index].shdon : ""}", style: text16Bold600, textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ],
                                          ),
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                                      child: Divider(),
                                    )
                                  ],
                                ),
                              );
                            }) :
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
              loading ? LoadingWidget() : Container(),
            ],
          )



      ),
    );
  }

}