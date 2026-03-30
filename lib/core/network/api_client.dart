
import 'package:injectable/injectable.dart';
import 'package:madhya/core/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.login)
  Future<dynamic> loginUser(
    @Part(name: "username") String userName,
    @Part(name: "password") String password,
  );
}
