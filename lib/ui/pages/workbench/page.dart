import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WorkbenchPage extends Page<WorkbenchState, Map<String, dynamic>> {
  WorkbenchPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WorkbenchState>(
                adapter: null,
                slots: <String, Dependent<WorkbenchState>>{
                }),
            middleware: <Middleware<WorkbenchState>>[
            ],);

}
