import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WorkPage extends Page<WorkState, Map<String, dynamic>> {
  WorkPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WorkState>(
                adapter: NoneConn<WorkState>() + WorkListAdapter(),
                slots: <String, Dependent<WorkState>>{
                }),
            middleware: <Middleware<WorkState>>[
            ],);

}
