/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-04-08 18:10
 * @Description  事件接口
 */
class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}
