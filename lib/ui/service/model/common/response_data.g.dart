// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData()
    ..msg = json['msg'] as String
    ..detailMsg = json['detailMsg'] as String
    ..data = json['data']
    ..success = json['success'] as bool
    ..errorCode = json['errorCode'] as String;
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'detailMsg': instance.detailMsg,
      'data': instance.data,
      'success': instance.success,
      'errorCode': instance.errorCode
    };
