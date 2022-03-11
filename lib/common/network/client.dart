import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/network/service.dart';

class Client {
  static String _baseUrl = 'https://api.clinic.vietsing.xteldev.com/app';
  static String _authorization = '';

  static const int _CONNECT_TIMEOUT = 1000;
  static const int _RECEIVE_TIMEOUT = 1000;
  static const String _CONTENT_TYPE = 'application/json;charset=utf-8';
  static Dio? _dio;
  static Service? _service;

  static Service getClient() {
    return _service ??= Service(_configDio());
  }

  static final PrettyDioLogger _prettyDioLogger = PrettyDioLogger(
      error: true,
      logPrint: _logPrint,
      request: false,
      requestBody: true,
      responseBody: true,
      requestHeader: true);

  static Map<String, dynamic> makeHeaders({Map<String, dynamic>? addHeader}) {
    Map<String, dynamic> headers = {};
    headers['token'] = _authorization;
    return headers;
  }

  static Dio _configDio() {
    _dio ??= Dio(BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        headers: makeHeaders(),
        contentType: _CONTENT_TYPE))
      ..interceptors.add(_prettyDioLogger);
    return _dio!;
  }

  void setUrl(String? url) {
    if (url != null) {
      _baseUrl = url;
    }
  }

  void setAuthorization(String authorization) {
    _authorization = authorization;
  }

  static void _logPrint(v) {
    showDioLog(v);
  }
}
