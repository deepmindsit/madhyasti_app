import 'package:madhya/core/exporters/app_export.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = "demo";
    options.headers['Authorization'] = "Bearer $token";
    super.onRequest(options, handler);
  }
}
