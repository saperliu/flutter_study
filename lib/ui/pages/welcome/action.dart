import 'package:fish_redux/fish_redux.dart';

/**
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-07-08 18:10
 * @Description  欢迎页面
 *
 * 引方法将事件和数据发给 redducer页面，进行状态的改变，进而更新页面
 *
 */
/**
 * on开头是effect的action，没on开头是reducer的action
 */
enum WelcomeAction { action ,hadInit}

class WelcomeActionCreator {
  static Action onAction() {
    return const Action(WelcomeAction.action);
  }

  static Action hadInit(bool hidden){
    return new Action(WelcomeAction.hadInit,payload: hidden);
  }
}
