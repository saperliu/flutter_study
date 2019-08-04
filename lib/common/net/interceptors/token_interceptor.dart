import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study/common/config/app_config.dart';
import 'package:flutter_study/common/local/local_storage.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-11 18:10
 * @Description  Token拦截
 */
class TokenInterceptors extends InterceptorsWrapper {

  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    LogUtil.v(_token,tag: "TokenInterceptors");
    options.headers["Authorization"] = _token;
    return options;
  }


  @override
  onResponse(Response response) async{
    try {
      var responseJson = response.data;

      if ((response.statusCode == 201 || response.statusCode == 200 )&& (responseJson["access_token"] != null || responseJson["data"]["access_token"] != null)) {
        _token = 'Bearer ' + responseJson["access_token"];
        LogUtil.v(responseJson,tag: "TokenInterceptors   onResponse");
        await LocalStorage.save(AppConfig.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(AppConfig.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.get(AppConfig.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.get(AppConfig.USER_BASIC_CODE);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      this._token = token;
      return token;
    }
  }
}