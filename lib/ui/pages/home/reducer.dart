import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.updateTabController:_updateTabController,
      HomeAction.workbenchSelect:_workbenchSelect,
      HomeAction.noticeSelect:_noticeSelect,
      HomeAction.settingSelect:_settingSelect,
      HomeAction.backlogSelect:_backlogSelect,
      HomeAction.setShortcutSelect:_setShortcutSelect,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _updateTabController(HomeState state, Action action) {
  final newState = state.clone();
  newState.tabController = action.payload;
  return newState;
}

HomeState _workbenchSelect(HomeState state, Action action) {
  final newState = state.clone();
  newState.backlog = false;
  newState.workbench = true;
  newState.setting = false;
  newState.notice = false;
  newState.pageIndex = 0;
  return newState;
}

HomeState _noticeSelect(HomeState state, Action action) {
  final newState = state.clone();
  newState.backlog = false;
  newState.workbench = false;
  newState.setting = false;
  newState.notice = true;
  newState.pageIndex = 3;
  return newState;
}

HomeState _settingSelect(HomeState state, Action action) {
  final newState = state.clone();
  newState.backlog = false;
  newState.workbench = false;
  newState.setting = true;
  newState.notice = false;
  newState.pageIndex = 4;
  return newState;
}

HomeState _backlogSelect(HomeState state, Action action) {
  final newState = state.clone();
  newState.backlog = true;
  newState.workbench = false;
  newState.setting = false;
  newState.notice = false;
  newState.pageIndex = 1;
  return newState;
}

HomeState _setShortcutSelect(HomeState state, Action action) {
  LogUtil.v("set shortcut",tag:"-----home reducer---_setShortcutSelect------");
  final newState = state.clone();
  newState.selectOrder= action.payload;
  return newState;
}