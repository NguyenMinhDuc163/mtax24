import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/tra_cuu_thong_bao_cqt_controller.dart';
import 'package:mtax24/model/tra_cuu_thong_bao_cqt_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao_hdcqt/tra_cuu_chi_tiet_thong_bao_hdcqt_screen.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_request.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_response.dart';
import '../../../../init_view.dart';
import 'filter_thong_bao_hd_cqt_screen.dart';

class TraCuuThongBaoHoaDonCQTScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _TraCuuThongBaoScreenState();
}

class _TraCuuThongBaoScreenState extends State<TraCuuThongBaoHoaDonCQTScreen> with GetItStateMixin{

  TextEditingController tuNgayController = TextEditingController();
  TextEditingController denNgayController = TextEditingController();

  String errorTuNgay, errorDenNgay;
  String tuNgay = "", denNgay = "", loaiTb = '';
  var dropLoaiTB;
  int page = 1;
  ScrollController _scrollController;
  List<TraCuuThongBaoCqtResponse> lstThongBao = [];

  FilterObjectTBHDCQT filterObjectTB;
  
  var controller = GetIt.I<TraCuuThongBaoCQTController>();

  String noData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    DateTime pastMonth = DateTime.now().subtract(Duration(days: 30));
    tuNgay = new DateFormat('dd/MM/yyyy').format(pastMonth);
    denNgay = new DateFormat('dd/MM/yyyy').format(now);
    tuNgayController.text = tuNgay;
    denNgayController.text = denNgay;
    _scrollController = new ScrollController()..addListener(_loadMore);
    traCuu();
  }

  void _loadMore() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        page ++;
      });
      traCuu();
    }
  }
  void traCuu(){
    controller.traCuuTBCQT(TraCuuThongBaoCqtRequest(
      loaitbao: loaiTb,
      fromDate: tuNgayController.text,
      toDate: denNgayController.text,
      page: page.toString(),

    ));

    // print("----------------${tuNgayController.text}");
    // print("----------------${denNgayController.text}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((TraCuuThongBaoCQTModel x) => x.lstThongBaoCQT, (context, List<TraCuuThongBaoCqtResponse> list, cancel) {
      if(list.isNotEmpty){
        lstThongBao.addAll(list);
      }else{
        noData = "Không tìm thấy dữ liệu!";
      }

    });

    final loading = watchX((TraCuuThongBaoCQTModel x) => x.loading);
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Thông báo hóa đơn CQT', showHome: true ),
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: "Thông báo hóa đơn CQT", isShowBack: true, isShowHome: true,
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
                              // TODO tra cuu
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () async {
                                        final resutl = await Navigator.push(
                                            context, new MaterialPageRoute(builder: (context) => FilterThongBaoHDCQTScreen(object: filterObjectTB, tuNgay: tuNgay, denNgay: denNgay,)));
                                        if(resutl != null){
                                          setState(() {
                                            filterObjectTB = resutl;
                                            tuNgay = filterObjectTB.tuNgay;
                                            denNgay = filterObjectTB.denNgay;
                                            loaiTb = filterObjectTB.loaiTB;
                                            page = 1;
                                            lstThongBao.clear();
                                            noData = "";
                                            tuNgayController.text = tuNgay;
                                            denNgayController.text = denNgay;
                                            print("----------------${tuNgayController.text}");
                                            print("----------------${denNgayController.text}");
                                            traCuu();
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.filter_alt_outlined, size: 112.sp,)
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 40.h,),
                          lstThongBao != null && lstThongBao.length > 0 ?
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: lstThongBao.length ?? 0,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context, new MaterialPageRoute(builder: (context) => TraCuuChiTietThongBaoHoaDonCQTScreen(lstThongBao[index])));
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20.h),
                                            child: Icon(Icons.notifications_none_rounded, color: color_background, size: 35,),
                                          ),

                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                lstThongBao[index].tentkhai != null &&  lstThongBao[index].tentkhai != ""?
                                                Text("${lstThongBao[index].tentkhai == null ? "" : lstThongBao[index].tentkhai}", textAlign: TextAlign.start, style: text_action_Bold600)
                                                    : SizedBox(height: 10.h,),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10.h),
                                                  child: Text(lstThongBao[index].soThongBao, textAlign: TextAlign.start, style: text14Bold400,),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10.h),
                                                  child: Row(
                                                    children: [
                                                      Text("${lstThongBao[index].ngayThongBao == null || lstThongBao[index].ngayThongBao == "" ? "" : Utils.convertTimestamp(lstThongBao[index].ngayThongBao)}", style: text12Bold400, textAlign: TextAlign.start,),
                                                    ],
                                                  ),
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
                                                Text("Hóa đơn", style: text12OpacityBold400,),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10.h),
                                                  child: Text("${lstThongBao[index].sohd == null ? "0" : lstThongBao[index].sohd}", style: text16Bold600,),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10.h),
                                                  child: Text("${lstThongBao[index].mauso == null ? "" : lstThongBao[index].mauso}", style: text16Bold600,),
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
                                  )
                                );
                              }) :
                          Container(child: Center(child: Text("$noData", style: text_action_font14,)),),
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

