import 'package:event_bus/event_bus.dart';

///错误编码
class EventUtil {

  ///工作台的中间创建工单时使用
  static  final EventBus eventBus = new EventBus();

///人员表列表选择时候使用
  static  EventBus personBus = new EventBus();

  ///报修列表刷新的监听
  static  EventBus repairListBus = new EventBus();

  ///转单人的分派人的选择
  static  EventBus transferPerson = new EventBus();
}
