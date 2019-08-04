import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study/ui/common/style/global_string_base.dart';
import 'package:flutter_study/ui/common/style/global_string_en.dart';
import 'package:flutter_study/ui/common/style/global_string_zh.dart';


///自定义多语言实现
class GlobalLocalizations {
  final Locale locale;

  GlobalLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, GlobalStringBase> _localizedValues = {
    'en': new GlobalStringEn(),
    'zh': new GlobalStringZh(),
  };

  GlobalStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 GlobalLocalizations
  static GlobalLocalizations of(BuildContext context) {
    return Localizations.of(context, GlobalLocalizations);
  }
}
