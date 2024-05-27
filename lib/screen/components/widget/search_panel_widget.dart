import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

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
  @override
  State<SearchPanelWidget> createState() => _SearchPanelWidgetState();
}

class _SearchPanelWidgetState extends State<SearchPanelWidget> {


  Widget _buildRow({String titleLeft, String titleMid, String titleRight, Color color, double fontSize, bool flag}) {
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
            child: Text(
              titleMid,
              style: TextStyle(fontSize: fontSize, color: color),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              titleRight,
              style: TextStyle(fontSize:  fontSize,  color: color, ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height_16),
      child: Card(
        elevation: 5.0,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mã số thuế: ${widget.taxCode}", style: TextStyle(fontSize: fontSize_14, fontWeight: FontWeight.bold),),
                      SizedBox(height: height_8,),
                      Text("Tên công ty: ${widget.companyName}", style: TextStyle(fontSize: fontSize_14 ),),
                    ],
                  ),
                  Text("${widget.money} ${widget.moneyType ?? "đ"}", style: TextStyle(fontSize: fontSize_14, color: Colors.red),),

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
                  _buildRow(titleLeft: widget.signDay, titleMid: widget.invoiceStatus, titleRight: widget.invoiceCQT, fontSize: 14, color: color2981DA, flag: true),
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
