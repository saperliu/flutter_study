import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_study/ui/service/model/common/page_data.dart';


enum WorkAction { onRefreshList,onLoadData,setKeyword,setDataList }

class WorkActionCreator {
  static Action onRefreshList() {
    return const Action(WorkAction.onRefreshList);
  }

  static Action onLoadData() {
    return const Action(WorkAction.onLoadData);
  }

  static Action setKeyword(String key) {
    return  Action(WorkAction.setKeyword,payload: key);
  }

  static Action setDataList(PageData pageData ) {
    return  Action(WorkAction.setDataList,payload: pageData);
  }
}
