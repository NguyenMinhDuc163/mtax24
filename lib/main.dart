import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mtax24/screen/components/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mtax24/screen/components/utils/init.dart';
import 'package:mtax24/screen/components/utils/routes.dart';
import 'package:mtax24/screen/splash_screen.dart';
import 'init.dart';
import 'root_layout.dart';
import 'service/service.dart';


Future<void> main() async {
  await initServices(createInterceptor);
  await initModel();
  await initController();
    var startLocale = Platform.localeName.startsWith("vi_")
        ? Locale('vi', 'VN')
        : Locale('en', 'US');
    runApp(
      ScreenUtilInit(
        designSize: const Size(1080 , 1920),
        builder: (context, child) => Phoenix(
          child: EasyLocalization(
              saveLocale: false,
              startLocale: startLocale,
              supportedLocales: [
                Locale('vi', 'VN'),
                Locale('en', 'US'),
              ],
              path: 'assets/translations',
              fallbackLocale: Locale('vi', 'VN'),
              child: MyApp()),
        ),
      ),
    );
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      debugShowCheckedModeBanner: false,
      title: 'Tax24-E-invoice',
      onGenerateRoute: Routers.generateRoute,
      theme: ThemeData(
        primaryColor: const Color(0xFF0C4B8E),
        // primaryColor: Colors.transparent,
        primaryColorLight: const Color(0xFFFFFFFF),
        primaryColorDark: const Color(0xFF04305F),
        fontFamily: Constants.FONT_DEFAULT,
        iconTheme: const IconThemeData(color: Color(0xFF0C4B8E)),
        primaryColorBrightness: Brightness.light,
      ),

      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: RootLayout(
          child: child,
        ),
      ),
      home: SplashScreen(),
    );
  }
}

