import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Routes.onboarding);
    // final token = storage.getToken();

    // if (token != null && token.isNotEmpty) {
    //   Get.offAllNamed('/home');
    // } else {
    //   Get.offAllNamed('/login');
    // }
  }
}
