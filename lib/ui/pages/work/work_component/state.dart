import 'package:fish_redux/fish_redux.dart';

class WorkItemState implements Cloneable<WorkItemState> {

  String workOrderNum;
  String createDate;
  String description;
  String statusName;
  int statusColor;

  @override
  WorkItemState clone() {
    return WorkItemState()
      ..createDate = createDate
      ..description = description
      ..workOrderNum = workOrderNum
      ..statusName = statusName
      ..statusColor = statusColor;
  }
}

WorkItemState initState(Map<String, dynamic> args) {
  return WorkItemState();
}
