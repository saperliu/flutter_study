import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/utils/common_utils.dart';
import 'package:flutter_study/ui/common/style/global_style.dart';
import 'package:flutter_study/ui/common/style/style_utils.dart';
import 'package:flutter_study/ui/pages/home/action.dart';
import 'package:flutter_study/ui/pages/notice/page.dart';
import 'package:flutter_study/ui/pages/setting/page.dart';
import 'package:flutter_study/ui/pages/work/page.dart';
import 'package:flutter_study/ui/pages/workbench/page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'action.dart';

//_renderTab(icon, text) {
//  return Tab(
//    icon: Icon(icon, size: 18.0),
//    text: text,
//  );
//}

Widget buildView(Map<String, dynamic> state, Dispatch dispatch, ViewService viewService) {
  ///每个TAB对应的页面
  List<Widget> tabPageList = new List();
  tabPageList.add(new WorkbenchPage().buildPage(null));
  tabPageList.add(new WorkPage().buildPage(null));
  tabPageList.add(new WorkPage().buildPage(null));
  tabPageList.add(new NoticePage().buildPage(null));
  tabPageList.add(new SettingPage().buildPage(null));

//  final TabController tabController = state['tabController'];
  final String selectOrder = state['selectOrder'];

  return Scaffold(
    backgroundColor: Colors.white,
//    body: TabBarView(
//      controller: tabController,
//      children: tabPageList.toList(),
//    ),
    body: tabPageList[state["pageIndex"]],
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Stack(
      children: <Widget>[
        Positioned(
            top: 40,
            left: 30,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff475B7B),
                      blurRadius: 100.0,
                      spreadRadius: 5)
                ],
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
            )),
        GestureDetector(
          child: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
//            boxShadow: [BoxShadow(color: Color(0xff475B7B), offset: Offset(-10, -10), blurRadius: 1.0, spreadRadius: 0.001)],
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 28,
                  color: Color(0xff8B83F0),
                ),
              )),
          onTap: () {
          },
        ),
      ],
    ),


    bottomNavigationBar: Container(
      height: 60,
      color: Color(GlobalColors.white),
      child: BottomNavigationBar(
        backgroundColor: Color(0xffF7F7F7),
        unselectedItemColor: Color(0xff798592),

        items: [
          BottomNavigationBarItem(
              icon: state['workbench'] ? new Icon( Icons.work,color: Colors.blue): new Icon( Icons.work,color: Colors.grey ), title:  Text(StyleUtils.getLocale(viewService.context).home_workbench)),
          BottomNavigationBarItem(
              icon: state['backlog'] ? new Icon( Icons.watch_later,color: Colors.blue): new Icon( Icons.watch_later,color: Colors.grey ), title:  Text(StyleUtils.getLocale(viewService.context).home_todo)),
          BottomNavigationBarItem(
              icon: new Icon(Icons.category),title: Text("")),
          BottomNavigationBarItem(
              icon: state['notice'] ? new Icon( Icons.chat,color: Colors.blue): new Icon( Icons.chat,color: Colors.grey ), title:  Text(StyleUtils.getLocale(viewService.context).home_notice)),
          BottomNavigationBarItem(
              icon: state['setting'] ? new Icon( Icons.settings,color: Colors.blue): new Icon( Icons.settings,color: Colors.grey ), title:  Text(StyleUtils.getLocale(viewService.context).home_setting)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: state["pageIndex"],
        onTap: (int index) {

          if(index==0){
            dispatch(HomeActionCreator.workbenchSelect());
          }
          if(index==1){
            dispatch(HomeActionCreator.backlogSelect());
          }
          if(index==3){
            dispatch(HomeActionCreator.noticeSelect());
          }
          if(index==4){
            dispatch(HomeActionCreator.settingSelect());
          }
          LogUtil.v(index,tag: "------TabBar---index--------------");
        },
      ),
    ),
  );
}
