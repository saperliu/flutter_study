// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarDataModel _$CalendarDataModelFromJson(Map<String, dynamic> json) {
  return CalendarDataModel()
    ..descriptions = json['descriptions'] as String
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CalendarDataModelToJson(CalendarDataModel instance) =>
    <String, dynamic>{
      'descriptions': instance.descriptions,
      'id': instance.id,
      'name': instance.name
    };
