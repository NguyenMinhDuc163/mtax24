import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/bao_cao_tong_hop_hd_controller.dart';
import 'package:mtax24/model/bao_cao_tong_hop_hd_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/data_synthesis/chi_tiet_bao_cao_th_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/request/invoice_report/gui_bthdl_request.dart';

import '../../../../../init_view.dart';
import 'report_data_synthesis_screen.dart';

class DanhSachLapBaoCaoTHScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final List<ListBthdLieu> listObject;
  final dynamic object;


  DanhSachLapBaoCaoTHScreen(this.listObject, this.object);

  @override
  State<StatefulWidget> createState() => DanhSachLapBaoCaoTHScreenState();
}

class DanhSachLapBaoCaoTHScreenState extends State<DanhSachLapBaoCaoTHScreen> with GetItStateMixin{

  var baoCaoTHController = GetIt.I<BaoCaoTongHopHDController>();
  List<ListBthdLieu> listBthdLieu;
  LapHoaDonObject lapHoaDonObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.listObject != null){
      listBthdLieu = widget.listObject;
    }
    if(widget.object != null){
      lapHoaDonObject = widget.object;
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((BaoCaoTongHopHdModel x) => x.lstGuiBTHDL, (context, newValue, cancel) {
      DialogAlert.showDialogAlertCloseScreen(context, "Gửi cơ quan thuế thành công");
    });

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
                  ItemFilterTB("Kỳ dữ liệu", lapHoaDonObject.kyDl == "Ngày" ? "Từ ngày: ${lapHoaDonObject.tuNgay} Đến ngày: ${lapHoaDonObject.denNgay}" : "${lapHoaDonObject.kyDl} ${lapHoaDonObject.thang} năm ${lapHoaDonObject.nam}"),
                  lapHoaDonObject.loaiDL == "Lần đầu" ?
                  Padding(
                      padding:  EdgeInsets.all(10.h),
                      child:ItemFilterTB("Lần đâu", "1")
                  ) : SizedBox(),
                  lapHoaDonObject.loaiDL == "Bổ sung" ?
                  Padding(
                      padding:  EdgeInsets.all(10.h),
                      child: ItemFilterTB("Bổ sung lần thứ", lapHoaDonObject.lanThu)
                  ) : SizedBox(),
                  Padding(
                    padding:  EdgeInsets.all(10.h),
                      child: ItemFilterTB("Tên người nộp", lapHoaDonObject.tenNN),
                  ),
                  ItemFilterTB("Mã số thuế", lapHoaDonObject.mstNN),
                ],

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 40.h, left: 40.h),
                    child: Text("Thông tin dữ liệu".toUpperCase(), textAlign: TextAlign.start, style: text14OBold600,),
                  ),
                  listBthdLieu != null && listBthdLieu.length > 0 ?
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: listBthdLieu.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, new MaterialPageRoute(builder: (context) => ChiTietBaoCaoTongHopScreen(listBthdLieu[index])));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 40.h, right: 40.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right: 20.h),
                                      child: Icon(Icons.event_note_outlined, color: color_background, size: 86.h,),
                                    ),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(listBthdLieu[index].mathang != null ? listBthdLieu[index].mathang : "", style: text_action_Bold600),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text(listBthdLieu[index].ngayhdon == null ? "" : Utils.convertTimestamp(listBthdLieu[index].ngayhdon), style: text12OpacityBold400),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("${Utils.covertToMoney(listBthdLieu[index].tongtienttoanvnd.toDouble())} ${listBthdLieu[index].maTTe}", style: text14Red400,),
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
                                          Text(listBthdLieu[index].khieuhdon != null ? listBthdLieu[index].khieuhdon : "", style: text16Bold600, textAlign: TextAlign.end,),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("${listBthdLieu[index].sohdon != null ? listBthdLieu[index].sohdon : ""}", style: text16Bold600, textAlign: TextAlign.end,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text("${listBthdLieu[index].trangthai != null ? listBthdLieu[index].trangthai : ""}",
                                              style: text12Bold400,
                                              textAlign: TextAlign.end,
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
                          ),
                        );
                      }) :
                  Container(),
                  SizedBox(height: 125.h,),
                  
                ],
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  color: colorF4FAFF,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 40.h, left: 40.h, right: 40.h),
                  child: ButtonBottomNotStackWidget(
                    title: "Gửi cơ quan thuế",
                    onPressed: () {
                      baoCaoTHController.guiBTHDL(GuiBthdlRequest(
                        listBthdLieu: listBthdLieu,
                      ));
                    },
                    marginTop: 40.h,
                    radius: 25.h,
                  ),
                ),
              ),
              loading ? LoadingWidget() : Container(),
            ],
          )



      ),
    );
  }

}