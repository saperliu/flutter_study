import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/work/state.dart';

import 'action.dart';


Reducer<WorkState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorkState>>{
//      WorkListAction.action: _onAction,
    },
  );
}

