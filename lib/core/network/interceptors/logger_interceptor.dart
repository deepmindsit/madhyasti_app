// core/network/interceptors/logger_interceptor.dart

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onResponse(response, handler) {
    print("RESPONSE: ${response.data}");
    return handler.next(response);
  }
}
