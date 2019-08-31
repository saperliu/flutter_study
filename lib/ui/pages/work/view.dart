import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/widgets/global_search_input.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

RefreshController refreshController = new RefreshController();
ScrollController _controller = new ScrollController();
TextEditingController textEditingController = TextEditingController();



Widget buildView(WorkState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();


  void _onRefresh() {
    ///下拉刷新
    LogUtil.e("", tag: " -------------if---------------up  refresh :");
    Future<bool> result = dispatch(WorkActionCreator.onRefreshList());
    result.then((onValue) {
      refreshController.refreshCompleted();
    });
  }
  void _onLoading(){
    LogUtil.e("", tag: " 上拉加载更多 :");
    Future<bool> result = dispatch(WorkActionCreator.onLoadData());
    result.then((onValue) {
      if(onValue){
        ///说明已经是最后一页，则不再加载
        refreshController.loadNoData();
      }else{
        refreshController.loadComplete();
      }
    });
  }



  return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xffF7F7F7),
          elevation: 0,
          title: Text("工作列表", style: TextStyle(color: Color(0xff000000),
              fontWeight: FontWeight.w600,
              fontSize: 24)),
          automaticallyImplyLeading: true,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      backgroundColor: Color(0xffF7F7F7),
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xffF7F7F7),
                height: 55,
                padding: EdgeInsets.only(bottom: 9),
                child: SearchInputWidget(
                    controller: textEditingController,
                    onChangeValue: (value) {
                      LogUtil.v(value,
                          tag: "---------SearchInputWidget---------------");
                      dispatch(WorkActionCreator.setKeyword(value));
                    },
                    onEditingComplete:(){
                      dispatch(WorkActionCreator.onRefreshList());
                    }
                ),
              ),

              Expanded(
                  child:
                  LayoutBuilder(builder: (BuildContext c, BoxConstraints bc) {
                    ///防止不够一页时，出现loading的动画
                    double innerListHeight = adapter.itemCount * 100.0;
                    double listHeight = bc.biggest.height;
                    return Container(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: innerListHeight > listHeight,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        header: ClassicHeader(
                          refreshingText: '加载中...',
                          idleIcon: const Icon(Icons.arrow_upward),
                          idleText: "加载更多",
                          releaseText: "开始加载",
                          completeText: "完成",
                        ),
                        footer: ClassicFooter(
                          loadingText:  '加载中...',
                          idleIcon: const Icon(Icons.arrow_upward),
                          idleText: "加载更多",
                          noDataText: "没有更多数据",
                        ),
                        controller: refreshController,
                        child: ListView.builder(
                          controller: _controller,
                          itemBuilder: adapter.itemBuilder,
                          itemCount: adapter.itemCount,
                        ),
                      ),
                    );
                  })
              )
            ],
          )
      )
  );
}
