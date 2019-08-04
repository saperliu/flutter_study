import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements Cloneable<HomeState> {

  TabController tabController;
  //tabbar选中的状态
  bool workbench = true;
  bool backlog= false;
  bool setting= false;
  bool notice= false;

  String selectOrder;

  int pageIndex = 0;
  @override
  HomeState clone() {
    return HomeState()
      ..selectOrder = selectOrder
      ..workbench = workbench
      ..backlog = backlog
      ..setting = setting
      ..notice = notice
      ..pageIndex = pageIndex
      ..tabController=tabController;
  }
}

HomeState initHomeState(Map<String, dynamic> args) {

  final HomeState homeState = HomeState();
  return homeState;
}

// connector
class GlobalBottomTabBarConnector extends ConnOp<HomeState, Map<String, dynamic> > {
  @override
  get(HomeState state) {
    return   <String, dynamic>{
      'tabController': state.tabController,
      'workbench': state.workbench,
      'backlog': state.backlog,
      'setting': state.setting,
      'notice': state.notice,
      'pageIndex': state.pageIndex,
      'selectOrder': state.selectOrder,
    };
  }

  void set(HomeState state,Map<String, dynamic> globalState);
}