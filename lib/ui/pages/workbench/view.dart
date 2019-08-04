
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    WorkbenchState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
        backgroundColor: Colors.tealAccent,
        body:
        Container(
            color: Color(0xffF7F7F7),
            child:Center(
          child: Text("首页",style: TextStyle(color: Colors.red,fontSize: 48),),
        )
    )
  );
}

