// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageData _$PageDataFromJson(Map<String, dynamic> json) {
  return PageData()
    ..firstPage = json['firstPage'] as bool
    ..lastPage = json['lastPage'] as bool
    ..pageNum = json['pageNum'] as int
    ..pageSize = json['pageSize'] as int
    ..pages = json['pages'] as int
    ..total = json['total'] as int
    ..list = json['list'];
}

Map<String, dynamic> _$PageDataToJson(PageData instance) => <String, dynamic>{
      'firstPage': instance.firstPage,
      'lastPage': instance.lastPage,
      'pageNum': instance.pageNum,
      'pageSize': instance.pageSize,
      'pages': instance.pages,
      'total': instance.total,
      'list': instance.list
    };
