import 'dart:convert';
import 'dart:io' show Directory, File, Platform;
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vietnamese_number_reader/vietnamese_number_reader.dart';

class Utils {

  static String formatCurrency(String text) {
    /// Check xem có dấu trừ ở trươc không để trả về cả dấu "-"
    bool hasSub = (text.isEmpty) ?  false : text[0] == "-";
    if (text.contains(".")) {
      text = text.substring(0, text.indexOf("."));
    }
    if (text.length > 2) {
      if (text[0] == "0") {
        text = text.substring(1, text.length);
      }
      var value = text;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      if (hasSub) {
        return "- " + value;
      } else {
        return value;
      }
    }
    if (hasSub) {
      return "-" +
          text.replaceAll(
              RegExp(r'\D'), ''); // nhập không phải là số thì xóa hết
    } else {
      return text.replaceAll(
          RegExp(r'\D'), ''); // nhập không phải là số thì xóa hết
    }
  }

  // format số tiền có chứa phần thập phân
  static formatDecimalCurrency(String valueStr, bool isAllowZero,
      [int numberAfterDecimal]) {
    try {
      if (valueStr == "null") return null;
      if (valueStr == "") return '';

      String val = valueStr;
      String firstVal;
      String secondVal;
      if (val.toString().indexOf('.') > 0) {
        firstVal =
            valueStr.substring(0, val.indexOf('.')).replaceAll('/\D/g', '');
        secondVal =
            val.substring(val.indexOf('.'), val.length).replaceAll('/\D/g', '');
        if (secondVal.length > 2) {
          if (secondVal.length >= 3) {
            secondVal = secondVal.substring(0, numberAfterDecimal ?? 3);
          } else {
            secondVal = secondVal.substring(0, 2);
          }
        }
        if (isAllowZero && secondVal.length == 2 && secondVal.contains('0')) {
          secondVal = '';
        }
        val = formatCurrency(firstVal) + secondVal;
      } else {
        val = formatCurrency(valueStr.toString().replaceAll('/\D/g', ''));
      }
      return val;
    } catch (e) {
      throw e;
    }
  }

  static Future<void> saveAndOpenBase64ByExcel(String base64Content) async {
    Uint8List bytes = base64.decode(base64Content);
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    String path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    File file = File("$path/" + DateTime.now().millisecondsSinceEpoch.toString() + ".xlsx");
    await file.writeAsBytes(bytes);
    print(file.path);
    OpenFile.open(file.path);
  }

  static Future<void> saveAndOpenBase64ByPDF(String base64Content, {String nameFile}) async {
    Uint8List bytes = base64.decode(base64Content);
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    File file = File("$path/" + (nameFile ?? "tax24") + ".pdf");

    // Luôn ghi đè file hiện tại với nội dung mới
    await file.writeAsBytes(bytes, flush: true);

    print(file.path);
    OpenFile.open(file.path);
  }

  static String generateSHA256Pwd(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }


  static String getCurrentTimeStringRequest() {
    final DateTime nowDate = DateTime.now();
    return nowDate.year.toString() +
        format2Digit(nowDate.month) +
        format2Digit(nowDate.day) +
        format2Digit(nowDate.hour) +
        format2Digit(nowDate.minute) +
        format2Digit(nowDate.second);
  }

  /// sample: 2 => 02 */
  static String format2Digit(int n) {
    if (n < 10) {
      return '0' + n.toString();
    } else {
      return n.toString();
    }
  }

  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static Future<void> share() async {
    await FlutterShare.share(
        title: 'Tax24-E-invoice',
        text: 'Tax24-E-invoice',
        linkUrl: 'https://tax24.com.vn/',
        chooserTitle: 'Chia sẻ qua ứng dụng');
  }

  static String convertStatusThongBao(String str){
    switch(str){
      case "NEWR":
        return "Khởi tạo";
      case "CKNG":
        return "Chờ phê duyệt";
      case "CKRJ":
        return "Từ chối";
      case "CCQT":
        return "Chờ CQT phản hồi";
      case "CQTT":
        return "CQT từ chối";
      case "SUCC":
        return "Thành công";
      case "DLTD":
        return "Đã hủy";
      default:
        return "";
    }
  }

