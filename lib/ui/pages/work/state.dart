import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/work/work_component/state.dart';

class WorkState implements Cloneable<WorkState> {

  List<WorkItemState> workItemStateList;

  @override
  WorkState clone() {
    return WorkState()
        ..workItemStateList=workItemStateList;
  }
}

WorkState initState(Map<String, dynamic> args) {
  return WorkState();
}
