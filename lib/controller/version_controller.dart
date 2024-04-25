import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:mtax24/service/init.dart';
import 'package:package_info/package_info.dart';
import 'package:store_redirect/store_redirect.dart';
import 'controller.dart';

class VersionController extends BaseController {
  @override
  // TODO: implement model
  VersionModel get model => GetIt.I<VersionModel>();

  final ApiServices _services;

  VersionController(this._services);

  Future<void> getVersion(BuildContext context) async {
    execute(() => _services.versionapp(),
        onCompleted: (BaseResponse response){
          if(response.responseCode == "QUERY_SUCC"){
            final objectConverted = jsonDecode(response?.object);
            ListVersionResponse listVersionResponse = ListVersionResponse.fromJson(objectConverted);
            String version = listVersionResponse.sysParameter.name;
            bool isUpdate = false;
            int index = version.indexOf("|");
            int version_ios = int.parse(version.substring(index + 1).replaceAll("IOS", ""));
            int version_android = int.parse(version.substring(0, index).replaceAll("AND", ""));
            PackageInfo.fromPlatform().then((packageInfo) {
              int versionCode = int.parse(packageInfo.buildNumber);
              String _packageName = packageInfo.packageName ?? "";
              if(Platform.isAndroid) {
                if (version_android > versionCode) {
                  isUpdate = true;
                } else {
                  isUpdate = false;
                }
              } else if(Platform.isIOS){
                if (version_ios > versionCode) {
                  isUpdate = true;
                } else {
                  isUpdate = false;
                }
              }
              if(isUpdate) {
                DialogAlert.showDialogAlert(context, 'Bạn có muốn cập nhật ứng dụng', titleBtn: "Đồng ý", onclick: () {
                  StoreRedirect.redirect(
                      androidAppId: _packageName,
                      iOSAppId: '1379997793');
                });
              }
              model.setIsUpdate(isUpdate: isUpdate);
            });
          } else {
            model.setIsUpdate(isUpdate: false);
            model.setError(error: "response.message", source: "source");
          }
        },
        source: "getVersion");
  }

}
