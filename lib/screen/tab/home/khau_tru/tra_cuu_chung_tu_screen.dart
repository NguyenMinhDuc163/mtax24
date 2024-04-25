import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/khau_tru/filter_tra_cuu_chung_tu_screen.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/tra_cuu_hoa_don_request.dart';
import 'package:mtax24/service/init.dart';
import '../../../init_view.dart';

class TraCuuChungTuScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends State<TraCuuChungTuScreen> with GetItStateMixin{

  String tuNgay = "", denNgay = "", mstNban = "", idNguoiLap = "";
  int page = 1;
  ScrollController _scrollController;
  var controller = GetIt.I<HoaDonBanHangController>();
  List<TraCuuHoaDonResponse> lstHoaDon = [];
  FilterTCHoaDon filterObjectTc;
  String noData = "";
  TraCuuHoaDonChiTietResponse chiTietResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    // DateTime pastMonth = DateTime.now().subtract(Duration(days: 30));
    tuNgay = new DateFormat('dd/MM/yyyy').format(now);
    denNgay = new DateFormat('dd/MM/yyyy').format(now);
    _scrollController = new ScrollController()..addListener(_loadMore);
    SharePreferUtils.getUserInfo().then((value) {
      mstNban = value.tin;
      idNguoiLap = value.userId;
      traCuu(
        emailnmua: "",
        kyHieuHDon: "",
        trangThai: "",
        tinhChat: "",
        sohdon: "",
        mstNmua: "",
        mauhdon: "",
        loaihdon: "",
      );
    });


  }

  void _loadMore() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        page ++;
      });
      if(filterObjectTc != null) {
        traCuu(
          emailnmua: filterObjectTc.emailNguoiMua,
          kyHieuHDon: filterObjectTc.kyHieuHoaDon,
          trangThai: filterObjectTc.trangThaiTbId,
          tinhChat: filterObjectTc.tinhChatId,
          sohdon: filterObjectTc.soHoaDon,
          mstNmua: filterObjectTc.mstNguoiMua,
          mauhdon: filterObjectTc.mauHoaDon,
          loaihdon: filterObjectTc.loaiHdID,
        );
      }else {
        traCuu(
          emailnmua: "",
          kyHieuHDon: "",
          trangThai: "",
          tinhChat: "",
          sohdon: "",
          mstNmua: "",
          mauhdon: "",
          loaihdon: "",
        );
      }
    }
  }
  void traCuu({
    String emailnmua,
    String kyHieuHDon,
    String loaihdon,
    String mauhdon,
    String mstNmua,
    String sohdon,
    String tinhChat,
    String trangThai,
  }){
    controller.traCuuHoadonBh(TraCuuHoaDonRequest(
      mstNban: mstNban,
      emailnmua: emailnmua,
      fromDate: tuNgay,
      fromDateNgayHDon: "",
      fromDateShow: "",
      idNguoilap: idNguoiLap,
      kyHieuHDon: kyHieuHDon,
      loaihdon: loaihdon,
      mauhdon: mauhdon,
      maXacMinh: "",
      mstNmua: mstNmua,
      page: page,
      sohdon: sohdon,
      soHoaDonCqt: "",
      tinhChat: tinhChat,
      toDate: denNgay,
      toDateNgayHDon: "",
      toDateShow: "",
      trangThai: trangThai,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final loading = watchX((HoaDonBanHangModel x) => x.loading);

    return Scaffold(
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: "Tra cứu chứng từ", isShowBack: true, isShowHome: true,
              children: ListView(
                controller: _scrollController,
                children: [
                  CardWidget(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: colorF2F2F2,
                                        borderRadius: BorderRadius.all(Radius.circular(38.h))
                                    ),
                                    padding: EdgeInsets.all(40.h),
                                    child: Text("$tuNgay - $denNgay", style: text16Bold400,),
                                  )
                              ),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                            context, new MaterialPageRoute(builder: (context) => FilterTraCuuChungTuScreen(object: filterObjectTc, tuNgay: tuNgay, denNgay: denNgay,)));
                                        if(result != null){
                                          setState(() {
                                            filterObjectTc = result;
                                            tuNgay = filterObjectTc.tuNgay;
                                            denNgay = filterObjectTc.denNgay;
                                            page = 1;
                                            lstHoaDon.clear();
                                            noData = "";
                                            traCuu(
                                              emailnmua: filterObjectTc.emailNguoiMua,
                                              kyHieuHDon: filterObjectTc.kyHieuHoaDon,
                                              trangThai: filterObjectTc.trangThaiTbId,
                                              tinhChat: filterObjectTc.tinhChatId,
                                              sohdon: filterObjectTc.soHoaDon,
                                              mstNmua: filterObjectTc.mstNguoiMua,
                                              mauhdon: filterObjectTc.mauHoaDon,
                                              loaihdon: filterObjectTc.loaiHdID,
                                            );
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.filter_alt_outlined, size: 112.sp,)
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 40.h,),

                          lstHoaDon != null && lstHoaDon.length > 0 ?
                          ItemHoaDon(context, lstHoaDon, controller) :
                          Container(
                            child: Center(child: Text("$noData", style: text_action_font14,)),
                          ),
                        ],

                      ),
                    ],
                  ),
                ],
              ),
            ),
            loading ? LoadingWidget() : Container(),
          ],
        )
    );
  }


}

