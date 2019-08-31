import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WorkItemState> buildEffect() {
  return combineEffects(<Object, Effect<WorkItemState>>{
    WorkItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WorkItemState> ctx) {
}
