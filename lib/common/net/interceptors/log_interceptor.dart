import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_study/common/config/app_config.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-11 18:10
 * @Description  LOG拦截
 */
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    if (AppConfig.DEBUG) {
      print("LogsInterceptors 请求baseUrl:  ${options.baseUrl}");
      print("LogsInterceptors 请求url：${options.path}");
      print("LogsInterceptors 请求头:  ${options.headers}");
      print("LogsInterceptors 请求参数data:  ${options.data}");
      print("LogsInterceptors 请求参数queryParameters:  ${options.queryParameters}");
      print("LogsInterceptors 请求contentType:  ${options.contentType}");

    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (AppConfig.DEBUG) {
      if (response != null) {
        print("LogsInterceptors 返回结果:  ${response}");
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) {
    if (AppConfig.DEBUG) {
      print("请求异常:  ${err}");
      print("请求异常 message:  ${err.message}");
      print("请求异常 response:  ${err.response}");
      print("请求异常 err.response.statusCode:  ${err.response.statusCode}");
    }

    LogUtil.v(err.response.statusCode,tag:"----------------err.response.statusCode-----");
  if(err.response.statusCode == 401){
    Fluttertoast.showToast(
      msg: "用户失效,请重新登录!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Color(0xff9E9E9E),
    );

  }
    //todo 此处处理了异常，将响应返回给调用端，方便显示错误信息,如果返回错误，则调用端什么也取不到
    return err.response;
  }


}
