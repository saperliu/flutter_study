// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo()
    ..name = json['name'] as String
    ..gender = json['gender'] as String
    ..mobile = json['mobile'] as String
    ..email = json['email'] as String
    ..loginName = json['loginName'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'email': instance.email,
      'loginName': instance.loginName,
      'password': instance.password
    };
