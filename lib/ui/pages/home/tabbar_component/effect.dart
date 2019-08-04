import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/home/action.dart';
import 'action.dart';

Effect<Map<String, dynamic>> buildEffect() {
  return combineEffects(<Object, Effect<Map<String, dynamic>>>{
    Lifecycle.initState: _onInitState,
    GlobalBottomTabBarAction.onSelectOrder: _onSelectOrder,
  });
}
void _onInitState(Action action, Context<Map<String, dynamic>> ctx) {

  LogUtil.v(ctx.state["selectOrder"],tag:"-----tabbar _onInitState------");
}

void _onSelectOrder(Action action, Context<Map<String, dynamic>> ctx) {
  LogUtil.v(action.payload,tag:"------_onSelectOrder--_onShortcut------");
  ctx.dispatch(HomeActionCreator.setShortcutSelect(action.payload));
}
