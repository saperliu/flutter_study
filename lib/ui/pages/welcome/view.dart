import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/common/style/global_style.dart';
import 'package:flutter_study/ui/pages/welcome/state.dart';


Widget buildView(WelcomeState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Color(GlobalColors.white),
    width: double.infinity,
    child:   Image(image:  AssetImage('assets/images/welcome.png'),fit: BoxFit.fill,),

  );
}
