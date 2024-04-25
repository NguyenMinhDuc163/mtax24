import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/create_report/create_report_sold_invoice_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/data_synthesis/report_data_synthesis_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/report/report_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/usage_report/report_usage_invoice_screen.dart';
import 'package:mtax24/screen/tab/home/khau_tru/bao_cao_khau_tru_screen.dart';
import 'package:mtax24/screen/tab/home/khau_tru/lap_chung_tu_screen.dart';
import 'package:mtax24/screen/tab/home/khau_tru/phe_duyet_chung_tu_screen.dart';
import 'package:mtax24/screen/tab/home/khau_tru/tra_cuu_chung_tu_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/hoa_don_bh/tra_cuu_hoa_don_bh_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao/tra_cuu_thong_bao_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/thong_bao_hdcqt/tra_cuu_thong_bao_hd_cqt_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/tra_cuu_tong_hop_hd/tra_cuu_tong_hop_du_lieu_hd_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/xac_minh_hoa_don_screen.dart';
import 'package:mtax24/service/init.dart';
import '../../init_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mtax24/screen/components/styles/style.dart';


class ListFuntionVertical extends StatelessWidget {
  final String title;
  final List<Contain> datas;
  final BuildContext contextParent;

  const ListFuntionVertical(
      {Key key, this.title, this.datas, this.contextParent})
      : super(key: key);

  Future<void> onTabIcon(Contain item, BuildContext context) async {
    print("#######: ${item.moduleId}");
    switch (item.moduleId) {
      //nộp thuế
      case "TCHDBanHang":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => TraCuuHoaDonBHScreen()));
        break;
      case "TCThongBao":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => TraCuuThongBaoScreen()));
        break;
      case "ThongBaoHĐCQT":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => TraCuuThongBaoHoaDonCQTScreen()));
        break;
      case "TCDuLieuHD":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => TraCuuTongHopHdScreen()));
        break;
      case "XacMinhHD":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => XacMinhHoaDonScreen()));
        break;
      case "LapBaoCao":
        Navigator.of(context).pushNamed(ReportScreen.routeName);
        break;
      case "BCBanKeBan":
        Navigator.of(context).pushNamed(CreateReportSoldInvoiceScreen.routeName);
        break;
      case "BCSuDungHD":
        Navigator.of(context).pushNamed(ReportUsageInvoiceScreen.routeName);
        break;
      case "BCTongHopDL":
        Navigator.of(context).pushNamed(ReportDataSynthesisScreen.routeName);
        break;
      case "LapChungTu":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => LapChungTuScreen()));
        break;
      case "PheDuyetChungTu":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => PheDuyetChungTuScreen()));
        break;
      case "TraCuuChungTu":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => TraCuuChungTuScreen()));
        break;
      case "BCBangKeChungTu":
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => BaoCaoKhauTruScreen()));
        break;



      case "ChiaSe":
        Utils.share();
        break;
      default:
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Tax24-e-invoice',
        text: 'Tax24-e-invoice',
        linkUrl: 'https://online.iigvietnam.com/',
        chooserTitle: 'Chia sẻ qua ứng dụng');
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //     padding: EdgeInsets.only(left: 8, bottom: 4, right: 8, top: 24),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        //       // color: Color(0x15FFFFFF),
        //
        //     ),
        //     child: Text(
        //       title.tr().toUpperCase() ?? title.tr().toUpperCase(),
        //       style: text_fontSize14_717788,
        //
        //     )
        // ),
        // SizedBox(height: 16,),
        Container(
          padding: EdgeInsets.only(left: 16.h, right: 16.h),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.w,),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: EdgeInsets.all(8),
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      onTabIcon(datas[index], context);
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          color: colorWhite,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(26.h)),
                            side: BorderSide(
                              color: colorEDEDED.withOpacity(0.2),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.h),
                            child: Container(
                              width: 70.w,
                              height: 70.h,
                              child: SvgPicture.asset(datas[index].icon, color: color_background,)
                            ),
                          ),


                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            datas[index].displayName.tr() ?? '',
                            textAlign: TextAlign.center,
                            style: text_action_font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },

          ),
        ),
      ],
    );

  }
}
