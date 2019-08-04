import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_study/common/net/interceptors/error_interceptor.dart';
import 'package:flutter_study/common/net/interceptors/header_interceptor.dart';
import 'package:flutter_study/common/net/interceptors/log_interceptor.dart';
import 'package:flutter_study/common/net/interceptors/response_interceptor.dart';
import 'package:flutter_study/common/net/interceptors/token_interceptor.dart';

/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description http请求的工具类
 */

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.options,
    this.pem,
    this.pKCSPath,
    this.pKCSPwd,
  });

  /// Options.
  Options options;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
  String pem;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
  String pKCSPath;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
  String pKCSPwd;
}

/// 单例 DioUtil.
/// debug模式下可以打印请求日志. DioUtil.openDebug().
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class HttpApi {
  static final HttpApi _singleton = HttpApi._init();

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  static Dio _dio;

  String _baseUrl = "";

  /// Options.
  BaseOptions _options = getDefOptions();

  /// PEM证书内容.
  String _pem;

  /// PKCS12 证书路径.
  String _pKCSPath;

  /// PKCS12 证书密码.
  String _pKCSPwd;

  /// 是否是debug模式.
  static bool _isDebug = false;

  static HttpApi getInstance() {
    return _singleton;
  }

  factory HttpApi() {
    return _singleton;
  }

  HttpApi._init() {
    _dio = new Dio(_options);

    _dio.interceptors.add(new HeaderInterceptors());

    _dio.interceptors.add(_tokenInterceptors);

    _dio.interceptors.add(new LogsInterceptors());

    _dio.interceptors.add(new ErrorInterceptors(_dio));

    _dio.interceptors.add(new ResponseInterceptors());
  }

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  /// set Config.
  void setConfig(HttpConfig config) {
    _mergeOption(config.options);
    _pem = config.pem ?? _pem;
    if (_dio != null) {
      _dio.options = _options;
      if (_pem != null) {
        (_dio.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate = (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            if (cert.pem == _pem) {
              // 证书一致，则放行
              return true;
            }
            return false;
          };
        };
      }
      ;
      if (_pKCSPath != null) {
        (_dio.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate = (HttpClient client) {
          SecurityContext sc = new SecurityContext();
          //file为证书路径
          sc.setTrustedCertificates(_pKCSPath, password: _pKCSPwd);
          HttpClient httpClient = new HttpClient(context: sc);
          return httpClient;
        };
      }
    }
  }

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  Future<Response> request<T>(String method, String path,
      {data,
      Map<String, dynamic> queryParameters,
      RequestOptions options,
      CancelToken cancelToken}) async {
//    print("请求  baseUrl:  ${options.baseUrl}");
//    print("请求  path:  ${path}");
//    print("请求  headers:  ${options.headers}");
//    print("请求  method:  ${method}");
//    print("请求  data:  ${data}");
//    print("请求  queryParameters:  ${queryParameters}");
    Response response;
    options.method = method;
    try {
      response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: _mergeOption(options),
          cancelToken: cancelToken);

      print("HttpApi  response:  ${response}");

      return response;
    } on DioError catch (e) {
      print("HttpApi  catch error:  ${e}");
      return response;
    }
  }

  /// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
  /// [urlPath]: The file url.
  /// [savePath]: The path to save the downloading file later.
  /// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
  Future<Response> download(
    String urlPath,
    savePath, {
    ProgressCallback onProgress,
    CancelToken cancelToken,
    data,
    Options options,
  }) {
    Future<Response> response;
    try {
      response = _dio.download(urlPath, savePath,
          onReceiveProgress: onProgress,
          cancelToken: cancelToken,
          data: data,
          options: options);
      return response;
    } catch (e) {
      print("HttpApi download  response:  ${e.toString()}");
      return response;
    }
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }


  /// merge Option.
  Options _mergeOption(RequestOptions opt) {
    _options.baseUrl = opt.baseUrl?? _options.baseUrl;
    _options.method = opt.method ?? _options.method;
    _options.headers = (new Map.from(_options.headers))..addAll(opt.headers);
    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
    _options.responseType = opt.responseType ?? _options.responseType;
    _options.extra = (new Map.from(_options.extra))..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  }

  /// get dio.
  Dio getDio() {
    return _dio;
  }

  /// create new dio.
  static Dio createNewDio([BaseOptions options]) {
    options = options ?? getDefOptions();
    Dio dio = new Dio(options);
    return dio;
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = new BaseOptions();
    options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 20;
    options.receiveDataWhenStatusError = true;
    return options;
  }
}
