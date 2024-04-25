import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/hoa_don_bh/tra_cuu_hoa_don_bh_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao/tra_cuu_thong_bao_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao_hdcqt/tra_cuu_thong_bao_hd_cqt_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/xac_minh_hoa_don_screen.dart';
import '../../../init_view.dart';
import 'tra_cuu_tong_hop_hd/tra_cuu_tong_hop_du_lieu_hd_screen.dart';

class TraCuuHoaDonScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _TraCuuHoaDonScreenState();
}

class _TraCuuHoaDonScreenState extends State<TraCuuHoaDonScreen> with GetItStateMixin{


  var controller = GetIt.I<LapHoaDonController>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Scaffold(
        appBar: buildAppBarMenuCustom(context, 'Tra cứu hóa đơn', showHome: true ),
        body: Stack(
          children: [
              CardWidget(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemTraCuuHoaDon(context),
                    ],

                  ),
                ],
              )
          ],
        )
    );
  }


  Widget ItemTraCuuHoaDon(BuildContext context){
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => TraCuuHoaDonBHScreen()));
          },
          child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ]
              ),

              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Tra cứu hóa đơn bán hàng"),
                  )),
                  Icon(Icons.navigate_next),
                ],
              )

          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => TraCuuThongBaoScreen()));
          },
          child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ]
              ),

              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Tra cứu thông báo"),
                  )),
                  Icon(Icons.navigate_next),
                ],
              )

          ),
        ),

        InkWell(
          onTap: (){
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => TraCuuThongBaoHoaDonCQTScreen()));
          },
          child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ]
              ),

              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Thông báo hóa đơn CQT"),
                  )),
                  Icon(Icons.navigate_next),
                ],
              )

          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => TraCuuTongHopHdScreen()));
          },
          child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ]
              ),

              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Tra cứu bảng tổng hợp dữ liệu hóa đơn"),
                  )),
                  Icon(Icons.navigate_next),
                ],
              )

          ),
        ),

        InkWell(
          onTap: (){
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => XacMinhHoaDonScreen()));
          },
          child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ]
              ),

              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Xác minh hóa đơn"),
                  )),
                  Icon(Icons.navigate_next),
                ],
              )

          ),
        ),

      ],
    );
  }
}
