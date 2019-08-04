import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';

class WorkbenchState implements Cloneable<WorkbenchState> {

  UserInfo userInfo;


  @override
  WorkbenchState clone() {
    return WorkbenchState()
        ..userInfo = userInfo;
  }
}

WorkbenchState initState(Map<String, dynamic> args) {
  return WorkbenchState();
}
