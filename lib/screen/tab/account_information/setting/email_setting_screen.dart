import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/account_information_controller.dart';
import 'package:mtax24/model/account_information_model.dart';
import 'package:mtax24/screen/components/widget/account_information/toggle_widget.dart';
import 'package:mtax24/screen/components/widget/base_screen_appbar.dart';
import 'package:mtax24/screen/components/widget/loading_widget.dart';

class EmailSettingScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  EmailSettingScreen({Key key}) : super(key: key);

  @override
  _EmailSettingScreenState createState() => _EmailSettingScreenState();
}

class _EmailSettingScreenState extends State<EmailSettingScreen> with GetItStateMixin {

  var accountInformationController = GetIt.I<AccountInformationController>();

  Map<String, String> nameSettings = {
    "icsOnlineEInvoice": "Hóa đơn mới",
    "eInvoiceAdjustment": "Hóa đơn điều chỉnh",
    "eInvoiceReplace": "Hóa đơn thay thế",
    "AdjustIdentify": "Thông báo điều chỉnh định danh",
    "InvoiceRemove": "Thông báo xóa bỏ"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountInformationController.getNotificationSettingList(context);
  }

  @override
  Widget build(BuildContext context) {

    final notificationSettingList = watchX((AccountInformationModel x) => x.notificationSettingList);
    final loading = watchX((AccountInformationModel x) => x.loading);

    return Stack(
      children: [
        CustomerAppbarScreen(title: "Thiết lập kênh email", isShowBack: true, isShowHome: true,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ...Iterable.generate(notificationSettingList.length).map((e) {
                    bool valueToggleIndex = notificationSettingList[e]["value"];
                    return ToggleWidget(
                      title: nameSettings[notificationSettingList[e]["title"]],
                      value: valueToggleIndex,
                      onToggle: (_) {
                        accountInformationController.setNotificationSettingToggle(notificationSettingToggle: !valueToggleIndex, index: e);
                        List<int> serviceId = [];
                        List<String> openIms = [], openSms = [], openEmail = [];
                        notificationSettingList.forEach((f) {
                          serviceId.add(f["serviceId"]);
                          openIms.add(f["openIms"]);
                          openSms.add(f["openSms"]);
                          openEmail.add(f["value"] ? "Y" : "N");
                        });
                        accountInformationController.registerNotificationSetting(context,
                            serviceId: serviceId,
                            openIms: openIms,
                            openSms: openSms,
                            openEmail: openEmail);
                      },
                    );
                  })
                ],
              ),
            ),
          ],
        ),

        loading ? LoadingWidget() : Container()
      ],
    );
  }
}
