import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/request/invoice_report/gui_bthdl_request.dart';

import '../../../../../init_view.dart';

class ChiTietBaoCaoTongHopScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;


  ChiTietBaoCaoTongHopScreen(this.object);

  @override
  State<StatefulWidget> createState() => ChiTietBaoCaoTongHopScreenState();
}

class ChiTietBaoCaoTongHopScreenState extends State<ChiTietBaoCaoTongHopScreen> with GetItStateMixin{

  ListBthdLieu lapHoaDonObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      lapHoaDonObject = widget.object;
      print("========: ${lapHoaDonObject.toJson()}");
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
          // appBar: buildAppBarMenuCustom(context, "Chi tiết báo cáo tổng hợp dữ liệu"),
          body: Stack(
            children: [
              AppbarScreen(title: "Chi tiết báo cáo tổng hợp dữ liệu", isShowBack: true, isShowHome: true,
                heightTop: EdgeInsets.only(top: 462.h),
                heightBackgroundTop: 425.h,
                trangThai: Utils.convertStatusThongBao(lapHoaDonObject.trangthai),
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32.h, right: 32.h),
                          child: Text("Thông tin dữ liệu".toUpperCase(), textAlign: TextAlign.start, style: text14OBold600,),
                        ),

                        Padding(
                          padding: EdgeInsets.all(32.h),
                          child: ItemFilterTB("Ký hiệu hóa đơn", lapHoaDonObject.khieuhdon != null ? lapHoaDonObject.khieuhdon : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding: EdgeInsets.all(32.h),
                          child: ItemFilterTB("Số hóa đơn", lapHoaDonObject.sohdon != null ? lapHoaDonObject.sohdon : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Ngày lập hóa đơn", lapHoaDonObject.ngayhdon != null ? Utils.convertTimestamp(lapHoaDonObject.ngayhdon) : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Tên người mua", lapHoaDonObject.tennguoimua != null ? lapHoaDonObject.tennguoimua : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Mã số thuế người mua", lapHoaDonObject.mstnmua != null ? lapHoaDonObject.mstnmua : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Mặt hàng", lapHoaDonObject.mathang != null ? lapHoaDonObject.mathang : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Số lượng", lapHoaDonObject.soluong != null ? lapHoaDonObject.soluong : ""),
                        ),
                        Divider(height: 1,),

                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Trạng thái", lapHoaDonObject.trangthai != null ? Utils.convertStatusThongBao(lapHoaDonObject.trangthai) : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Thông tin hóa đơn liên quan", lapHoaDonObject.hdonlquan != null ? lapHoaDonObject.hdonlquan : ""),
                        ),
                        Divider(height: 1,),
                        Padding(
                          padding:  EdgeInsets.all(32.h),
                          child: ItemFilterTB("Ghi chú", lapHoaDonObject.ghiChu != null ? lapHoaDonObject.ghiChu : "-"),
                        ),

                        Container(
                          color: colorF4FAFF,
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(32.h),
                                child: ItemFilterTB("Tổng tiền dịch vu", lapHoaDonObject.tongtienchuatsuat != null ? "${Utils.covertToMoney(lapHoaDonObject.tongtienchuatsuat.toDouble()) + " ${lapHoaDonObject.maTTe}"}" : ""),
                              ),
                              Divider(height: 1,),
                              Padding(
                                padding:  EdgeInsets.all(32.h),
                                child: ItemFilterTB("Tổng số thuế GTGT", lapHoaDonObject.tongtientsuat != null ? "${Utils.covertToMoney(lapHoaDonObject.tongtientsuat.toDouble()) + " ${lapHoaDonObject.maTTe}"}" : ""),
                              ),
                              Divider(height: 1,),
                              Padding(
                                padding:  EdgeInsets.all(32.h),
                                child: ItemFilterTB("Tổng tiền thanh toán", lapHoaDonObject.tongtienttoanvnd != null ? "${Utils.covertToMoney(lapHoaDonObject.tongtienttoanvnd.toDouble())} ${lapHoaDonObject.maTTe}"  : ""),
                              ),
                            ],
                          ),

                        )

                      ],
                    ),
                  ),
                ],
              ),

            ],
          )



      ),
    );
  }

}