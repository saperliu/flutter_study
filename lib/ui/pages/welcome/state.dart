import 'package:fish_redux/fish_redux.dart';

class WelcomeState implements Cloneable<WelcomeState> {

  bool hadInit = false;

  @override
  WelcomeState clone() {
    return WelcomeState()
        ..hadInit = false;
  }



}

WelcomeState initState(Map<String, dynamic> args) {
  return WelcomeState();
}
