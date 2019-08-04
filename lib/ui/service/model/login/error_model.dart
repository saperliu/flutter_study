
class ErrorModel {
  String error;
  String errorDescription;


  ErrorModel.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        errorDescription = json['error_description'];

  Map<String, dynamic> toJson() => {
    'error': error,
    "error_description": errorDescription,
  };
}