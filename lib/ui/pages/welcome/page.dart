import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/welcome/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';


class WelcomePage extends Page<WelcomeState, Map<String, dynamic>> {
  WelcomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WelcomeState>(
                adapter: null,
                slots: <String, Dependent<WelcomeState>>{
                }),
            middleware: <Middleware<WelcomeState>>[
            ],);

}
