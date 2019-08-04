import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';


/// 不退出
Future<bool> _dialogExitApp(BuildContext context) async {
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: "android.intent.category.HOME",
    );
    await intent.launch();
  }

  return Future.value(false);
}



Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  return WillPopScope(
    onWillPop: () {
      return _dialogExitApp(viewService.context);
    },
//     child: SafeArea( //影响顶部状态栏的样式，去掉，加上表示只在状态栏以下区域显示内容。
       child: viewService.buildComponent("bottomBar"),
//     )
  );
}
