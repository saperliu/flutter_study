import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;


enum HomeAction { action,updateTabController,workbenchSelect,noticeSelect,settingSelect,backlogSelect,setShortcutSelect }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action updateTabController(TabController tController) {
    return Action(HomeAction.updateTabController, payload: tController);
  }

  static Action workbenchSelect() {
    return const Action(HomeAction.workbenchSelect);
  }
  static Action noticeSelect() {
    return const Action(HomeAction.noticeSelect);
  }
  static Action settingSelect() {
    return const Action(HomeAction.settingSelect);
  }
  static Action backlogSelect() {
    return const Action(HomeAction.backlogSelect);
  }

  static Action setShortcutSelect(String value) {
    return Action(HomeAction.setShortcutSelect, payload: value);
  }
}
