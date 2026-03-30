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
      final res = json.decode(response.body);

      if (res['common']['status'] == true) {
        Get.offAllNamed(Routes.mainScreen);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void continueLogin() {
    if (!loginKey.currentState!.validate()) return;

    Get.offAllNamed(Routes.mainScreen);
  }
}
