import '../../core/exporters/app_export.dart';

abstract class AuthRepository {
  Future<dynamic> login(LoginRequest number);
}
