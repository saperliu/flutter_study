import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart'hide Action;
import 'package:flutter_study/ui/pages/home/page.dart';
import 'action.dart';
import 'state.dart';
Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.onGoHome: _onGoHome,
    Lifecycle.build:_build,
  });
}

void _build(Action action, Context<LoginState> ctx) {
  LogUtil.v("" ,tag: "-----------------------_build--------");

}

void _onGoHome(Action action, Context<LoginState> ctx) {

  Navigator.of(ctx.context).push(new MaterialPageRoute(builder: (context) {
    return HomePage().buildPage(action.payload);
  }));
}
