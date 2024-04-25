import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mtax24/firebase/notification_handler.dart';
import 'package:mtax24/screen/components/utils/init.dart';

class FirebaseNotifications {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  BuildContext myContext;
  bool isLogin;

  void setupFirebase(GlobalKey<NavigatorState> navigatorKey) async {
    NotificationHandler.initNotificataion(navigatorKey);
    firebaseCloudMessagingListener(navigatorKey);
    myContext = navigatorKey.currentContext;
  }

  void firebaseCloudMessagingListener(GlobalKey<NavigatorState> navigatorKey) {

    _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    _messaging.getToken().then((value) async =>
        {await SharePreferUtils.saveFCMToken(value), print("Token :" + value)});

    _messaging
        .subscribeToTopic("demo")
        .whenComplete(() => print("Subcribe ok"));

    _messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onBackgroundMessage((message) async => Platform.isIOS ? null : fcmBackgroundMessageHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      showNotification(message.notification.title, message.notification.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      SharePreferUtils.getAccessToken().then((value) {
        if (value != null) {
          Navigator.pushNamed(
              navigatorKey.currentContext, "/danhsachhomthu");
        }
      });
    });

  }

  static Future fcmBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    dynamic data = message['data'];
    print("onBackgroundMessage");
    showNotification(data['title'], data['body']);

    return Future<void>.value();
  }


  static Future<void> showNotification(title, body) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "com.etax.icanhan", "channel",
        channelDescription: "My Channel Description",
        importance: Importance.max,
        priority: Priority.high);
    const platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationHandler.flutterLocalNotificationPlugin
        .show(0, title, body, platformChannelSpecifics, payload: "My payload");
  }
}
