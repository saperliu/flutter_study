import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WorkAction { action }

class WorkActionCreator {
  static Action onAction() {
    return const Action(WorkAction.action);
  }
}
