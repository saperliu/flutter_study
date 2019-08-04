import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';

class LoginState implements Cloneable<LoginState> {

  UserInfo userInfo;
  @override
  LoginState clone() {
    return LoginState()
            ..userInfo = userInfo;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
