import '../../core/exporters/app_export.dart';

class LoginUsecase {
  final AuthRepository repo;

  LoginUsecase(this.repo);

  Future<dynamic> call(LoginRequest number) async {
    return await repo.login(number);
  }
}
