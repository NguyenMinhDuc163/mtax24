import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/hoa_don_bh/filter_tra_cuu_hoa_don_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/hoa_don_bh/hoa_don_chi_tiet_screen.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/tra_cuu_hoa_don_request.dart';
import 'package:mtax24/service/init.dart';
import '../../../../components/widget/search_panel_widget.dart';
import '../../../../init_view.dart';

class TraCuuHoaDonBHScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _TraCuuHoaDonBHScreenState();
}

class _TraCuuHoaDonBHScreenState extends State<TraCuuHoaDonBHScreen> with GetItStateMixin, WidgetsBindingObserver{

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
    WidgetsBinding.instance.addObserver(this);
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
          statusCQT: "",
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
          statusCQT: filterObjectTc.statusCQT ,
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
          statusCQT: "",
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
    String statusCQT,
  }){
    controller.traCuuHoadonBh(TraCuuHoaDonRequest(
      mstNban: mstNban ?? '',
      emailnmua: emailnmua ?? '',
      fromDate: tuNgay ?? '',
      fromDateNgayHDon: "",
      fromDateShow: "",
      idNguoilap: idNguoiLap ?? '',
      kyHieuHDon: kyHieuHDon ?? '',
      loaihdon: loaihdon ?? '',
      mauhdon: mauhdon ?? '',
      maXacMinh: "",
      mstNmua: mstNmua ?? '',
      page: page ?? '',
      sohdon: sohdon ?? '',
      soHoaDonCqt: "",
      tinhChat: tinhChat ?? '',
      toDate: denNgay ?? '',
      toDateNgayHDon: "",
      toDateShow: "",
      trangThai: trangThai ?? '',
      statusCQT: statusCQT ?? '',
    ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('appLifeCycleState $state');
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((HoaDonBanHangModel x) => x.lstTraCuuHDBH, (context, List<TraCuuHoaDonResponse> lst, cancel) {
      if(lst.isNotEmpty){
        lstHoaDon.addAll(lst);
      }else{
        noData = "Không tìm thấy dữ liệu!";
      }
    });
    registerHandler((HoaDonBanHangModel x) => x.hoaDonChiTiet, (context, TraCuuHoaDonChiTietResponse response, cancel) async{
      chiTietResponse = response;
      await Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HoaDonChiTietScreen(object: chiTietResponse,)));

      // sau khi nguoi dung sua data thi load lai data
      lstHoaDon.clear();
      controller.traCuuHoadonBh(TraCuuHoaDonRequest(
        mstNban: mstNban,
        emailnmua: filterObjectTc != null ? filterObjectTc.emailNguoiMua : "",
        fromDate: tuNgay,
        fromDateNgayHDon: "",
        fromDateShow: "",
        idNguoilap: idNguoiLap,
        kyHieuHDon: filterObjectTc != null ? filterObjectTc.kyHieuHoaDon : "",
        loaihdon: filterObjectTc != null ? filterObjectTc.loaiHdID : "",
        mauhdon: filterObjectTc != null ? filterObjectTc.mauHoaDon : "",
        maXacMinh: "",
        mstNmua: filterObjectTc != null ? filterObjectTc.mstNguoiMua : "",
        page: 1,
        sohdon: filterObjectTc != null ? filterObjectTc.soHoaDon : "",
        soHoaDonCqt: "",
        tinhChat: filterObjectTc != null ? filterObjectTc.tinhChatId : "",
        toDate: denNgay,
        toDateNgayHDon: "",
        toDateShow: "",
        trangThai: filterObjectTc != null ? filterObjectTc.trangThaiTbId : "",
        statusCQT: filterObjectTc != null ? filterObjectTc.statusCQT : "",
      ));
    });

    final loading = watchX((HoaDonBanHangModel x) => x.loading);

    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            lstHoaDon.clear();
            controller.traCuuHoadonBh(TraCuuHoaDonRequest(
              mstNban: mstNban,
              emailnmua: filterObjectTc != null ? filterObjectTc.emailNguoiMua : "",
              fromDate: tuNgay,
              fromDateNgayHDon: "",
              fromDateShow: "",
              idNguoilap: idNguoiLap,
              kyHieuHDon: filterObjectTc != null ? filterObjectTc.kyHieuHoaDon : "",
              loaihdon: filterObjectTc != null ? filterObjectTc.loaiHdID : "",
              mauhdon: filterObjectTc != null ? filterObjectTc.mauHoaDon : "",
              maXacMinh: "",
              mstNmua: filterObjectTc != null ? filterObjectTc.mstNguoiMua : "",
              page: 1,
              sohdon: filterObjectTc != null ? filterObjectTc.soHoaDon : "",
              soHoaDonCqt: "",
              tinhChat: filterObjectTc != null ? filterObjectTc.tinhChatId : "",
              toDate: denNgay,
              toDateNgayHDon: "",
              toDateShow: "",
              trangThai: filterObjectTc != null ? filterObjectTc.trangThaiTbId : "",
              statusCQT: filterObjectTc != null ? filterObjectTc.statusCQT : "",
            ));
          },
          child: Stack(
            children: [
              CustomerListViewAppbarScreen(title: "Tra cứu hóa đơn bán hàng", isShowBack: true, isShowHome: true,
                children: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
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
                                              context, new MaterialPageRoute(builder: (context) => FilterTraCuuHoaDonScreen(object: filterObjectTc, tuNgay: tuNgay, denNgay: denNgay,)));
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
                                                statusCQT: filterObjectTc.statusCQT,
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
        )
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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


            child: SearchPanelWidget(taxCode: list[index].mstNgMua ?? "", companyName: list[index].tendvinmua ?? "", money: list[index].tongTienThanhToan ?? "",
            moneyType: list[index].matte ?? "", invoiceSymbol: list[index].khieuhdon ?? "", invoiceStatus: list[index].trangThai ?? "",
                invoiceAttributes: Utils.convertTinhChatHoaDon(list[index].tinhChat) ?? "", invoiceNumber: list[index].soHoaDonDoanhNghiep ?? "",invoiceCQT: list[index].trangthaiCQT ?? "",
              invoiceDate: list[index].ngayLapHoaDon ?? "", nameCustomer: list[index].tenNmua ?? ""
            )

            
        );
      });
}

