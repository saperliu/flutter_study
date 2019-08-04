

import 'package:flutter/material.dart';
import 'package:flutter_study/ui/common/localization/default_localizations.dart';

import '../common_const.dart';
import 'global_string_base.dart';
import 'global_style.dart';

class StyleUtils {

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android,fontFamily: CommonConst.APP_TEXT_FONT);
  }

  static GlobalStringBase getLocale(BuildContext context) {
    return GlobalLocalizations.of(context).currentLocalized;
  }

  static List<Color> getThemeListColor() {
    return [
      GlobalColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

}