import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tong_hop_hd/list_bang_thop_response.dart';

import '../../../../init_view.dart';

class ChiTietTongHopHDScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;


  ChiTietTongHopHDScreen(this.object);

  @override
  State<StatefulWidget> createState() => ChiTietBaoCaoTongHopScreenState();
}

class ChiTietBaoCaoTongHopScreenState extends State<ChiTietTongHopHDScreen> with GetItStateMixin{

  ListBangThop lapHoaDonObject;

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Stack(
            children: [
              AppbarScreen(title: "Chi tiết báo cáo tổng hợp dữ liệu", isShowBack: true, isShowHome: true,
                heightBackgroundTop: 400.h,
                heightTop: EdgeInsets.only(top: 450.h),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.h, right: 40.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Ký hiệu hóa đơn", lapHoaDonObject.khhdon != null ? lapHoaDonObject.khhdon : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Số hóa đơn", lapHoaDonObject.shdon != null ? lapHoaDonObject.shdon : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Ngày lập hóa đơn", lapHoaDonObject.nlap != null ? Utils.convertDateTime(lapHoaDonObject.nlap) : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Tên người mua", lapHoaDonObject.tnmua != null ? lapHoaDonObject.tnmua : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Mã số thuế người mua", lapHoaDonObject.mstnmua != null ? lapHoaDonObject.mstnmua : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Mặt hàng", lapHoaDonObject.mhhdvu != null ? lapHoaDonObject.mhhdvu : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Số lượng", lapHoaDonObject.sluong != null ? lapHoaDonObject.sluong : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Trạng thái", lapHoaDonObject.tthai != null ? Utils.convertStatusThongBao(lapHoaDonObject.tthai) : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: ItemFilterTB("Ghi chú", lapHoaDonObject.gchu != null ? lapHoaDonObject.gchu : ""),
                        ),



                      ],
                    ),
                  ),
                  Container(
                    color: colorF4FAFF,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(40.h),
                          child: ItemFilterTB("Tổng giá trị hàng hóa, dịch vụ bán ra chưa có thuế GTGT", lapHoaDonObject.ttcthue != null ? "${Utils.covertToMoney(double.parse(lapHoaDonObject.ttcthue))} đ" : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.all(40.h),
                          child: ItemFilterTB("Thuế suất thuế GTGT", lapHoaDonObject.tsuat != null ? lapHoaDonObject.tsuat : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.all(40.h),
                          child: ItemFilterTB("Tổng số thuế GTGT", lapHoaDonObject.tgtthue != null ? "${Utils.covertToMoney(double.parse(lapHoaDonObject.tgtthue))} đ" : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.all(40.h),
                          child: ItemFilterTB("Tổng tiền thanh toán", lapHoaDonObject.tgtttoan != null ? "${Utils.covertToMoney(double.parse(lapHoaDonObject.tgtttoan))} đ" : ""),
                        ),
                      ],
                    ),
                  )
                ],
              )


            ],
          )



      ),
    );
  }

}