import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';

enum WorkbenchAction { init}

class WorkbenchActionCreator {
  static Action init(UserInfo userInfo) {
    return  Action(WorkbenchAction.init,payload: userInfo);
  }

}
