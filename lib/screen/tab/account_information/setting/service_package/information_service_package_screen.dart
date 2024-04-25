import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/widget/init_widget.dart';
import 'package:mtax24/service/api_service/response/account_information/service_package/infor_service_package_response.dart';

class InformationServicePackageScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  InformationServicePackageScreen({Key key}) : super(key: key);

  @override
  _InformationServicePackageScreenState createState() => _InformationServicePackageScreenState();
}

class _InformationServicePackageScreenState extends State<InformationServicePackageScreen> with GetItStateMixin {

  var accountInformationController = GetIt.I<AccountInformationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountInformationController.getInforServicePackage(context);
  }

  @override
  Widget build(BuildContext context) {

    final packageEInvoiceUsed = watchX((AccountInformationModel x) => x.packageEInvoiceUsed);
    final packageOtherUsing = watchX((AccountInformationModel x) => x.packageOtherUsing);
    final loading = watchX((AccountInformationModel x) => x.loading);
    return Stack(
      children: [
        CustomerAppbarScreen(title: "Thông tin gói dịch vụ", isShowBack: true, isShowHome: true,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height_32, horizontal: width_24),
                child: Column(
                  children: [
                    Text("Gói dịch vụ hóa đơn điện tử Doanh nghiệp đang sử dụng", style: text45spColorBlue),
                    packageEInvoiceUsed.isEmpty ? Container() : Padding(
                      padding: EdgeInsets.only(top: height_32),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: packageEInvoiceUsed.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: index == 0 ? 0 : height_24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(packageEInvoiceUsed.keys.toList()[index], style: text45sp)),
                                  SizedBox(width: width_150,),
                                  Expanded(child: Text(
                                    packageEInvoiceUsed.values.toList()[index], style: index == 0 ? text45spColorBlue : text45sp, textAlign: TextAlign.start,))
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height_100),
                      child: Text("Các gói dịch vụ Tax24 khác mà Doanh nghiệp đang sử dụng", style: text45spColorBlue),
                    ),
                    packageOtherUsing.isEmpty ? Container() : Padding(
                      padding: EdgeInsets.only(top: height_32),
                      child: ListView.builder(
                          itemCount: packageOtherUsing.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Tran tran = packageOtherUsing[index];
                            return Padding(
                              padding: EdgeInsets.only(top: index == 0 ? 0 : height_24),
                              child: InkWell(
                                onTap: () => accountInformationController.getDetailInforServicePackage(context, customerId: tran.customerid ?? "", serviceCode: tran.servicecode ?? ""),
                                child: Container(
                                  color: index % 2 != 0 ? Colors.grey.withOpacity(.4) : Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.all(height_16),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(tran.acctno ?? "", style: text45sp),
                                            RichText(
                                                text: TextSpan(
                                                    text: "Tên gói: ",
                                                    style: text45sp,
                                                    children: [
                                                      TextSpan(text: tran.servicecode)
                                                    ]))
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: height_16),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(tran.createTime == null ? "" : Utils.convertTimestamp(tran.createTime), style: text45sp),
                                              RichText(
                                                  text: TextSpan(
                                                      text: "Số tiền: ",
                                                      style: text45sp,
                                                      children: [
                                                        TextSpan(
                                                            text: Utils.formatDecimalCurrency((tran.amount ?? 0).toString(), true)),
                                                        TextSpan(text: "VNĐ")
                                                      ]
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        loading ? LoadingWidget() : Container()
      ],
    );
  }
}
