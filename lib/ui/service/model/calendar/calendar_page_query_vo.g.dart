// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_page_query_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarPageQueryVo _$CalendarPageQueryVoFromJson(Map<String, dynamic> json) {
  return CalendarPageQueryVo()
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..pageSize = json['pageSize'] as int
    ..pageNum = json['pageNum'] as int;
}

Map<String, dynamic> _$CalendarPageQueryVoToJson(
        CalendarPageQueryVo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'pageSize': instance.pageSize,
      'pageNum': instance.pageNum
    };
