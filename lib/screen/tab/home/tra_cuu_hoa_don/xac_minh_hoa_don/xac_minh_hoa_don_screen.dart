import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/scan_qr_invoice_screen.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/view_hoa_don_request.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/xac_minh_hoa_don_request.dart';
import 'package:mtax24/service/api_service/response/tra_cuu_hoa_don/xac_minh_hoa_don_response.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';

class XacMinhHoaDonScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  static const String routeName = "/XacMinhHoaDonScreen";
  final bool showHome;

  XacMinhHoaDonScreen({Key key, this.showHome}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TXacMinhHoaDonScreenState();
}

class _TXacMinhHoaDonScreenState extends State<XacMinhHoaDonScreen> with GetItStateMixin{

  TextEditingController maController = TextEditingController();
  var controller = GetIt.I<HoaDonBanHangController>();
  XacMinhHoaDonResponse xacMinhHoaDonResponse;
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token();
  }

  void token() async {
    String token = await SharePreferUtils.getAccessToken();
    if(token == null) return;
    if(token.isNotEmpty){
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((HoaDonBanHangModel x) => x.xacMinhHoaDon, (context, XacMinhHoaDonResponse response, cancel) {
      if(response != null){
        xacMinhHoaDonResponse = response;
      }

    });
    registerHandler((HoaDonBanHangModel x) => x.viewHoaDon, (context, ViewHDonResponse response, cancel) {
      if(response != null){
        print("responst: ${response.toJson()}");
        ReadOpenFile(response.htmlContent, xacMinhHoaDonResponse.iccInvHdr.sohdcqt);
      }

    });

    registerHandler((HoaDonBanHangModel x) => x.error, (context, String error, cancel) {
      if(error != null && error != "") {
        DialogAlert.showDialogAlertCancel(context, error);
      }
    });


    final loading = watchX((HoaDonBanHangModel x) => x.loading);
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Xác minh hóa đơn', showHome: widget.showHome ?? true ),
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: "Xác minh hóa đơn", isShowBack: true, isShowHome: isLogin,
              children:  ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.h, right: 40.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quý khách vui lòng nhập thông tin ${'"kiểm tra"'} hoặc quét mã QR CODE để thực hiện Xác minh hóa đơn đã được nhận.", style: text14OBold400,),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: maController,
                            hintText: "Mã xác minh",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ButtonBottomNotStackWidget(
                                title: "Xác minh",
                                onPressed: (){
                                  FocusScope.of(context).unfocus();
                                  controller.xacMinhHoaDon(XacMinhHoaDonRequest(
                                      maKTra: maController.text
                                  ));

                                },
                              ),
                            ),
                            IconButton(onPressed: (){
                              Navigator.of(context).pushNamed(ScanQRInvoiceScreen.routeName);
                            }, icon: Icon(Icons.qr_code_2, size: 100.sp,))
                          ],
                        ),
                        SizedBox(height: 40.h,),
                        xacMinhHoaDonResponse != null ?
                        ItemContent(context, xacMinhHoaDonResponse) : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            loading ? LoadingWidget() : Container(),
          ],
        )
    );
  }


  Widget ItemContent(BuildContext context, XacMinhHoaDonResponse response){
    return Column(
      children: [
        rowItem("Cơ quan thuế quản lý", response.iccInvHdr.tencqt, false, onTap: null),
        rowItem("Số hóa đơn", response.iccInvHdr.sohdcqt, true, onTap: (){
          controller.viewHoaDon(ViewHDonRequest(
            trangThai: response.iccInvHdr.trangthai,
            tinhChat: response.iccInvHdr.tinhchatgoc,
            id: response.iccInvHdr.id,
            loaiHoaDon: response.iccInvHdr.loaihdon
          ));
        }),
        rowItem("MST người bán", response.iccInvHdr.mstNban, false, onTap: null),
        rowItem("Loại hóa đơn", response.iccInvHdr.loaihdon, false, onTap: null),
        rowItem("Tính chất hóa đơn", response.iccInvHdr.tinhchatgoc, false, onTap: null),
        SizedBox(height: 40.h,),
      ],

    );
  }

  Widget rowItem(String name, String value, bool isClick, {@required Function onTap}){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.h),
          child: Row(
            children: [
              Expanded(child: Text(name)),
              // isClick
              Expanded(child: InkWell(onTap: onTap, child: Text(value, style: isClick ? text_action_font14 : text14Bold400,))),
            ],
          ),
        ),
        
        Divider()
      ],
    );
  }

}

class InvoiceVerifyArguments {
  final bool showHome;
  InvoiceVerifyArguments({this.showHome});

}