  static String convertTinhChatThongBao(String str){
      switch(str){
        case "07":
          return "Thông báo xóa bỏ hóa đơn";
        case "10":
          return "Thông báo điều chỉnh";
        case "11":
          return "Thông báo thay thế";
        // case "10":
        //   return "Thông báo điều chỉnh định danh";
        case "12":
          return "Thông báo giải trình";
        default:
          return "";
      }
    }
  static String convertTinhChatHoaDon(String str){
    switch(str){
      case "01":
        return "Hóa đơn gốc";
      case "02":
        return "Hóa đơn thay thế";
      case "03":
        return "Hóa đơn đã bị thay thế";
      case "04":
        return "Hóa đơn điều chỉnh";
      case "05":
        return "Hóa đơn đã bị điều chỉnh";
      case "06":
        return "Hóa đơn đã bị xóa bỏ";
      case "07":
        return "Hóa đơn xóa bỏ";
      case "08":
        return "Hóa đơn hết giá trị sử dụng";
      case "09":
        return "Hóa đơn đã bị điều chỉnh định danh";
      case "10":
        return "Hóa đơn điều chỉnh định danh";
      case "13":
        return "Hóa đơn đã bị giải trình";
      default:
        return "";
    }
  }
  static String convertTimestamp(int timestamp){
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    String str = DateFormat('dd/MM/yyyy').format(date);
    return str;
  }

  static String convertDateTime(DateTime dateTime){
    String str = DateFormat('dd/MM/yyyy').format(dateTime);
    return str;
  }

  static DateTime convertStringToDateTime(String str){
    return DateFormat('dd/MM/yyyy').parse(str);
  }

  static String covertToMoney(double money){
    final oCcy = new NumberFormat("#,##0", "en_US");
    return oCcy.format(money);
  }

  static String convertFormatNumber(String s){
    return NumberFormat.decimalPattern("en").format(int.parse(s));
  }

  static String convertVietnameseNumberReader(String money){
    money = money.replaceAll(",", "");
    if(money == "0" || money == "0.0"){
      return "Không đồng";
    }else {
      // money.substring(0, )
      return VietnameseNumberReader.readNumber(
          int.parse(money.replaceAll(".0", "")));
          // int.parse(money.split(".")[0]));
    }
  }

  static bool validateMst(String mstnmua){
    var isMst = true;
    if(mstnmua.length == 0){ // truong hop ng mua le khong nhap msthue
      return true;
    }
    if( mstnmua.length < 10 || mstnmua.length > 14){
      isMst = false;
    }
    if(mstnmua.length == 10){
      var n1 = int.parse(mstnmua.substring(0, 1)) * 31;
      var n2 = int.parse(mstnmua.substring(1, 2)) * 29;
      var n3 = int.parse(mstnmua.substring(2, 3)) * 23;
      var n4 = int.parse(mstnmua.substring(3, 4)) * 19;
      var n5 = int.parse(mstnmua.substring(4, 5)) * 17;
      var n6 = int.parse(mstnmua.substring(5, 6)) * 13;
      var n7 = int.parse(mstnmua.substring(6, 7)) * 7;
      var n8 = int.parse(mstnmua.substring(7, 8)) * 5;
      var n9 = int.parse(mstnmua.substring(8, 9)) * 3;
      var n10 = int.parse(mstnmua.substring(9, 10));
      var soDu = (n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9) % 11;
      var hieuSo = 10 - soDu;
      if(mstnmua != "" && hieuSo != n10){
        isMst = false;
      }
    }
    if(10 < mstnmua.length && mstnmua.length < 14){
      isMst = false;
    }
    if(mstnmua.length == 14){
      var n11 = mstnmua.substring(10, 11);
      var n12 = int.parse(mstnmua.substring(11, 12));
      var n13 = int.parse(mstnmua.substring(12, 13));
      var n14 = int.parse(mstnmua.substring(13, 14));
      if (n11.toString() != '-') {
        isMst = false;
      } else if (!(n12 >= 0 || n12 <= 9) || !(n13 >= 0 || n13 <= 9) || !(n14 >= 0 || n14 <= 9)) {
        isMst = false;
      }

    }
    return isMst;
  }

  static bool isNumeric(String s) {
    if (s == null || s == '') {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  // static bool compareDates(String date1, String date2) {
  //   DateFormat format = DateFormat("dd/MM/yyyy");
  //
  //   DateTime dateTime1 = format.parse(date1);
  //   DateTime dateTime2 = format.parse(date2);
  //
  //   return dateTime1.isBefore(dateTime2);
  // }

  static bool compareDates(String date1, String date2) {
    DateFormat format = DateFormat("dd/MM/yyyy");

    DateTime dateTime1 = format.parse(date1);
    DateTime dateTime2 = format.parse(date2);

    // Nếu dateTime1 trước dateTime2 hoặc bằng dateTime2
    return dateTime1.isBefore(dateTime2) || dateTime1.isAtSameMomentAs(dateTime2);
  }

  static bool isValidEmail(String email) {
    if(email.isEmpty){
      return true;
    }
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
