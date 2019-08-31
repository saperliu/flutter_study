import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/work/state.dart';
import 'package:flutter_study/ui/pages/work/work_component/component.dart';
import 'package:flutter_study/ui/pages/work/work_component/state.dart';

import 'reducer.dart';

class WorkListAdapter extends DynamicFlowAdapter<WorkState> {
  WorkListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'workItem':WorkItemComponent(),
          },
          connector: _WorkListConnector(),
          reducer: buildReducer(),
        );
}

class _WorkListConnector extends ConnOp<WorkState, List<ItemBean>> {
  @override
  List<ItemBean> get(WorkState state) {
    if (state.workItemStateList?.isNotEmpty == true) {
      return state.workItemStateList
          .map<ItemBean>((WorkItemState data) => ItemBean('workItem', data))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(WorkState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.workItemStateList = List<WorkItemState>.from(
          items.map<WorkItemState>((ItemBean bean) => bean.data).toList());
    } else {
      state.workItemStateList = <WorkItemState>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
