import 'dart:convert';
import 'package:mtax24/service/init.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'init.dart';

class SharePreferUtils {
  static Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.ACCESS_TOKEN);
  }

  static Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.ACCESS_TOKEN, accessToken);
  }

  static Future<void> saveStateRememberPass(bool isRememberPass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.REMEMBERPASS, isRememberPass.toString());
  }

  static Future<bool> getStateRememberPass() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String remember = pref.getString(Constants.REMEMBERPASS) ?? "false";
    return remember == "true";
  }

  // start theme app
  static Future<void> saveTheme(String themeName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.THEME, themeName);
  }

  static Future<String> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.THEME);
  }
  // end theme app

  static Future<String> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String username = pref.getString(Constants.USERNAME);
    return username;
  }

  static Future<void> saveUsername(String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.USERNAME, username);
  }

  static Future<String> getPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String password = pref.getString(Constants.PASSWORD);
    return password;
  }

  static Future<void> savePassword({String password}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.PASSWORD, password);
  }


  static Future<void> saveFCMToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.TOKEN, token);
  }

  static Future<String> getFCMToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String fcmToken = pref.getString(Constants.TOKEN) ?? "";
    return fcmToken;
  }

  static Future<void> saveUserInfo(UserResponse userInfo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    await pref.setString(Constants.USER_INFO, user);
  }

  static Future<UserResponse> getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString(Constants.USER_INFO ?? null);
    // print(data);
    if (data != null) {
      Map userMap = jsonDecode(data);
      final userInfo = UserResponse.fromJson(userMap);

      return userInfo;
    }
    return null;
  }
  static Future<void> saveUserInfoFinger(UserResponse userInfo,String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    await pref.setString(userName, user);
  }

  static Future<UserResponse> getUserInfoFinger(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString(userName ?? null);
    if (data != null) {
      Map userMap = jsonDecode(data);
      final userInfo = UserResponse.fromJson(userMap);

      return userInfo;
    }
    return null;
  }

  static Future<String> getAvatar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String avatar = pref.getString(Constants.Avatar);
    return avatar;
  }

  static Future<void> saveAvatar(String avartar) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.Avatar, avartar);
  }

  static Future<void> savePIN(String pinCode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.PINCODE, pinCode);
  }

  static Future<String> getPIN() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pinCode = pref.getString(Constants.PINCODE);
    return pinCode;
  }

  static Future<void> removeCachedWhenLogOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.emailKey);
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
    await preferences.setString(Constants.REMEMBERPASS, "false");
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.USER_INFO);
    await preferences.remove(Constants.TOKEN);
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.PASSWORD);
    await preferences.remove(Constants.USERNAME);
    await preferences.remove(Constants.Avatar);
  }

// start Serial no
  static Future<void> saveSerialNo(String serialNo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.SERIAL_NO, serialNo);
  }
  static Future<bool> saveIsUpdateVersion(bool isUpdate) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(Constants.SERIAL_NO, isUpdate);
  }
  // ignore: missing_return
  static Future<String> getSerialNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString(Constants.SERIAL_NO ?? null);
    if (data != null) {
      return data;
    }
  }

  static Future<bool> getIsUpdateVersion() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool data = pref.getBool(Constants.SERIAL_NO ?? false);
    return data;
  }
// end Serial no

  static logOutApp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
  }

  static logOutAppRemoveToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.emailKey);
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
    await preferences.setString(Constants.REMEMBERPASS, "false");
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.USER_INFO);
    await preferences.remove(Constants.TOKEN);
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.PASSWORD);
    await preferences.remove(Constants.USERNAME);
    await preferences.remove(Constants.Avatar);
  }
}
