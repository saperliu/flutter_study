import 'package:json_annotation/json_annotation.dart';

//编译后不会显示红线
part 'page_data.g.dart';

@JsonSerializable()
class PageData {

  bool firstPage;
  bool lastPage;
  int pageNum;
  int pageSize;
  int pages;
  int total;
  dynamic list;


  PageData();
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$PageDataFromJson()` constructor.
  ///编译后不会显示红线
  factory PageData.fromJson(Map<String, dynamic> json) => _$PageDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  ///编译后不会显示红线
  Map<String, dynamic> toJson() => _$PageDataToJson(this);
}