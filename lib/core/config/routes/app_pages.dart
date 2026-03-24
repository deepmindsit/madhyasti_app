import '../../exporters/app_export.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashPage()),
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.verifyOTP, page: () => VerifyOTPScreen()),
    GetPage(name: Routes.registerScreen, page: () => RegisterScreen()),
    GetPage(name: Routes.addProfile, page: () => ProfileAdd()),
    GetPage(name: Routes.mainScreen, page: () => NavigationScreen()),
    GetPage(name: Routes.othersProfile, page: () => OtherProfile()),
  ];
}
