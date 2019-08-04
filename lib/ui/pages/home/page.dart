import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/home/tabbar_component/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'package:flutter/widgets.dart';


class HomePageStateStf extends ComponentState<HomeState> with SingleTickerProviderStateMixin {}

class HomePage extends Page<HomeState, Map<String, dynamic>> {

  HomePage()
      : super(
            initState: initHomeState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  "bottomBar": GlobalBottomTabBarConnector()+GlobalBottomTabBarComponent(),
                }),
            middleware: <Middleware<HomeState>>[
            ],);

  @override
  HomePageStateStf createState() => HomePageStateStf();
}
