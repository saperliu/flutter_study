
import 'package:flutter_study/common/config/app_config.dart';
import 'package:flutter_study/common/local/local_storage.dart';

///请求的网络地址
class ServiceApi {
  static const String BASEURL = "http://baidu.cn";
  static const String PORT = "80";
  static const String BASEURL_TEST = "http://baidu.cn";
  static const String PORT_TEST = "80";

  //取环境的服务器域名
  static Future<String> getBaseUrl() async{

    dynamic hostUrl =  await  LocalStorage.get(AppConfig.HOST_BASE_ADDRESS);
    dynamic hostPort =  await LocalStorage.get(AppConfig.HOST_BASE_PORT);

    if(hostUrl!=null  && hostUrl.toString()!=""){
      return hostUrl.toString() + ":" + hostPort.toString() + "/api";
    }else {
      if (AppConfig.DEBUG) {
        return BASEURL_TEST + ":" + PORT_TEST + "/api";
      } else {
        return BASEURL + ":" + PORT + "/api";
      }
    }
  }



  /// 登录
  static const  String APP_LOGIN = "/api/login";
  /// 退出
  static const String APP_LEAVE = "/api/leave";


}
