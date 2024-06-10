import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import '../utils/utils.dart';

class SearchPanelWidget extends StatefulWidget {
  const SearchPanelWidget({
    Key key,
     this.taxCode,
     this.companyName,
     this.money,
     this.invoiceSymbol,
     this.invoiceNumber,
     this.invoiceDate,
     this.signDay,
     this.invoiceStatus,
     this.invoiceCQT,
      this.moneyType,
      this.nameCustomer,

  }) : super(key: key);
  final String taxCode;
  final String companyName;
  final String money;
  final String invoiceSymbol;
  final String invoiceNumber;
  final String invoiceDate;
  final String signDay;
  final String invoiceStatus;
  final String invoiceCQT;
  final String moneyType;
  final String nameCustomer;
  @override
  State<SearchPanelWidget> createState() => _SearchPanelWidgetState();
}

class _SearchPanelWidgetState extends State<SearchPanelWidget> {


  Widget _buildRow({String titleLeft, String titleMid, String titleRight, Color color, double fontSize, bool flag, int status}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              titleLeft,
              style: TextStyle(fontSize: fontSize,color:  (flag == true) ? (color == color2981DA) ?  colorPrimaryLogin : color828282  : color,)
            ),
          ),
          Expanded(
            flex: 2,
            child: (status == 1) ?  Text(
              Utils.convertStatusThongBao(titleMid),
              style: TextStyle(fontSize: fontSize, color:
              (titleMid == "NEWR" ? color2981DA :
              titleMid == "CKNG" || titleMid == "CCQT" ? colorYellow100 :
              titleMid == "SUCC" ? color219653 : colorD12129)
              ),
            ) : Text(titleMid, style: TextStyle(fontSize: fontSize, color: color),),
          ),
          Expanded(
            flex: 2,
          //   child: Text(
          //     titleRight,
          //     style: TextStyle(fontSize:  fontSize,  color: color, ),
          //     textAlign: TextAlign.left,
          //   ),

            child: (status == 1) ?  Text(
              Utils.convertTrangThaiGuiCQT(titleRight),
              style: TextStyle(fontSize: fontSize, color:
              (titleRight == "01" ? colorYellow100 :
              titleRight == "02" || titleRight == "00" ? colorD12129 :
              titleRight == "03" ? color219653 : colorD12129)
              ),
            ) : Text(titleRight, style: TextStyle(fontSize: fontSize, color: color),),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height_24),

      child: Card(
        elevation: 5.0,
        // margin: EdgeInsets.only(bottom: height_32),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mã số thuế: ${widget.taxCode}", style: TextStyle(fontSize: fontSize_14, fontWeight: FontWeight.bold), softWrap: true,   maxLines: 3, // Giới hạn số dòng là 3
                          overflow: TextOverflow.ellipsis,),
                        SizedBox(height: height_8,),
                        ((widget.taxCode != null && widget.taxCode != '')) ?
                        Text("Tên công ty: ${widget.companyName}", style: TextStyle(fontSize: fontSize_14 ),)
                            : Text("Tên khách hàng: ${widget.nameCustomer}", style: TextStyle(fontSize: fontSize_14 ),),
                      ],
                    ),
                  ),
                  Text("${Utils.covertToMoney(double.parse(widget.money))} ${widget.moneyType ?? "đ"}", style: TextStyle(fontSize: fontSize_14, color: Colors.red),),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: color828282,),
              ),

              Column(
                children: [
                  _buildRow(titleLeft: "Ký hiệu", titleMid: "Số HĐ", titleRight: "Ngày HĐ", fontSize: 12, color: color828282),
                  _buildRow(titleLeft: widget.invoiceSymbol, titleMid: widget.invoiceNumber, titleRight: widget.invoiceDate,
                      fontSize: 14, color: colorPrimaryLogin),
                  SizedBox(height: height_16,),
                  _buildRow(titleLeft: "Ngày kí", titleMid: "Trạng thái HĐ", titleRight: "Trạng thái gửi CQT", fontSize: 12, color: color828282, flag: false),

                  _buildRow(titleLeft: widget.signDay, titleMid: widget.invoiceStatus, titleRight: widget.invoiceCQT, fontSize: 14, color: color2981DA, flag: true, status: 1),
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
