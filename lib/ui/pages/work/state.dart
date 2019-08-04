import 'package:fish_redux/fish_redux.dart';

class WorkState implements Cloneable<WorkState> {

  @override
  WorkState clone() {
    return WorkState();
  }
}

WorkState initState(Map<String, dynamic> args) {
  return WorkState();
}
