import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart'hide Action;
import 'package:flutter_study/ui/pages/home/page.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.dispose:_dispose,
    Lifecycle.initState:_onInit,
  });
}

void _onInit(Action action, Context<HomeState> ctx){

  final TickerProvider tickerProvider = ctx.stfState as HomePageStateStf;

  final TabController controller = TabController(length: 5, vsync: tickerProvider);

  ctx.dispatch(HomeActionCreator.updateTabController(controller));
}

void _dispose(Action action, Context<HomeState> ctx) {
  print('effect dispose');
  ctx.state.tabController.dispose();
}