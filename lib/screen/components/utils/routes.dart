import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/tab/account_information/setting/guide_usage_screen.dart';
import 'package:mtax24/screen/tab/account_information/setting/service_package/detail_information_service_package_screen.dart';
import 'package:mtax24/screen/tab/account_information/setting/version_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/create_report/create_report_sold_invoice_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/create_report/search_create_report_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/data_synthesis/report_data_synthesis_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/report/report_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/report/search_report_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/usage_report/report_usage_invoice_screen.dart';
import 'package:mtax24/screen/tab/home/invoice_report/function/usage_report/report_usage_report_result_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/scan_qr_invoice_screen.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/xac_minh_hoa_don/xac_minh_hoa_don_screen.dart';

class Routers {
    static Route<dynamic> generateRoute(RouteSettings routeSettings) {
      switch (routeSettings.name) {

        case ReportScreen.routeName:
          return MaterialPageRoute(builder: (_) => ReportScreen());

        case CreateReportSoldInvoiceScreen.routeName:
          return MaterialPageRoute(builder: (_) => CreateReportSoldInvoiceScreen());

        case ReportUsageInvoiceScreen.routeName:
          return MaterialPageRoute(builder: (_) => ReportUsageInvoiceScreen());

        case SearchReportScreen.routeName:
          return MaterialPageRoute(builder: (_) => SearchReportScreen());

        case SearchCreateReportScreen.routeName:
          return MaterialPageRoute(builder: (_) => SearchCreateReportScreen());

        case ReportUsageResultScreen.routeName:
          final args = routeSettings.arguments as ReportUsageResultArguments;
          return MaterialPageRoute(builder: (_) => ReportUsageResultScreen(message: args.message,));

        case DetailInformationServicePackageScreen.routeName:
          final args = routeSettings.arguments as DetailInformationServicePackageScreenArguments;
          return MaterialPageRoute(builder: (_) => DetailInformationServicePackageScreen(detailInforServicePackageResponse: args.detailInforServicePackageResponse, tin: args.tin,));

        case ScanQRInvoiceScreen.routeName:
          return MaterialPageRoute(builder: (_) => ScanQRInvoiceScreen());

        case XacMinhHoaDonScreen.routeName:
          final args = routeSettings.arguments as InvoiceVerifyArguments;
          return MaterialPageRoute(builder: (_) => XacMinhHoaDonScreen(showHome: args.showHome));

        case GuideUsageScreen.routeName:
          return MaterialPageRoute(builder: (context) => GuideUsageScreen());

        case VersionScreen.routeName:
          return MaterialPageRoute(builder: (context) => VersionScreen());

        case ReportDataSynthesisScreen.routeName:
          return MaterialPageRoute(builder: (_) => ReportDataSynthesisScreen());

        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                    child: Text(
                      'Chưa cập nhật'
                    )),
              ));
      }
    }
}