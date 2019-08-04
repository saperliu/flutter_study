/**
 * All rights Reserved, Designed By saperliu
 * Copyright:    Copyright(C) 2018-2019
 * Company   saperliu
 *
 * @author 刘广路
 * @version 1.0.0
 * @date 2019-07-15 14:42
 * @Description
 */



import 'package:json_annotation/json_annotation.dart';

//编译后不会显示红线
part 'calendar_page_query_vo.g.dart';

/**
 * 日历视图查询条件的VO
 */
@JsonSerializable()
class CalendarPageQueryVo {
String name ;//
String type ;//
int pageSize;//每页数据
int pageNum;//第几页

CalendarPageQueryVo();
/// A necessary factory constructor for creating a new User instance
/// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
///编译后不会显示红线
factory CalendarPageQueryVo.fromJson(Map<String, dynamic> json) => _$CalendarPageQueryVoFromJson(json);

/// `toJson` is the convention for a class to declare support for serialization
/// to JSON. The implementation simply calls the private, generated
///编译后不会显示红线
Map<String, dynamic> toJson() => _$CalendarPageQueryVoToJson(this);
}