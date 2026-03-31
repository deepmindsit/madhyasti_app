// core/network/interceptors/logger_interceptor.dart
import 'dart:developer';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) {
    log("➡️ REQUEST: ${options.method} ${options.uri}");
    log("Headers: ${options.headers}");
    log("Body: ${options.data}");
    handler.next(options);
  }

  @override
  void onResponse(response, handler) {
    log("✅ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}");
    log("Data: ${response.data}");
    handler.next(response);
  }

  @override
  void onError(err, handler) {
    log("❌ ERROR: ${err.message}");
    handler.next(err);
  }
}
