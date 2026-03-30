import '../../core/exporters/app_export.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<dynamic> login(LoginRequest number) async {
    await Future.delayed(const Duration(seconds: 2));
    print("API CALL => Phone: ${number.phone}");
  }
}
