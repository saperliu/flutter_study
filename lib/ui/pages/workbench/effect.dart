
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WorkbenchState> buildEffect() {
  return combineEffects(<Object, Effect<WorkbenchState>>{
    Lifecycle.initState:_onInit,
  });
}

void _onInit(Action action, Context<WorkbenchState> ctx) async  {

}
