import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;

  RetryInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    /// Retry only for network issues
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.receiveTimeout) {
      try {
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}
