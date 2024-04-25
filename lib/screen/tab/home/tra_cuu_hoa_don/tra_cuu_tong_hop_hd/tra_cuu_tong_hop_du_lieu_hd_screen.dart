import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/tra_cuu_tong_hop_hd_controller.dart';
import 'package:mtax24/model/tra_cuu_tong_hop_hd_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/tra_cuu_tong_hop_hd/view_tong_hop_hoa_don_screen.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tong_hop_hd/list_bang_thop_response.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';
import 'filter_tra_cuu_tong_hop_hd_screen.dart';

class TraCuuTongHopHdScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _TraCuuThongBaoScreenState();
}

class _TraCuuThongBaoScreenState extends State<TraCuuTongHopHdScreen> with GetItStateMixin{

  String tuNgay = "", denNgay = "";
  int page = 1;
  ScrollController _scrollController;
  List<TraCuuBthhdResponse> lstThongBao = [];
  TraCuuTongHopHDRequest objectTB;
  var controller = GetIt.I<TraCuuTongHopHDController>();
  String noData = "";
  String nameFile ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    DateTime pastMonth = DateTime.now().subtract(Duration(days: 30));
    tuNgay = new DateFormat('dd/MM/yyyy').format(pastMonth);
    denNgay = new DateFormat('dd/MM/yyyy').format(now);
    _scrollController = new ScrollController()..addListener(_loadMore);

    traCuu(loaitbao: "", trangThai: "",);
  }

  void _loadMore() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        page ++;
      });
      if(objectTB != null) {
        traCuu(loaitbao: objectTB.loaitbao, trangThai: objectTB.status);
      }else {
        traCuu(loaitbao: "", trangThai: "",);
      }
    }
  }
  void traCuu({String loaitbao, String trangThai}){
    controller.traCuuBTH(TraCuuTongHopHDRequest(
      loaitbao: loaitbao,
      fromDate: tuNgay,
      toDate: denNgay,
      status: trangThai,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((TraCuuTongHopHDModel x) => x.error, (context, error, cancel) {
      DialogAlert.showDialogAlertCancel(context, error);
    });

    registerHandler((TraCuuTongHopHDModel x) => x.lstBangTongHopHD, (context, List<TraCuuBthhdResponse> list, cancel) {
      if(list.isNotEmpty){
        lstThongBao.addAll(list);
      }else{
        noData = "Không tìm thấy dữ liệu!";
      }

    });

    registerHandler((TraCuuTongHopHDModel x) => x.viewBangTongHopHD, (context, ListBangThopResponse baseResponse, cancel) {
      if(baseResponse.listBangThop != null && baseResponse.listBangThop.length > 0){
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => ViewTongHopHDScreen(baseResponse)));
      }else{
        DialogAlert.showDialogAlertCancel(context, "Không có dữ liệu");
      }
    });


    final loading = watchX((TraCuuTongHopHDModel x) => x.loading);
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Tra cứu bảng tổng hợp dữ liệu hóa đơn', showHome: true ),
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: "Tra cứu bảng tổng hợp dữ liệu hóa đơn", isShowBack: true, isShowHome: true,
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
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () async {
                                        final resutl = await Navigator.push(
                                            context, new MaterialPageRoute(builder: (context) => FilterTraCuuTongHopHDScreen(object: objectTB, tuNgay: tuNgay, denNgay: denNgay,)));
                                        if(resutl != null){
                                          setState(() {
                                            objectTB = resutl;
                                            tuNgay = objectTB.fromDate;
                                            denNgay = objectTB.toDate;
                                            page = 1;
                                            lstThongBao.clear();
                                            noData = "";
                                            traCuu(loaitbao: objectTB.loaitbao, trangThai: objectTB.status);

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
                                      nameFile = lstThongBao[index].mso;
                                      controller.viewBTHApi(TraCuuDetailRequest(
                                          id: lstThongBao[index].id
                                      ));
                                    },
                                    child: Column(
                                      children: [
                                        Row(
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
                                                  Text(lstThongBao[index].tnnt == null ? "" : lstThongBao[index].tnnt, style: text_action_Bold600),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10.h),
                                                    child: Text(lstThongBao[index].mst == null ? "" : lstThongBao[index].mst, style: text14Bold400),
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10.h),
                                                    child: Text("${Utils.convertTimestamp(lstThongBao[index].createTime)}", style: text12OpacityBold400,),
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
                                                  lstThongBao[index].ldau != null ?
                                                  Text(lstThongBao[index].ldau == "1" ? "Lần đầu" : "Bổ sung", style: text16Bold600, textAlign: TextAlign.end,) :
                                                  Container(),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10.h),
                                                    child: Text("${Utils.convertStatusThongBao(lstThongBao[index].status)}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: lstThongBao[index].status == "NEWR" ? color2981DA :
                                                        lstThongBao[index].status == "CKNG" || lstThongBao[index].status == "CCQT" ? colorYellow100 :
                                                        lstThongBao[index].status == "SUCC" ? color219653 : colorD12129,
                                                        fontWeight: FontWeight.w400,
                                                      ),

                                                    ),
                                                  ),
                                                  // Text(Utils.convertStatusThongBao(lstThongBao[index].status), style: text_action_font14, textAlign: TextAlign.end,)
                                                ],
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),

                                        // Row(
                                        //   children: [
                                        //     Expanded(flex: 3, child: Text(lstThongBao[index].kdlieu == null ? "" : lstThongBao[index].kdlieu)),
                                        //     Expanded(flex: 1, child: lstThongBao[index].ldau != null ? Text(lstThongBao[index].ldau == "1" ? "Lần đầu" : "Bổ sung", textAlign: TextAlign.end,) : Container())
                                        //   ],
                                        // ),
                                        // SizedBox(height: 4,),
                                        // Row(
                                        //   children: [
                                        //     Expanded(child: Text("${Utils.convertTimestamp(lstThongBao[index].createTime)}", style: text_action_font14,)),
                                        //     Expanded(child: Text(Utils.convertStatusThongBao(lstThongBao[index].status), style: text_action_font14, textAlign: TextAlign.end,))
                                        //   ],
                                        // ),
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

