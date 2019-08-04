import 'package:json_annotation/json_annotation.dart';

//编译后不会显示红线
part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {

  String msg;
  String detailMsg;
  dynamic data;
  bool success;
  String errorCode;

  ResponseData();
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  ///编译后不会显示红线
  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  ///编译后不会显示红线
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}