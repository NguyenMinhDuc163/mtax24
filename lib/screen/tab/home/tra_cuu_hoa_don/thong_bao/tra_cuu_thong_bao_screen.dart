import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';
import 'chi_tiet_thong_bao_screen.dart';
import 'filter_thong_bao_screen.dart';

class TraCuuThongBaoScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _TraCuuThongBaoScreenState();
}

class _TraCuuThongBaoScreenState extends State<TraCuuThongBaoScreen> with GetItStateMixin{

  String tuNgay = "", denNgay = "", mstNban = "", idNguoiLap = "";
  int page = 1;
  ScrollController _scrollController;
  String nameFile = "";

  var controller = GetIt.I<ThongBaoController>();
  List<TraCuuThongBaoResponse> lstThongBao = [];
  FilterObjectTB filterObjectTB;
  String noData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    DateTime pastMonth = DateTime.now().subtract(Duration(days: 30));
    tuNgay = new DateFormat('dd/MM/yyyy').format(pastMonth);
    denNgay = new DateFormat('dd/MM/yyyy').format(now);
    _scrollController = new ScrollController()..addListener(_loadMore);
    SharePreferUtils.getUserInfo().then((value) {
      mstNban = value.tin;
      idNguoiLap = value.userId;
      traCuu(loaiHd: "", tinhChat: "", loaiTb: "", soTb: "", trangThai: "",);
    });

  }

  void _loadMore() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        page ++;
      });
      if(filterObjectTB != null) {
        traCuu(loaiHd: filterObjectTB.loaiHdID, trangThai: filterObjectTB.trangThaiTbId, tinhChat: filterObjectTB.tinhChatId, loaiTb: filterObjectTB.loaiHdID, soTb: filterObjectTB.soTb);
      }else {
        traCuu(loaiHd: "", tinhChat: "", loaiTb: "", soTb: "", trangThai: "",);
      }
    }
  }
  void traCuu({String loaiHd, String tinhChat, String loaiTb, String soTb, String trangThai}){
    controller.traCuuThongBao(TraCuuThongBaoRequest(
     loaiHoaDon: loaiHd,
     tinhChat: tinhChat,
     toDateShow: DateTime.now(),
     toDate: denNgay,
     page: page,
     idNguoilap: idNguoiLap,
     fromDateShow: DateTime.now().subtract(Duration(days: 30)),
      fromDate: tuNgay,
      mstNban: mstNban,
      loaiTBao: loaiTb,
      soThongBao: soTb,
      trangthai: trangThai,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((ThongBaoModel x) => x.lstThongBao, (context, List<TraCuuThongBaoResponse> list, cancel) {
      if(list.isNotEmpty){
        lstThongBao.addAll(list);
        // lstThongBao.forEach((element) {
        //   print("========sotbao: ${element.sotbao}");
        //   print("========status: ${element.status}");
        // });
      }else{
        noData = "Không tìm thấy dữ liệu!";
      }

    });

    registerHandler((ThongBaoModel x) => x.chiTietThongBao, (context, BaseResponse baseResponse, cancel) {
      final objectConverted = jsonDecode(baseResponse?.object);
      if(objectConverted == null || objectConverted == ""){
        if(baseResponse.htmlContent != null){
          ReadOpenFile(baseResponse.htmlContent, nameFile);
        }
      }else if(objectConverted != null) {
        ChiTietThongBaoResponse chiTietThongBaoResponse = ChiTietThongBaoResponse.fromJson(jsonDecode(baseResponse?.object));
        if(chiTietThongBaoResponse.thongBaoHdr.status == "NEWR"){
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => ChiTietThongBaoScreen(object: chiTietThongBaoResponse, type: "TB",)));
        }else if(baseResponse.htmlContent != null){
          ReadOpenFile(baseResponse.htmlContent, nameFile);
        }
      }
    });

    final loading = watchX((ThongBaoModel x) => x.loading);
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Tra cứu thông báo', showHome: true ),
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: "Tra cứu thông báo hoá đơn", isShowBack: true, isShowHome: true,
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
                                            context, new MaterialPageRoute(builder: (context) => FilterThongBaoScreen(object: filterObjectTB, tuNgay: tuNgay, denNgay: denNgay,)));
                                        if(resutl != null){
                                          setState(() {
                                            filterObjectTB = resutl;
                                            tuNgay = filterObjectTB.tuNgay;
                                            denNgay = filterObjectTB.denNgay;
                                            page = 1;
                                            lstThongBao.clear();
                                            noData = "";
                                            traCuu(loaiHd: filterObjectTB.loaiHdID, trangThai: filterObjectTB.trangThaiTbId, tinhChat: filterObjectTB.tinhChatId,
                                                loaiTb: filterObjectTB.loaiHdID, soTb: filterObjectTB.soTb);
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
                                      nameFile = lstThongBao[index].sotbao;
                                      controller.chiTietThongBao(ChiTietThongBaoRequest(
                                          tinhChat: lstThongBao[index].tinhChat,
                                          loaiHoaDon: lstThongBao[index].loaitbao,
                                          id: lstThongBao[index].id,
                                          trangThai: lstThongBao[index].status
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
                                              child: Icon(Icons.notifications_none_rounded, color: color_background, size: 35,),
                                            ),

                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  lstThongBao[index].tinhChat.isNotEmpty ?
                                                  Text("${Utils.convertTinhChatThongBao(lstThongBao[index].tinhChat)}", textAlign: TextAlign.start, style: text_action_Bold600) : SizedBox(height: 4,),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10.h),
                                                    child: Text(lstThongBao[index].ngayLap, textAlign: TextAlign.start, style: text12OpacityBold400,),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10.h),
                                                    child: Row(
                                                      children: [
                                                        Text("${lstThongBao[index].sotbao == null || lstThongBao[index].sotbao == "" ? "" : "${lstThongBao[index].sotbao} | "  }", style: text12Bold400, textAlign: TextAlign.start,),
                                                        Text("${Utils.convertStatusThongBao(lstThongBao[index].status)}",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: lstThongBao[index].status == "NEWR" ? color2981DA :
                                                            lstThongBao[index].status == "CKNG" || lstThongBao[index].status == "CCQT" ? colorYellow100 :
                                                            lstThongBao[index].status == "SUCC" ? color219653 : colorD12129,
                                                            fontWeight: FontWeight.w400,
                                                          ),

                                                        ),
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
                                                    child: Text("${(lstThongBao[index].sohdongoc == null || lstThongBao[index].sohdongoc == 'null') ? '0' : lstThongBao[index].sohdongoc}", style: text16Bold600,),
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

// Widget ItemFilterTB(String name, String values){
//   return Column(
//     children: [
//       Row(
//         children: [
//           Expanded(
//               child: Text("$name", style: text16Bold400,)
//           ),
//           Expanded(
//               child: Text("$values", style: text16Bold400,)
//           ),
//         ],
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//         child: Divider(),
//       )
//     ],
//   );
// }
