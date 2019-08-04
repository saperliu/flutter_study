import 'package:dio/dio.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-11 18:10
 * @Description  header拦截
 */
class HeaderInterceptors extends InterceptorsWrapper {


  @override
  onRequest(RequestOptions options) {
    ///超时
    options.connectTimeout = 15000;

    return options;
  }
}