
/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description  接口的返回数据
 */
class ResultData<T> {
  var msg;
  var detailMsg;
  T data;
  bool success;
  var errorCode;
  var headers;

  ResultData(this.data, this.success, this.errorCode, this.msg,
      {this.detailMsg, this.headers});

  @override
  String toString() {
    return 'ResultData{msg: $msg, detailMsg: $detailMsg, data: $data, success: $success, errorCode: $errorCode, headers: $headers}';
  }
}
