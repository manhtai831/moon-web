import 'dart:convert';

class BaseResponse {
  String? requestId;
  String? at;
  Error? error;
  dynamic data;

  BaseResponse({this.requestId, this.at, this.error, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    at = json['at'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    data = json['data'];
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
