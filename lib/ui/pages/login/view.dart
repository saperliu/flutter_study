
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/common/utils/common_utils.dart';

import 'package:flutter_study/ui/common/style/global_style.dart';
import 'package:flutter_study/ui/common/style/style_utils.dart';
import 'package:flutter_study/ui/service/dao/user_dao.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';
import 'package:flutter_study/ui/widgets/global_flex_button.dart';
import 'package:flutter_study/ui/widgets/global_input_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'action.dart';
import 'state.dart';

var _userName = "";
var _password = "";
final TextEditingController userController = new TextEditingController();
final TextEditingController pwController = new TextEditingController();



Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {

  Future<bool> _requestPop() {
    ///因为是登录界面,最后一个页面，直接退出，防止退到欢迎页面
    SystemNavigator.pop();
    return new Future.value(false);
  }


  return  WillPopScope(
     child:Scaffold(
       resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.grey,
      body: ListView(
        children: <Widget>[
          Container(
            margin:  EdgeInsets.only(left: 30.0, top: 115.0, right: 30.0, bottom: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image(
                    image:  AssetImage(GlobalIcons.DEFAULT_USER_ICON),
                    width: 174.0,
                    height: 65.0),
                Container(
                    margin: EdgeInsets.only(top:10),
                    child: Text(
                      StyleUtils.getLocale(viewService.context).app_name,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
//              new Padding(
//                  padding: new EdgeInsets.only(
//                      left: 0, top: 127.0, right: 0, bottom: 0)),
                Container(
                  margin: EdgeInsets.only(top: 127),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide.none),
                  ),
//                child:
//                new  EnsureVisibleWhenFocused(
                  child: GlobalInputWidget(
                    hintText: StyleUtils.getLocale(viewService.context)
                        .login_username_hint_text,
                    hintStyle: GlobalConstant.middleTextWhite,
                    icon: Icon(GlobalIcons.LOGIN_USER,color: Color(0xffffffff),size: 28,),
//                  iconImage: GlobalIcons.LOGIN_USER_ICON,
                    textStyle: TextStyle(color: Colors.white),

                    onChanged: (String value) {
                      _userName = value;
                    },
                    controller: userController,
//                    focusNode: _focusNodePassword,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide.none),
                  ),
                  child: new GlobalInputWidget(
                    hintText: StyleUtils.getLocale(viewService.context)
                        .login_password_hint_text,
                    hintStyle: GlobalConstant.middleTextWhite,
                    icon: Icon(GlobalIcons.LOGIN_PASSWORD,color: Color(0xffffffff),size: 28),
//                  iconImage: GlobalIcons.LOGIN_PASSWORD_ICON,
                    textStyle: TextStyle(color: Colors.white),
                    obscureText: true,
                    onChanged: (String value) {
                      _password = value;
                    },
                    controller: pwController,
                  ),
                ),

                new Padding(padding: new EdgeInsets.all(30.0)),
                new Material(
                  borderRadius: BorderRadius.circular(20.0),
//                shadowColor: Colors.blue.shade200,
                  elevation: 5.0,
                  child: GlobalFlexButton(
                    text: StyleUtils.getLocale(viewService.context).login_text,
                    fontSize: 20,
                    color: Colors.lightBlue,
                    textColor: Color(GlobalColors.textWhite),
                    onPress: () {


//                      if (_userName == null || _userName.length == 0) {
//                        CommonUtils.showAlertDialog(viewService.context,"提示","请填写用户名称",type: AlertType.info);
//                        return;
//                      }
//                      if (_password == null || _password.length == 0) {
//                        CommonUtils.showAlertDialog(viewService.context,"提示","请填写密码",type: AlertType.info);
//                        return;
//                      }

                      dispatch(LoginActionCreator.onGoHome());


                    },
                  ),
                ),
              ],
            ),
//        ),
          ),
        ],
      )

    ),
    onWillPop: _requestPop,);
//  );
}
