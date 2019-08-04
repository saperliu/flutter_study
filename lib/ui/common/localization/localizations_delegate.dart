import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'default_localizations.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description  多语言代理
 */
class GlobalLocalizationsDelegate extends LocalizationsDelegate<GlobalLocalizations> {

  GlobalLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<GlobalLocalizations> load(Locale locale) {
    return new SynchronousFuture<GlobalLocalizations>(new GlobalLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<GlobalLocalizations> old) {
    return false;
  }

  ///全局静态的代理
  static GlobalLocalizationsDelegate delegate = new GlobalLocalizationsDelegate();
}
