import 'package:fish_redux/fish_redux.dart';

enum WorkListAction { action }

class WorkListActionCreator {
  static Action onAction() {
    return const Action(WorkListAction.action);
  }
}
