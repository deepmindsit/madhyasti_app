import 'package:madhya/core/exporters/app_export.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);

  Future<dynamic> call(RegisterRequest request) async {
    return await repository.register(request);
  }
}
