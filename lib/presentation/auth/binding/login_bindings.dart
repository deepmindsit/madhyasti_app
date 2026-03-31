import '../../../core/exporters/app_export.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginUsecase(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
