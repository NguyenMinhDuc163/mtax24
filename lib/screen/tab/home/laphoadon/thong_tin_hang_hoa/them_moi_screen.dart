

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/screen/tab/home/laphoadon/thong_tin_hang_hoa/list_hang_hoa_screen.dart';
import 'package:mtax24/service/init.dart';

import '../../../../init_view.dart';

class ThemMoiScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final int type;
  final String invoiceType;
  final dynamic hangHoaByMaResponse;
  final bool isTraCuu;
  final String trangThai;

  ThemMoiScreen({this.type, this.invoiceType, this.hangHoaByMaResponse, this.isTraCuu, this.trangThai});

  @override
  State<StatefulWidget> createState() => _ThemMoiScreenState();

}
class _ThemMoiScreenState extends State<ThemMoiScreen> with GetItStateMixin {

  TextEditingController maHHController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  TextEditingController percentController = TextEditingController();
  GetListHangHoaByMaResponse hangHoaByMaResponse;
  Dsdvu dsdvu = Dsdvu();

  var dropSale;
  List<String> lstDropSale = ["","Khuyến mại", "Chiết khấu"];

  String total = "0";
  String taxMoney = "0";
  String moneyBar = "0";

  int percent = 0;
  int typeSale = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.hangHoaByMaResponse != null ){
      print("---------type: ${widget.type}");
      print("---------invoiceType: ${widget.invoiceType}");

      if(widget.isTraCuu){
        dsdvu = widget.hangHoaByMaResponse;
        print("------------------ ${dsdvu.soluong}");
        hangHoaByMaResponse = GetListHangHoaByMaResponse(
          chietKhau: dsdvu.tienchietkhau == null || dsdvu.tienchietkhau == "" ? 0 : int.parse(dsdvu.tienchietkhau),
          donGia: dsdvu.dongia == "" || dsdvu.dongia == null ? 0.0 : double.parse(dsdvu.dongia.replaceAll(',', '')),
          dvTinh: dsdvu.dvtinh,
          number: dsdvu.soluong != null && dsdvu.soluong != "" ? int.parse(dsdvu.soluong.replaceAll(',', '').split('.')[0]) : 0,
          thueSuat: (dsdvu.thuesuat == "0" || dsdvu.thuesuat == "5" || dsdvu.thuesuat == "8" || dsdvu.thuesuat == "10") ? "${dsdvu.thuesuat} %" : dsdvu.thuesuat,
          tenHHoa: dsdvu.tendvu,

          type: dsdvu.khuyenmai == "N" ? 1 : dsdvu.khuyenmai == "Y" ? 2 : 0,
          maHHoa: dsdvu.madvu,
          tienGTGT: dsdvu.tienthue == "" || dsdvu.tienthue == null ? 0.0 : double.parse(dsdvu.tienthue),
          tongTienDV: dsdvu.thanhtientruocthue == "" || dsdvu.thanhtientruocthue == null ? 0.0 : double.parse(dsdvu.thanhtientruocthue),
          thanhTien: dsdvu.tongtienthanhtoan == "" || dsdvu.tongtienthanhtoan == null ? 0.0 : double.parse(dsdvu.tongtienthanhtoan),
        );
        print("dsdvu.khuyenmai: ${dsdvu.khuyenmai}");
      }else {
        hangHoaByMaResponse = widget.hangHoaByMaResponse;
      }
      maHHController.text = hangHoaByMaResponse.maHHoa;
      nameController.text = hangHoaByMaResponse.tenHHoa;
      unitController.text = hangHoaByMaResponse.dvTinh;
      totalController.text = hangHoaByMaResponse.number.toString();
      unitPriceController.text = hangHoaByMaResponse.donGia.toString();
      discountController.text = hangHoaByMaResponse.chietKhau.toString();
      typeSale = hangHoaByMaResponse.type;
      dropSale = lstDropSale[typeSale].toString();
      total = hangHoaByMaResponse.tongTienDV.toString();
      taxMoney = hangHoaByMaResponse.tienGTGT.toString();
      moneyBar = hangHoaByMaResponse.thanhTien.toString();
      print("============hangHoaByMaResponse: $typeSale");
      if(hangHoaByMaResponse.thueSuat == "0 %"){
        percent = 0;
        percentController.text = percent.toString();
      }else if(hangHoaByMaResponse.thueSuat == "5 %"){
       percent = 5;
       percentController.text = percent.toString();
      }else if(hangHoaByMaResponse.thueSuat == "8 %"){
        percent = 8;
        percentController.text = percent.toString();
      }else if(hangHoaByMaResponse.thueSuat == "10 %"){
        percent = 10;
        percentController.text = percent.toString();
      }else if(hangHoaByMaResponse.thueSuat == "KCT"){
        percent = 50;
        percentController.text = "KCT";
      }else if(hangHoaByMaResponse.thueSuat == "KKKNT"){
        percent = 100;
        percentController.text = "KKKNT";
      }
      print("=============percent: $percent");
    }else
      dropSale = lstDropSale.first;

    totalController.addListener(() => _formatNumber(totalController));
    unitPriceController.addListener(() => _formatNumber(unitPriceController));
  }

  String _formatNumberWithComma(String input) {
    if (input.isEmpty) return '';
    final number = int.tryParse(input.replaceAll(',', ''));
    if (number == null) return '';
    return NumberFormat('#,##0').format(number);
  }

  void _formatNumber(TextEditingController controller) {

    String prefix = controller.text.contains('.') ? controller.text.substring(0, controller.text.indexOf('.')) : controller.text;
    String suffix = controller.text.contains('.') ? controller.text.substring(controller.text.indexOf('.')) : '';

    String newText = _formatNumberWithComma(prefix.replaceAll(',', '')) + suffix;
    controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Thêm mới', isShowBack: true, isShowHome: false, isCreate: false,
              isSave: widget.trangThai == null || widget.trangThai == "NEWR" ? true : false, onSave: (){
              // if(maHHController.text == null || maHHController.text == "" ){
              //   Toast.showLongTop("Bạn chưa chọn hàng hóa dịch vụ");
              // } else

                print('------------------- ${totalController.text}');
              if(totalController.text == null || totalController.text == "" ){
                Toast.showLongTop("Bạn chưa nhập số lượng");
              }else if(unitPriceController.text == null || unitPriceController.text == "" ){
                Toast.showLongTop("Bạn chưa nhập đơn giá");
              }else {
                if (widget.isTraCuu) {
                  dsdvu.soluong = totalController.text;
                  dsdvu.dongia = unitPriceController.text;
                  dsdvu.thuesuat =
                  percent == 50 ? "KCT" : percent == 100 ? "KKKNT" : "$percent %";
                  dsdvu.khuyenmai = typeSale == 1 ? "N" : typeSale == 2 ? "Y" : "";
                  dsdvu.thanhtientruocthue = total;
                  dsdvu.tienthue = taxMoney;
                  dsdvu.tongtienthanhtoan = moneyBar;
                  dsdvu.tienchietkhau = discountController.text.isNotEmpty
                      ? discountController.text
                      : "0";
                  dsdvu.tendvu = nameController.text;
                  dsdvu.madvu = maHHController.text;
                  Navigator.pop(context, dsdvu);
                } else
                {
                  hangHoaByMaResponse = GetListHangHoaByMaResponse(
                    maHHoa: maHHController.text,
                    tenHHoa: nameController.text,
                    dvTinh: unitController.text,
                    number: totalController.text.isNotEmpty ? int.parse(totalController.text.replaceAll(',', '').trim().split('.')[0]) : 0,
                    donGia: unitPriceController.text != "" ? double.parse(unitPriceController.text.replaceAll(',', '')) : 0.0,
                    thueSuat : percent == 50 ? "KCT" : percent == 100 ? "KKKNT" : "$percent %",
                    type : typeSale,
                    tongTienDV : double.parse(total),
                    tienGTGT : double.parse(taxMoney),
                    thanhTien : double.parse(moneyBar),
                    chietKhau : discountController.text.isNotEmpty ? int.parse(discountController.text) : 0,
                  );
                  Navigator.pop(context, hangHoaByMaResponse);
                }
              }
            }, children: [
              CardWidget(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFieldNormalInput(
                                isRequired: false,
                                haveBorder: true,
                                // readOnly: true,
                                // showCursor: false,
                                textEditingController: maHHController,
                                hintText: "Mã hàng hóa, dịch vụ",
                              ),
                            ),
                            SizedBox(width: 20.h,),
                            IconButton(onPressed: () async {
                              final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => ListGoodsScreen(invoiceType: widget.invoiceType,)));
                              print("result: $result");
                              if(result != null){
                                setState(() {
                                  hangHoaByMaResponse = result;
                                  maHHController.text = hangHoaByMaResponse.maHHoa == null ? "" : hangHoaByMaResponse.maHHoa;
                                  nameController.text = hangHoaByMaResponse.tenHHoa == null ? "" : hangHoaByMaResponse.tenHHoa;
                                  unitController.text = hangHoaByMaResponse.dvTinh == null ? "" : hangHoaByMaResponse.dvTinh;
                                  totalController.text = "1";
                                  unitPriceController.text = hangHoaByMaResponse.donGia == null ? '' : hangHoaByMaResponse.donGia.toString();

                                  totalAmount(widget.type,
                                      percent,
                                      totalController.text,
                                      unitPriceController.text,
                                      discountController.text);
                                });
                              }
                            }, icon: Icon(Icons.search))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: TextFieldNormalInput(
                          isRequired: false,
                          haveBorder: true,
                          // readOnly: true,
                          // showCursor: false,
                          textEditingController: nameController,
                          hintText: "Tên hàng hóa, dịch vụ",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: TextFieldNormalInput(
                          isRequired: false,
                          haveBorder: true,
                          // readOnly: true,
                          // showCursor: false,
                          textEditingController: unitController,
                          hintText: "Đơn vị tính",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: TextFieldNormalInput(
                          isRequired: false,
                          haveBorder: true,
                          // readOnly: true,
                          // showCursor: false,
                          textEditingController: totalController,
                          textInputType: TextInputType.number,
                          hintText: widget.type == 4 ? "Số lượng thực xuất" : "Số lượng",
                          onChangedCustom: (value){
                            setState(() {
                              totalAmount(widget.type,
                                  percent,
                                  totalController.text.replaceAll(',', ''),
                                  unitPriceController.text.replaceAll(',', ''),
                                  discountController.text);
                            });
                          },
                        ),
                      ),
                      widget.type == 4 ?
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: TextFieldNormalInput(
                          isRequired: false,
                          haveBorder: true,
                          // readOnly: true,
                          // showCursor: false,
                          textInputType: TextInputType.number,
                          textEditingController: totalController,
                          hintText: widget.type == 5 ? "Số lượng thực xuất" : "Số lượng",
                          onChangedCustom: (value){
                            setState(() {
                              totalAmount(widget.type,
                                  percent,
                                  totalController.text.replaceAll(',', ''),
                                  unitPriceController.text.replaceAll(',', ''),
                                  discountController.text);
                            });
                          },
                        ),
                      ) : SizedBox(),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: TextFieldNormalInput(
                          isRequired: false,
                          haveBorder: true,
                          // readOnly: true,
                          // showCursor: false,
                          textInputType: TextInputType.number,
                          textEditingController: unitPriceController,
                          hintText: "Đơn giá",
                          onChangedCustom: (value){
                            setState(() {

                              totalAmount(widget.type,
                                  percent,
                                  totalController.text.replaceAll(',', ''),
                                  unitPriceController.text.replaceAll(',', ''),
                                  discountController.text);
                            });
                          },
                        ),
                      ),
                      widget.type == 0 || widget.type == 1 || widget.type == 2 ?
                      Column(
                        children: [
                          DropdownInput(
                            value: dropSale,
                            onChangedCustom: (String value){
                              setState(() {
                                dropSale = value;
                                if(dropSale == lstDropSale[1].toString()){
                                  typeSale = 1;
                                  discountController.text = 1.toString();
                                  totalAmount(widget.type,
                                      percent,
                                      totalController.text,
                                      unitPriceController.text,
                                      discountController.text);
                                }else if(dropSale == lstDropSale[2].toString()){
                                  typeSale = 2;
                                }else{
                                  typeSale = 0;
                                }
                              });
                            },
                            hint: "Khuyến mại",
                            itemsDropdown: lstDropSale,
                          ),
                          typeSale == 2 ?
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: TextFieldNormalInput(
                              isRequired: false,
                              haveBorder: true,
                              // readOnly: true,
                              // showCursor: false,
                              textEditingController: discountController,
                              hintText: "Tiền chiết khấu",
                              onChangedCustom: (value){
                                setState(() {
                                  totalAmount(widget.type,
                                      percent,
                                      totalController.text,
                                      unitPriceController.text,
                                      discountController.text);
                                });
                              },
                            ),
                          ) : Container(),
                        ],
                      ): Container(),
                      widget.type == 0  ?
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Thuế suất"),
                                SizedBox(width: 40.h,),
                                Expanded(
                                  child: TextFieldNormalInput(
                                    isRequired: false,
                                    haveBorder: true,
                                    // readOnly: true,
                                    // showCursor: false,
                                    textEditingController: percentController,
                                    onChangedCustom: (value) {
                                      setState(() {
                                        if(Utils.isNumeric(value)){
                                          percent = int.parse(value);
                                          totalAmount(widget.type,
                                              int.parse(value),
                                              totalController.text,
                                              unitPriceController.text,
                                              discountController.text);
                                        }else if(value == "KCT" || value == "kct"){
                                          percent = 50;
                                          totalAmount(widget.type,
                                              0,
                                              totalController.text,
                                              unitPriceController.text,
                                              discountController.text);
                                        }else if(value == "KKKNT" || value == "kkknt"){
                                          percent = 100;
                                          totalAmount(widget.type,
                                              0,
                                              totalController.text,
                                              unitPriceController.text,
                                              discountController.text);
                                        }

                                      });
                                    },
                                    // hintText: "Mã số thuế",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          discountView(context),
                        ],
                      ) : Container(),

                      containerButton(context, widget.type),
                      SizedBox(height: 50.h,)

                    ],

                  ),
                ],
              )
            ],)

          ],
        )
    );
  }



  Widget discountView(BuildContext context){

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 0;
                    percentController.text = percent.toString();
                    setState(() {
                      totalAmount(widget.type,
                          percent,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        color: percent == 0 ? colorBorderInputCombobox : Colors.transparent,
                        border: Border.all(
                          color: color757575,
                          width: 1.0,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(55.h))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Text("0 %")),
                    )

                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 5;
                    percentController.text = percent.toString();
                    setState(() {
                      totalAmount(widget.type,
                          percent,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    // padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        color: percent == 5 ? colorBorderInputCombobox : Colors.transparent,
                        border: Border.all(
                          color: color757575,
                          width: 1.0,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(55.h))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Text("5 %")),
                    ),

                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 8;
                    percentController.text = percent.toString();
                    setState(() {
                      totalAmount(widget.type,
                          percent,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    // padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        color: percent == 8 ? colorBorderInputCombobox : Colors.transparent,
                        border: Border.all(
                          color: color757575,
                          width: 1.0,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(55.h))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Text("8 %")),
                    ),

                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 10;
                    percentController.text = percent.toString();
                    setState(() {
                      totalAmount(widget.type,
                          percent,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        color: percent == 10 ? colorBorderInputCombobox : Colors.transparent,
                        border: Border.all(
                          color: color757575,
                          width: 1.0,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(55.h))),
                    child:Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Center(child: Text("10 %"))),
                    ),

                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 50;
                    percentController.text = "KCT";
                    setState(() {
                      totalAmount(widget.type,
                          0,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        color: percent == 50 ? colorBorderInputCombobox : Colors.transparent,
                        border: Border.all(
                          color: color757575,
                          width: 1.0,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(55.h))),
                    child:Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Text("KCT")),
                    ),

                ),
              ),),
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    percent = 100;
                    percentController.text = "KKKNT";
                    setState(() {
                      totalAmount(widget.type,
                          0,
                          totalController.text,
                          unitPriceController.text,
                          discountController.text);
                    });
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                      color: percent == 100 ? colorBorderInputCombobox : Colors.transparent,
                      borderRadius:
                      BorderRadius.all(Radius.circular(55.h)),
                      border: Border.all(
                        color: color757575,
                        width: 1.0,
                      ),
                    ),
                    child:Padding(
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 30.h, bottom: 30.h),
                      child: Center(child: Text("KKKNT")),
                    ),

                ),
              ),),

          ],
        ),
      ],
    );
  }

  Widget containerButton(BuildContext context, int type){
    return Column(
      children: [
        type == 3 || type == 4 || type == 5 ? Container() :
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.h, right: 20.h),
                  margin: EdgeInsets.only(top: 20.h),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                      color: colorBorderInputCombobox,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12.h))),
                  child: Row(
                    children: [
                      Expanded(child: Text("Tổng tiền dịch vụ")),
                      Text("${Utils.covertToMoney(double.parse(total))}"),

                    ],
                  )

                ),
                type == 2 || type == 1 ? Container() :
                  Container(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    margin: EdgeInsets.only(top: 20.h),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        color: colorBorderInputCombobox,
                        borderRadius:
                        BorderRadius.all(Radius.circular(12.h))),
                    child: Row(
                      children: [
                        Expanded(child: Text("Tiền thuế GTGT")),
                        Text("${Utils.covertToMoney(double.parse(taxMoney))}"),
                      ],
                    )
                ),
              ],
            ),
        Container(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            margin: EdgeInsets.only(top: 20.h),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
                color: colorBorderInputCombobox,
                borderRadius:
                BorderRadius.all(Radius.circular(12.h))),
            child: Row(
              children: [
                Expanded(child: Text("Thành tiền")),
                Text("${Utils.covertToMoney(double.parse(moneyBar))}"),
              ],
            )
        ),
      ],
    );
  }

  void totalAmount(int type, int percent, String _quantily, String _price, String _discount){
    double quantily = _quantily == null || _quantily == "" ? 0 : double.parse(_quantily.replaceAll(',', ''));
    double price = _price == null || _price == "" ? 0 : double.parse(_price.replaceAll(',', ''));
    double discount = _discount == null || _discount == "" ? 0 : double.parse(_discount.replaceAll(',', ''));
    if(type == 0 || type == 1) {
      total = ((quantily * price) - discount).toString();
      print("percent:$percent");
      if (percent > 0) {
        if(percent == 50 || percent == 100){
          percent = 0;
        }
        taxMoney = (((quantily * price) - discount) * (percent / 100)).toString();
        print("taxMoney:$taxMoney");
      }else {
        taxMoney = "0";
        print("taxMoney1:$taxMoney");
      }
      moneyBar = (double.parse(total) + double.parse(taxMoney)).toString();
    }else if(type == 2){
      total = ((quantily * price) - discount).toString();
      moneyBar = total;
    }else if (type == 3 || type == 4 || type == 5){
      moneyBar = (quantily * price).toString();
    }
  }



}
