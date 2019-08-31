import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WorkItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorkItemState>>{
      WorkItemAction.action: _onAction,
    },
  );
}

WorkItemState _onAction(WorkItemState state, Action action) {
  final WorkItemState newState = state.clone();
  return newState;
}
