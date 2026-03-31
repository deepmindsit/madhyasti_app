import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class LoginController extends GetxController {
  final LoginUsecase usecase;

  LoginController(this.usecase);

  final numberController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  void login() async {
    if (!loginKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final response = await usecase(
        LoginRequest(numberController.text.trim()),
      );

      if (response['common']['status'] == true) {
        Get.snackbar('Success', response['common']['message']);
        Get.toNamed(Routes.verifyOTP);
      }
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }
}
