import 'dart:io';
import 'dart:convert';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study/common/config/app_config.dart';
import 'package:flutter_study/common/local/local_storage.dart';
import 'package:flutter_study/common/net/http_api.dart';
import 'package:flutter_study/common/net/result_data.dart';
import 'package:flutter_study/ui/common/service_api.dart';
import 'package:flutter_study/ui/service/model/login/error_model.dart';
import 'package:flutter_study/ui/service/model/login/token_model.dart';
import 'package:flutter_study/ui/service/model/user/user_model.dart';
class UserDao {

  /**
   * 登录
   */
  static Future<ResultData> login(userName, password) async {


    HttpApi().clearAuthorization();

    Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "grant_type": "password",
    };
    RequestOptions requestOptions = new RequestOptions();
    var url = await  ServiceApi.getBaseUrl();
    LogUtil.e(url.toString());
    requestOptions.baseUrl = url;
    requestOptions.contentType = ContentType.parse("application/json");
    var res = await HttpApi().request(Method.post, ServiceApi.APP_LOGIN, queryParameters: data, options: requestOptions);

    if (res != null && res.statusCode == 200) {
      try {

        Map<String, dynamic> user = json.decode(res.toString());
        TokenModel token=   TokenModel.fromJson(user);

        await LocalStorage.save(AppConfig.USER_NAME,userName);
        await LocalStorage.save(AppConfig.USER_PASSWORD,password);

        return new ResultData(token, true, res.statusCode, "");
      } catch (e) {
        return  new ResultData(null, false, 400, "登录信息错误!");
      }
    } else {
      ///错误，如:502/500/密码错误等
      try {
        Map<String, dynamic> user = json.decode(res.toString());
        ErrorModel errorModel=   ErrorModel.fromJson(user);
        return new ResultData(null, false, 400, errorModel.errorDescription);
      } catch (e) {
        LogUtil.e(e,tag: "userDao :");
        return  new ResultData(null, false, 400, "登录失败!");
      }
    }
  }



///本地已经缓存此人的信息，其它地方使用直接调用此方法，不需要再连接服务器
  static Future<UserInfo>  getLocalUserInfo() async{

    String userStr   = await LocalStorage.get(AppConfig.USER_INFO);
    Map<String, dynamic> userInfo =json.decode(userStr);
    UserInfo info = UserInfo.fromJson(userInfo);
    return info;
  }


}
