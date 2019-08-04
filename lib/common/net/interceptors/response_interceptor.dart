import 'package:dio/dio.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-11 18:10
 * @Description  响应拦截
 */
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) {
//    RequestOptions option = response.request;
//    try {
//      if (option.contentType != null && option.contentType.primaryType == "text") {
//        return new ResultData(response.data, true, Code.SUCCESS, "", detailMsg: "", headers: response.headers);
//      }
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return new ResultData(response.data, true, Code.SUCCESS, "", detailMsg: "", headers: response.headers);
//      }
//    } catch (e) {
//      print(e.toString() + option.path);
//      return new ResultData(response.data, false, response.statusCode, "", detailMsg: "", headers: response.headers);
//    }
  }
}
