

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/service/init.dart';

import '../../../../init_view.dart';
import 'them_moi_screen.dart';

class DanhSachThemMoiScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final int type;
  final String invoiceType;
  final List<dynamic> listHangHoa;
  final bool isTraCuu;
  final String trangThai;


  DanhSachThemMoiScreen({this.type, this.invoiceType, this.listHangHoa, this.isTraCuu, this.trangThai});

  @override
  State<StatefulWidget> createState() => _DanhSachThemMoiScreenState();

}
class _DanhSachThemMoiScreenState extends State<DanhSachThemMoiScreen> with GetItStateMixin {

  String tongTienDv = "0";
  String tienGTGT = "0";
  String thanhTien = "0";


  List<GetListHangHoaByMaResponse> lstHangHoa = [];
  List<Dsdvu> lstDSDVu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.listHangHoa != null && widget.listHangHoa.length > 0){
      if(widget.isTraCuu){
        lstDSDVu = widget.listHangHoa;
        lstDSDVu.forEach((element) {
          // print("element.tienchietkhau : ${element.toJson()}");
          lstHangHoa.add(GetListHangHoaByMaResponse(
            chietKhau: element.tienchietkhau == null || element.tienchietkhau == "" ? 0 : int.parse(element.tienchietkhau),
            donGia: double.parse(element.dongia),
            dvTinh: element.dvtinh,
            number: element.soluong == "" ? 0 : double.parse(element.soluong),
            // number: element.soluong == "" ? 0 : element.soluong,
            thueSuat: element.thuesuat == "" ? "0" : (element.thuesuat == "0" || element.thuesuat == "5" || element.thuesuat == "10") ? "${element.thuesuat} %" : element.thuesuat,
            tenHHoa: element.tendvu,
            type: element.khuyenmai == "N" ? 0 : 1,
            maHHoa: element.madvu,
            tienGTGT: element.tienthue == "" ? 0.0 : double.parse(element.tienthue),
            tongTienDV: element.thanhtientruocthue == "" ? 0.0 : double.parse(element.thanhtientruocthue),
            thanhTien: element.tongtienthanhtoan == "" ? double.parse(element.thanhtientruocthue) : double.parse(element.tongtienthanhtoan),
          ));
          // tongTienDv =
          //     (double.parse(tongTienDv) + double.parse(element.thanhtientruocthue)).toString();
          // if(element.tienthue == "" || element.tongtienthanhtoan == ""){
          //   tienGTGT = double.parse(tienGTGT).toString();
          //   thanhTien = (double.parse(thanhTien) + double.parse(element.thanhtientruocthue)).toString();
          // }else {
          //   tienGTGT = (double.parse(tienGTGT) + double.parse(element.tienthue)).toString();
          //   thanhTien = (double.parse(thanhTien) + double.parse(element.tongtienthanhtoan)).toString();
          // }

        });
      }else {
        lstHangHoa = widget.listHangHoa;
        lstHangHoa.forEach((element) {
          tongTienDv = (double.parse(tongTienDv) + element.tongTienDV).toString();
          tienGTGT = (double.parse(tienGTGT) + element.tongTienDV).toString();
          thanhTien = (double.parse(thanhTien) + element.tongTienDV).toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: buildAppBarMenuCustom(context, 'Hàng hóa dịch vụ', isCreate: true, onCreate: () async {
        //   final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: widget.type, invoiceType: widget.invoiceType, isTraCuu: false,)));
        //   if(result != null){
        //     setState(() {
        //       GetListHangHoaByMaResponse hangHoaByMaResponse = result;
        //       lstHangHoa.add(hangHoaByMaResponse);
        //       tongTienDv = (double.parse(tongTienDv) + hangHoaByMaResponse.tongTienDV).toString();
        //       tienGTGT = (double.parse(tienGTGT) + hangHoaByMaResponse.tienGTGT).toString();
        //       thanhTien = (double.parse(thanhTien) + hangHoaByMaResponse.thanhTien).toString();
        //     });
        //   }
        // }, onBack: (){
        //   if(widget.isTraCuu){
        //     lstDSDVu.clear();
        //     lstHangHoa.forEach((element) {
        //       lstDSDVu.add(Dsdvu(
        //         soluong: element.number.toString(),
        //         dongia: element.donGia.toString(),
        //         thuesuat: element.thueSuat,
        //         khuyenmai: element.type == 0 ? "N" : "Y",
        //         dvtinh: element.dvTinh,
        //         thanhtientruocthue: element.tongTienDV.toString(),
        //         tienthue: element.tienGTGT.toString(),
        //         tongtienthanhtoan: element.thanhTien.toString(),
        //         tendvu: element.tenHHoa,
        //         madvu: element.maHHoa,
        //       ));
        //     });
        //     Navigator.pop(context, lstDSDVu);
        //   }else {
        //     Navigator.pop(context, lstHangHoa);
        //   }
        // }),
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Hàng hóa dịch vụ', isShowBack: true, isShowHome: false, isSave: false, onBack: (){
              if(widget.isTraCuu){
                lstDSDVu.clear();
                lstHangHoa.forEach((element) {
                  lstDSDVu.add(Dsdvu(
                    soluong: element.number.toString(),
                    dongia: element.donGia.toString(),
                    thuesuat: element.thueSuat,
                    khuyenmai: element.type == 0 ? "N" : "Y",
                    dvtinh: element.dvTinh,
                    thanhtientruocthue: element.tongTienDV.toString(),
                    tienthue: element.tienGTGT.toString(),
                    tongtienthanhtoan: element.thanhTien.toString(),
                    tendvu: element.tenHHoa,
                    madvu: element.maHHoa,
                  ));
                });
                Navigator.pop(context, lstDSDVu);
              }else {
                Navigator.pop(context, lstHangHoa);
              }
            }, isCreate: widget.trangThai == null || widget.trangThai == "NEWR" ? true : false, onCreate: () async {
              final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: widget.type, invoiceType: widget.invoiceType, isTraCuu: false,)));
              if(result != null){
                setState(() {
                  GetListHangHoaByMaResponse hangHoaByMaResponse = result;
                  lstHangHoa.add(hangHoaByMaResponse);
                  tongTienDv = (double.parse(tongTienDv) + hangHoaByMaResponse.tongTienDV).toString();
                  tienGTGT = (double.parse(tienGTGT) + hangHoaByMaResponse.tienGTGT).toString();
                  thanhTien = (double.parse(thanhTien) + hangHoaByMaResponse.thanhTien).toString();
                });
              }
            }, children: [
              CardWidget(
                children: [
                  lstHangHoa != null && lstHangHoa.length > 0 ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.h,),
                      ItemDanhSachThemMoi(context, lstHangHoa),
                      containerButton(context, widget.type),
                    ],

                  ) : Container(),
                ],
              )
            ],)

          ],
        )
    );
  }

  Widget ItemDanhSachThemMoi(BuildContext context, List<GetListHangHoaByMaResponse> lstHangHoa){
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: lstHangHoa.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () async {
                final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ThemMoiScreen(type: widget.type, invoiceType: widget.invoiceType, hangHoaByMaResponse: lstHangHoa[index], isTraCuu: false, trangThai: widget.trangThai,)));
                if(result != null){
                  setState(() {
                    lstHangHoa[index] = result;
                    tongTienDv = 0.toString();
                    tienGTGT = 0.toString();
                    thanhTien = 0.toString();
                    lstHangHoa.forEach((element) {
                      tongTienDv = (double.parse(tongTienDv) + element.tongTienDV).toString();
                      tienGTGT = (double.parse(tienGTGT) + element.tienGTGT).toString();
                      thanhTien = (double.parse(thanhTien) + element.thanhTien).toString();
                    });
                  });
                }


              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${index + 1} ${lstHangHoa[index].tenHHoa}" , style: text_action_Bold600,),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Text("${lstHangHoa[index].donGia != null ? Utils.covertToMoney(lstHangHoa[index].donGia) : 0.0} + ${lstHangHoa[index].thueSuat}",
                                  style: text12OpacityBold400,),
                              ),
                              Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                                    margin:  EdgeInsets.only(top: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(62.h),

                                      ),
                                      border: Border.all(color: color_gray),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(child: Text("-", style: text14Bold600, textAlign: TextAlign.center,), flex: 1, ),

                                        Expanded(child: Text("${lstHangHoa[index].number}", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                        Expanded(child: Text("+", style: text14Bold600, textAlign: TextAlign.center), flex: 1,),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )


                      ),
                      // Text("${Utils.covertToMoney(lstHangHoa[index].thanhTien)}" + " đ", textAlign: TextAlign.end, style: text14Red600,)
                      Row(
                        children: [
                        Text("${Utils.covertToMoney(lstHangHoa[index].thanhTien)}" + " đ", textAlign: TextAlign.end, style: text14Red600,),
                          Container(
                            margin: EdgeInsets.only(left: 30.h),
                            // Xoa hoa don
                            child: InkWell(child: Icon(Icons.delete),
                              onTap: (){
                                DialogAlert.showDialogInfo(context, "Bạn có muốn xóa hàng hóa không?", onSuccess: (){
                                  setState(() {
                                    String money = "${lstHangHoa[index].thanhTien != null ? Utils.covertToMoney(lstHangHoa[index].thanhTien) : 0.0}";
                                    String moneyDV = "${lstHangHoa[index].tongTienDV != null ? Utils.covertToMoney(lstHangHoa[index].tongTienDV) : 0.0}";
                                    String moneyGTGT = "${lstHangHoa[index].tienGTGT != null ? Utils.covertToMoney(lstHangHoa[index].tienGTGT) : 0.0}";

                                    thanhTien = (double.parse(thanhTien.replaceAll(",", "")) - double.parse(money.replaceAll(",", ""))).toString();
                                    tongTienDv = (double.parse(tongTienDv.replaceAll(",", "")) - double.parse(moneyDV.replaceAll(",", ""))).toString();
                                    tienGTGT = (double.parse(tienGTGT.replaceAll(",", "")) - double.parse(moneyGTGT.replaceAll(",", ""))).toString();

                                    lstHangHoa.removeAt(index);
                                    Navigator.of(context).pop();
                                  });

                                });
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  lstHangHoa.length - 1 == index ? SizedBox() :
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: Divider(),
                  )
                ],
              ),
          );
        });
  }

  Widget containerButton(BuildContext context, int type){
    return Column(
      children: [
        type == 3 || type == 4 || type == 5 ? Container() :
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Divider(height: 1,),
            ),
            Container(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                    color: colorF4FAFF,
                    // borderRadius:
                    // BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Tổng tiền dịch vụ")),
                    Text("${Utils.covertToMoney(double.parse(tongTienDv))} đ", style: text14Bold600,),

                  ],
                )

            ),
            type == 2 ? SizedBox() : Divider(height: 1,),
            type == 2 ? Container() :
            Container(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: colorF4FAFF,
                // borderRadius:
                // BorderRadius.all(Radius.circular(5))
              ),
              child: Row(
                children: [
                  Expanded(child: Text("Tiền thuế GTGT")),
                  Text("${Utils.covertToMoney(double.parse(tienGTGT))} đ", style: text14Bold600,),
                ],
              )
            ),
          ],
        ),
        Divider(height: 1,),
        Container(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: colorF4FAFF,
                // borderRadius:
                // BorderRadius.all(Radius.circular(5))
            ),
            child: Row(
              children: [
                Expanded(child: Text("Thành tiền")),
                Text("${Utils.covertToMoney(double.parse(thanhTien))} đ", style: text14Bold600,),
              ],
            )
        ),
      ],
    );
  }
}