Widget ItemHoaDon(BuildContext context, List<TraCuuHoaDonResponse> list, HoaDonBanHangController controller){
  return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: list.length ?? 0,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              controller.hoaDonChiTiet(TraCuuHoaDonChiTietRequest(
                tinhChat: list[index].tinhChat,
                trangThai: list[index].trangThai,
                id: list[index].id,
                loaiHoaDon: list[index].loaiHoaDon,
              ));
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.h),
                      child: Icon(Icons.assignment_outlined, color: color_background, size: 88.sp,),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          list[index].mstNgMua.isEmpty && list[index].tendvinmua.isEmpty ?
                          SizedBox() :
                          list[index].mstNgMua.isEmpty ?
                          Text("${list[index].tendvinmua}", textAlign: TextAlign.start, style: text_action_Bold600) :
                          list[index].tendvinmua.isEmpty ?
                          Text("${list[index].mstNgMua}", textAlign: TextAlign.start, style: text_action_Bold600) :
                          Text("${list[index].mstNgMua} - ${list[index].tendvinmua}", textAlign: TextAlign.start, style: text_action_Bold600),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(list[index].ngayLapHoaDon, textAlign: TextAlign.start, style: text12OpacityBold400),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: list[index].tinhChat == "04" ?
                            Text("${list[index].adjustType == "-" ? list[index].adjustType : ""} ${list[index].tongTienThanhToan == null || list[index].tongTienThanhToan == "" ? "0" : Utils.covertToMoney(double.parse(list[index].tongTienThanhToan))} ${list[index].matte}", style: text14Red400, textAlign: TextAlign.start,):
                            Text("${list[index].tongTienThanhToan == null || list[index].tongTienThanhToan == "" ? "0" : Utils.covertToMoney(double.parse(list[index].tongTienThanhToan))} ${list[index].matte}", style: text14Red400, textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                      flex: 2,
                    ),

                    Expanded(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Số hóa đơn", style: text12OpacityBold400,),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text("${list[index].soHoaDonDoanhNghiep}", style: text16Bold600,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text("${Utils.convertStatusThongBao(list[index].trangThai)}",
                              style: TextStyle(
                                fontSize: 12,
                                color: list[index].trangThai == "NEWR" ? color2981DA :
                                        list[index].trangThai == "CKNG" || list[index].trangThai == "CCQT" ? colorYellow100 :
                                        list[index].trangThai == "SUCC" ? color219653 : colorD12129,
                                fontWeight: FontWeight.w400,
                              ),

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
      });
}
