import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mtax24/screen/components/utils/init.dart';

class NotificationHandler {
  static final flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  static GlobalKey<NavigatorState> navigatorKey;

  static void initNotificataion(
      GlobalKey<NavigatorState> navigatorKeyReceived) {
    navigatorKey = navigatorKeyReceived;
    final initAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:onDidReceiveLocalNotification,
    );
    var initSelling =
        InitializationSettings(android: initAndroid, iOS: initializationSettingsDarwin);
    flutterLocalNotificationPlugin.initialize(initSelling,
        onDidReceiveNotificationResponse: (NotificationResponse  response) async {
          if (response.payload != null) {
            SharePreferUtils.getAccessToken().then((value) {
              if (value != null) {
                Navigator.pushNamed(navigatorKey.currentContext, "/danhsachhomthu");
              }
            });
          }
        });
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      SharePreferUtils.getAccessToken().then((value) {
        if (value != null) {
          Navigator.pushNamed(navigatorKey.currentContext, "/danhsachhomthu");
        }
      });
    }
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    showDialog(
        context: navigatorKey.currentContext,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("ok"),
                  onPressed: () {
                    print("click notification");
                    //Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ));
  }
}
