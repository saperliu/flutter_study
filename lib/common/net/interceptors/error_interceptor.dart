import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study/common/net/code.dart';
import 'package:flutter_study/common/net/result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-11 18:10
 * @Description  错误拦截
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(null, false,
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", false), "",
          detailMsg: Code.NETWORK_ERROR, headers: options.headers));
    }
    return options;
  }
}
