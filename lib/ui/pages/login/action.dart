import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';


enum LoginAction { onGoHome }

class LoginActionCreator {

  static Action onGoHome(){
    return new Action(LoginAction.onGoHome);
  }

}
