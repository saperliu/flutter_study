import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/welcome/state.dart';

import 'action.dart';


Reducer<WelcomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<WelcomeState>>{
      WelcomeAction.action: _onAction,
    },
  );
}

WelcomeState _onAction(WelcomeState state, Action action) {
  final WelcomeState newState = state.clone();
  return newState;
}

WelcomeState hadInit(WelcomeState state, Action action) {
  final WelcomeState newState = state.clone();
  newState.hadInit = action.payload;
  return newState;
}

