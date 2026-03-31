import 'package:madhya/core/exporters/app_export.dart';

class CommonDataUsecase {
  final AuthRepository authRepository;

  CommonDataUsecase(this.authRepository);

  Future<dynamic> call() async {
    return await authRepository.getCommonData();
  }
}
