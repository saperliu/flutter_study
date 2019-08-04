import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(NoticeState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFF92A4FF),
          body: Center(
            child: Text("消息"),
          )
      )
  );
}
