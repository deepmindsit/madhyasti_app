import '../../../core/exporters/app_export.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpUsecase(Get.find()));
    Get.lazyPut(() => OtpController(Get.find()));
  }
}
