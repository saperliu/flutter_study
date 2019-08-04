import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserInfo {


//  @ApiModelProperty(value = "姓名")
   String name;

//  @ApiModelProperty(value = "性别")
   String gender;

//  @ApiModelProperty(value = "手机号")
   String mobile;

//  @ApiModelProperty(value = "邮箱")
   String email;

//  @ApiModelProperty(value = "登录名")
   String loginName;

//  @ApiModelProperty(value = "密码")
   String password;

   UserInfo();
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  ///编译后不会显示红线
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the , generated
  ///编译后不会显示红线
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
