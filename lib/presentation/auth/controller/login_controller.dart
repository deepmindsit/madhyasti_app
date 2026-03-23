import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class LoginController extends GetxController {
  final numberController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  void continueLogin() {
    if (!loginKey.currentState!.validate()) return;

    // Get.toNamed(Routes.verifyOTP);
    Get.offAllNamed(Routes.mainScreen);
  }
}
