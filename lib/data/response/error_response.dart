import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

class ErrorResponse {
  String? error;

  ErrorResponse({this.error});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }
}
