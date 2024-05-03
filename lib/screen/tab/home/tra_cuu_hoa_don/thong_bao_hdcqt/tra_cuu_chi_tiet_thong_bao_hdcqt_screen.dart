import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/tra_cuu_thong_bao_cqt_controller.dart';
import 'package:mtax24/model/tra_cuu_thong_bao_cqt_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_tb_cqt/tra_cuu_thong_bao_cqt_response.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';

class TraCuuChiTietThongBaoHoaDonCQTScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final TraCuuThongBaoCqtResponse object;
  TraCuuChiTietThongBaoHoaDonCQTScreen(this.object);

  @override
  State<StatefulWidget> createState() => _TraCuuThongBaoScreenState();
}

class _TraCuuThongBaoScreenState extends State<TraCuuChiTietThongBaoHoaDonCQTScreen> with GetItStateMixin{
  TraCuuThongBaoCqtResponse response;
  var controller = GetIt.I<TraCuuThongBaoCQTController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.object != null){
      response = widget.object;
      print('===========: ${response.toJson()}');
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement buil
    registerHandler((TraCuuThongBaoCQTModel x) => x.error, (context, error, cancel) {
      DialogAlert.showDialogAlertCancel(context, error);
    });

    registerHandler((TraCuuThongBaoCQTModel x) => x.viewThongBaoCQT, (context, BaseResponse baseResponse, cancel) {
      if(baseResponse.htmlContent != null){
        ReadOpenFile(baseResponse.htmlContent, response.soThongBao);
      }else{
        DialogAlert.showDialogAlertCancel(context, baseResponse.message);
      }
    });

    registerHandler((TraCuuThongBaoCQTModel x) => x.chiTietThongBaoCQT, (context, BaseResponse baseResponse, cancel) {
      if(baseResponse.htmlContent != null){
        // Utils.saveAndOpenBase64ByEml(baseResponse.htmlContent);
      }
    });

    final loading = watchX((TraCuuThongBaoCQTModel x) => x.loading);
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Chi tiết thông báo hóa đơn CQT', showHome: true ),
        body: Stack(
          children: [
            AppbarScreen(title: 'Chi tiết thông báo hóa đơn CQT', isShowBack: true, isShowHome: true,
              heightBackgroundTop: 410.h,
              heightTop: EdgeInsets.only(top: 500.h),
              childrenAppBar: [
                ItemFilterTB("Số thông báo", response.soThongBao != null ? response.soThongBao : ""),
                ItemFilterTB("Ngày thông báo", Utils.convertTimestamp(response.ngayThongBao)),
              ],
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 40.h, left: 40.h),
                  child: Text("Thông tin hóa đơn".toUpperCase(), textAlign: TextAlign.start, style: text14OBold600,),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Mã số thuế", response.masothue != null ? response.masothue : ""),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Ký hiệu hóa đơn", response.khhdon != null ? response.khhdon : ""),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Số hóa đơn", response.sohd != null ? response.sohd : ""),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Tên tờ khai", response.tentkhai != null ? response.tentkhai : ""),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Loại thông báo", response.tentbao != null ? response.tentbao : "",),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Tệp đính kèm", response.mauso != null ? "${response.mauso}_${response.soThongBao}" : "",
                        onTap: (){
                          controller.viewTBThueApi(TraCuuDetailRequest(
                              id: response.id.toString()
                          ));
                        },
                        textStyle: text_action_font14_underLine
                      ),
                    ),
                    // TODO them neu co phan thong bao loi
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Mã lỗi", (response.maLoi != "") ?  response.maLoi : "Không"),
                    ),
                    Divider(height: 1,),
                    Padding(
                      padding: EdgeInsets.all(40.h),
                      child: ItemFilterTB("Mô tả lỗi", (response.moTaLoi != "") ? response.moTaLoi : "Không"),
                    )
                  ],

                ),
              ],
            ),


            loading ? LoadingWidget() : Container(),

          ],
        )
    );
  }

}

