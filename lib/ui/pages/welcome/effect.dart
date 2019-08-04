import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_study/ui/pages/welcome/state.dart';

Effect<WelcomeState> buildEffect() {
  return combineEffects(<Object, Effect<WelcomeState>>{
    Lifecycle.didChangeDependencies: _didUpdateFinish,
  });
}

void _onInitState(Action action, Context<WelcomeState> ctx) async {
  ///登录界面
  Navigator.of(ctx.context)
      .pushNamed('login', arguments: null)
      .then((dynamic toDo) {
    logMiddleware(tag: "login");
  });
}

void _didUpdateFinish(Action action, Context<WelcomeState> ctx) {
  ///欢迎页面，2秒后进入登录界面
  if (!ctx.state.hadInit) {
    new Future.delayed(const Duration(seconds: 2), () {

      _onInitState(action, ctx);
    });
  }
}
