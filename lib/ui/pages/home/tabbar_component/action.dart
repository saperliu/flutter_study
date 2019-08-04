import 'package:fish_redux/fish_redux.dart';


enum GlobalBottomTabBarAction { onSelectOrder }

class GlobalBottomTabBarActionCreator {

  static Action onSelectOrder(String value) {
    return  Action(GlobalBottomTabBarAction.onSelectOrder,payload: value);
  }
}
