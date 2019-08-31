import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WorkItemAction { action }

class WorkItemActionCreator {
  static Action onAction() {
    return const Action(WorkItemAction.action);
  }
}
