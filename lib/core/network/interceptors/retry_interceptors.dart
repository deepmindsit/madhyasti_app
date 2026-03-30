import 'package:madhya/core/exporters/app_export.dart';

class RetryInterceptor extends Interceptor {
  @override
  void onError(err, handler) async {
    if (err.type == DioExceptionType.connectionError) {
      final response = await Dio().fetch(err.requestOptions);
      return handler.resolve(response);
    }
    return handler.next(err);
  }
}
