import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WorkState state, Dispatch dispatch, ViewService viewService) {
  return
    Scaffold(
        backgroundColor: Colors.tealAccent,
          body: Center(
            child: Text("工作"),
          )

  );
}
