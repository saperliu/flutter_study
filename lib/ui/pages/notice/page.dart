import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NoticePage extends Page<NoticeState, Map<String, dynamic>> {
  NoticePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NoticeState>(
                adapter: null,
                slots: <String, Dependent<NoticeState>>{
                }),
            middleware: <Middleware<NoticeState>>[
            ],);

}
