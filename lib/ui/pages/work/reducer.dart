import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WorkState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorkState>>{
      WorkAction.action: _onAction,
    },
  );
}

WorkState _onAction(WorkState state, Action action) {
  final WorkState newState = state.clone();
  return newState;
}
