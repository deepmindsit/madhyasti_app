import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class OtpController extends GetxController {
  final otpController = TextEditingController();
  final verifyKey = GlobalKey<FormState>();

  var start = 30.obs;
  Timer? _timer;

  void startTimer() {
    start.value = 30;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (start.value == 0) {
        _timer?.cancel();
      } else {
        start.value--;
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  /// Extract OTP from full SMS
  String extractOtp(String sms) {
    final exp = RegExp(r'\b\d{6}\b');
    return exp.firstMatch(sms)?.group(0) ?? "";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
