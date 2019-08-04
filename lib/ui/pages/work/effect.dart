import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WorkState> buildEffect() {
  return combineEffects(<Object, Effect<WorkState>>{
    WorkAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WorkState> ctx) {
}
