import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/app_translate.dart';

class Public {
  static Public _instance;

  Public._();

  factory Public() {
    assert(
      _instance != null,
      '\nEnsure to initialize ScreenUtil before accessing it.\nPlease execute the init method : ScreenUtil.init()',
    );
    return _instance;
  }

  BuildContext context;

  static init(BuildContext ctx) {
    _instance ??= Public._();
    _instance..context = ctx;
  }

  /// Đa ngôn ngữ không cần truyền context,
  /// Có thể dùng được mọi nơi
  String languageCustom(
    String translate,
  ) {
    if (translate.isNotEmpty || translate != null) {
      return AppTranslate.of(context).translate(translate);
    } else {
      return 'key isEmtype';
    }
  }

  static Icon iconCustom({
    var icon,
    context,
    Color color,
    double size,
  }) {
    if (icon.toString().contains('o')) {
     String iconConverted = icon.toString().replaceAll('o', '');
      return Icon(IconData(int.parse(iconConverted), fontFamily: 'MaterialIcons'),
          size: size ?? 16, color: color ?? Theme.of(context).primaryColor);
    }
    return Icon(IconData(icon, fontFamily: fontIconApp),
        size: size ?? 16, color: color ?? Theme.of(context).primaryColor);
  }

}
