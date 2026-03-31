import 'package:madhya/core/exporters/app_export.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        // contentType: 'multipart/form-data',
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    );

    /// 🔥 Order matters
    dio.interceptors.addAll([
      AuthInterceptor(), // 1. Add token
      RetryInterceptor(dio), // 2. Retry failed requests
      LoggerInterceptor(), // 3. Log everything
    ]);

    return dio;
  }
}
