import '../../../core/exporters/app_export.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommonDataUsecase(Get.find()));
    Get.lazyPut<RegisterUsecase>(() => RegisterUsecase(Get.find()));
    Get.lazyPut(() => CasteByRelUsecase(Get.find()));
    Get.lazyPut(() => SubCasteByCasteUsecase(Get.find()));
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find(), Get.find(), Get.find(), Get.find()),
    );
  }
}
