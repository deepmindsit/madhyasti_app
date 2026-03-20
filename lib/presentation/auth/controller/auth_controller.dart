import 'dart:io';

import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class AuthController extends GetxController {
  ////////////////////////////////Onboarding Screen Content//////////////////////////////////
  final pageController = PageController(initialPage: 0);
  final currentPage = 0.0.obs;
  Timer? timer;

  final onboardingData = [
    {
      'description':
          'Discover compatible profiles based on your preferences, community, and lifestyle.',
      'image': AppAssets.onboarding_1,
      'title': 'Find Your\nPerfect Match',
    },
    {
      'description':
          'Send interests, chat securely, and get to know your potential life partner.',
      'image': AppAssets.onboarding_2,
      'title': 'Express Interest &\nStart Conversations',
    },
    {
      'description':
          'Verified members and secure privacy settings to ensure a trusted matchmaking experience.',
      'image': AppAssets.onboarding_3,
      'title': 'Safe &\nVerified Profiles',
    },
  ].obs;

  void navigateToNextPage() {
    if (pageController.page! < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentPage.value < onboardingData.length - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage.value.toInt(),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  ////////////////////////////////Send OTP Screen Content//////////////////////////////////
  final numberController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  ////////////////////////////////Verify OTP Screen Content//////////////////////////////////
  final otpController = TextEditingController();
  final verifyKey = GlobalKey<FormState>();

  var start = 30.obs;
  Timer? _timer;

  void startOTPTimer() {
    start.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        timer.cancel();
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

  ////////////////////////////////Register Screen Content//////////////////////////////////
  final registerKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final selectedGender = Rxn<String>();
  final selectedAge = Rxn<String>();
  final selectedReligion = Rxn<String>();
  final selectedCaste = Rxn<String>();
  final selectedSubCaste = Rxn<String>();
  final isTermsAccepted = false.obs;
  final profileImage = Rx<File?>(null);

  final ageList = ['10', '20', '30', '40'].obs;

  final religionList = ['Hindu', 'Christ', 'Muslim', 'Other'].obs;

  final casteList = ['Marathi', 'Other'].obs;

  final subCasteList = ['Marathi', 'Other'].obs;
}
