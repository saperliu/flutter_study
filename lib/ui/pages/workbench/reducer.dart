
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<WorkbenchState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorkbenchState>>{
      WorkbenchAction.init: _init,
    },
  );
}

WorkbenchState _init(WorkbenchState state, Action action) {
  final WorkbenchState newState = state.clone();
  newState.userInfo= action.payload;
  return newState;
}
