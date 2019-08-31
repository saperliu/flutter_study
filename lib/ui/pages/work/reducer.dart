import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/common/page_data.dart';

import 'action.dart';
import 'state.dart';

Reducer<WorkState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorkState>>{
      WorkAction.setKeyword: _setKeyword,
      WorkAction.setDataList: _setDataList,
    },
  );
}

WorkState _setKeyword(WorkState state, Action action) {
  final WorkState newState = state.clone();
  return newState;
}
WorkState _setDataList(WorkState state, Action action) {
  final WorkState newState = state.clone();
  final PageData pageData = action.payload?? new PageData();
  LogUtil.e(newState.workItemStateList,tag:"------------_initList-----------------");
  newState.workItemStateList = pageData.list;

  return newState;
}
