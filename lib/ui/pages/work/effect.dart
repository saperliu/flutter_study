import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/pages/work/work_component/state.dart';
import 'package:flutter_study/ui/service/model/common/page_data.dart';
import 'action.dart';
import 'state.dart';

Effect<WorkState> buildEffect() {
  return combineEffects(<Object, Effect<WorkState>>{
    Lifecycle.initState: _init,
    WorkAction.onRefreshList: _onRefreshList,
  });
}
void _init(Action action, Context<WorkState> ctx){

  final List<WorkItemState> initList = <WorkItemState>[];

  PageData pageData = new PageData();
  for (int i=0;i<15;i++) {

    WorkItemState state = new WorkItemState();
    state.statusColor = 0xffF88E8C;
    state.statusName = "审批中" ;
    state.description ="工作认真，负责("+i.toString()+")";
    state.workOrderNum ="NP-"+i.toString();
    state.createDate ="2019-08-01 12:00:00";

    initList.add(state);
  }

  pageData.list = initList;
  //将数据放到state上
  ctx.dispatch(WorkActionCreator.setDataList(pageData));
}
void _onRefreshList(Action action, Context<WorkState> ctx) {
}
