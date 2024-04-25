import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/lap_hoa_don/hang_hoa_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/service/api_service/request/lap_hoa_don/get_list_hang_hoa_by_ma_request.dart';
import 'package:mtax24/service/init.dart';

import '../../../../init_view.dart';

class ListGoodsScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final String invoiceType;


  ListGoodsScreen({this.invoiceType});

  @override
  State<StatefulWidget> createState() => _ListGoodsScreenState();

}
class _ListGoodsScreenState extends State<ListGoodsScreen> with GetItStateMixin {

  TextEditingController maHHController = TextEditingController();
  List<GetListHangHoaByMaResponse> listHangHoa = [];
  var controller = GetIt.I<HangHoaController>();
  String mst = '', invoiceType = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharePreferUtils.getUserInfo().then((value) {
      mst = value.tin;
      invoiceType = widget.invoiceType;
      controller.getListHangHoaByMa(GetListHangHoaByMaRequest(
        taxCode: value.tin,
        invoiceType: widget.invoiceType,
        currency: "VND",
        maHHoa: "",
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    registerHandler((HangHoaModel x) => x.lstHangHoaByMa, (context, List<GetListHangHoaByMaResponse> list, cancel) {
      if(list.isNotEmpty){
        listHangHoa = list;
      }
    });
    final loading = watchX((HangHoaModel x) => x.loading);

    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Danh sách hàng hóa', showHome: false ),
        body: Stack(
          children: [
            CustomerListViewAppbarScreen(title: 'Danh sách hàng hóa', isShowBack: true, isShowHome: false,
              children: SingleChildScrollView(
                child: CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            // readOnly: true,
                            // showCursor: false,
                            textEditingController: maHHController,
                            hintText: "Mã hàng hóa, dịch vụ",
                            onChangedCustom: (values) {
                              controller.getListHangHoaByMa(GetListHangHoaByMaRequest(
                                taxCode: mst,
                                invoiceType: invoiceType,
                                currency: "VND",
                                maHHoa: values,
                              ));
                            },
                          ),
                        ),
                        listHangHoa != null && listHangHoa.length > 0 ?
                        IitemViewGoods(context,) : SizedBox(),
                      ],

                    ),
                  ],
                ),
              )
            ),
            loading ? LoadingWidget() : Container()
          ],
        )
    );
  }


  Widget IitemViewGoods(BuildContext context){
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: listHangHoa.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pop(context, listHangHoa[index]);
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listHangHoa[index].tenHHoa, textAlign: TextAlign.start, style: text14Bold600,),
                                Row(
                                  children: [
                                    Text("${listHangHoa[index].donGia != null ? Utils.covertToMoney(listHangHoa[index].donGia) : 0.0} đ", textAlign: TextAlign.start, style: text12Red400,),
                                    Text("/${listHangHoa[index].dvTinh}", textAlign: TextAlign.start, style: text12OpacityBold400,),
                                  ],
                                )
                              ],
                            )



                        ),
                        Container(
                          child: Center(child: Text("Mã số: ${listHangHoa[index].maHHoa}", style: text12OpacityBold400,)),
                          width: MediaQuery.of(context).size.width / 5,
                        ),

                      ],
                    ),
                  ),

                  Divider()
                ],
              )
          );
        });
  }
}
