import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SettingState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
      child: Scaffold(backgroundColor: Color(0xffF7F7F7),
          body: Center(
            child: Text("设置"),
          )
      )
  );
}
