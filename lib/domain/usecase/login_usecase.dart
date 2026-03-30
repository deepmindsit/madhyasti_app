import '../../core/exporters/app_export.dart';

class LoginUsecase {
  final AuthRepository repo;
  LoginUsecase(this.repo);

  Future<dynamic> call(LoginRequest number) async {
    await repo.login(number);
  }
}
