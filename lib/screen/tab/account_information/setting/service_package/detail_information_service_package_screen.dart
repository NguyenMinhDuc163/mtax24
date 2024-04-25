import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/widget/build_app_bar_menu_custom.dart';
import 'package:mtax24/service/api_service/response/account_information/service_package/detail_infor_service_package_response.dart';

class DetailInformationServicePackageScreen extends StatefulWidget {
  static const String routeName = "/DetailInformationServicePackageScreen";
  final DetailInforServicePackageResponse detailInforServicePackageResponse;
  final String tin;
  const DetailInformationServicePackageScreen({Key key, this.detailInforServicePackageResponse, this.tin}) : super(key: key);

  @override
  _DetailInformationServicePackageScreenState createState() => _DetailInformationServicePackageScreenState();
}

class _DetailInformationServicePackageScreenState extends State<DetailInformationServicePackageScreen> {

  Map<String, String> detailServicePackage = {};
  List<Map<String, String>> listPayment = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      detailServicePackage = {
        "Mã số thuế": widget.tin,
        "Gói sản phẩm dịch vụ": widget.detailInforServicePackageResponse.serviceCode.servicecode ?? "",
        "Tên sản phẩm dịch vụ": widget.detailInforServicePackageResponse.serviceCode.servicename ?? "",
        "Số tiền": Utils.formatCurrency(widget.detailInforServicePackageResponse.serviceCode.amount ?? "0"),
      };
      if(widget.detailInforServicePackageResponse.listPay.isNotEmpty ) {
        widget.detailInforServicePackageResponse.listPay.forEach((element) {
          String paymentKind = element.paymentType.toString().toUpperCase();
          if(paymentKind == "CK") {
            paymentKind = "Chuyển khoản";
          } else if (paymentKind == "TM") {
            paymentKind = "Tiền mặt";
          } else if (paymentKind == "NAPAS") {
            paymentKind = "Thanh toán qua Napas";
          }
          listPayment.add({
            "Ngày thanh toán": element.paymentTime != null ? Utils.convertTimestamp(element.paymentTime) : "",
            "Số tiền thanh toán": Utils.formatCurrency(element.paymentAmount ?? "0"),
            "Hình thức thanh toán": paymentKind,
            "Ghi chú": element.paymentDesc ?? ""
          });
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarMenuCustom(context, "Chi tiết gói dịch vụ", showHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height_32, horizontal: width_24),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: detailServicePackage.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : height_24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(detailServicePackage.keys.toList()[index], style: text45sp)),
                          SizedBox(width: width_150,),
                          Expanded(child: Text(detailServicePackage.values.toList()[index], style: text45sp)),
                        ],
                      ),
                    );
                  }
              ),
              Padding(
                padding: EdgeInsets.only(top: height_64),
                child: Text("Danh sách các đợt thanh toán gói dịch vụ hóa đơn điện tử của doanh nghiệp", style: text45spColorBlue),
              ),
              listPayment.isNotEmpty ? Padding(
                padding: EdgeInsets.only(top: height_24),
                child: ListView.builder(
                    itemCount: listPayment.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 0 : height_24),
                        child: Container(
                          color: index % 2 != 0 ? Colors.grey.withOpacity(.4) : Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(height_24),
                            child: ListView.builder(
                              itemCount: listPayment[index].length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int indexMap) {
                                return Padding(
                                  padding: EdgeInsets.only(top: indexMap == 0 ? 0 : height_24),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text(listPayment[index].keys.toList()[indexMap], style: text45sp)),
                                      SizedBox(width: width_150,),
                                      Expanded(child: Text(listPayment[index].values.toList()[indexMap], style: text45sp)),
                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ) : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class DetailInformationServicePackageScreenArguments {
  final DetailInforServicePackageResponse detailInforServicePackageResponse;
  final String tin;
  DetailInformationServicePackageScreenArguments(this.detailInforServicePackageResponse, this.tin);
}
