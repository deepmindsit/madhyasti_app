import '../../../core/exporters/app_export.dart';

class OnboardingComponent extends StatelessWidget {
  final String description;
  final String title;
  final String image;
  final VoidCallback onNextPressed;
  final AuthController controller;

  const OnboardingComponent({
    super.key,
    required this.description,
    required this.title,
    required this.image,
    required this.onNextPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(image, width: Get.width * 0.9)),
              SizedBox(height: Get.height * 0.02),

              /// 🔹 Indicator (HERE ✅)
              OnboardingIndicator(controller: controller),
              SizedBox(height: Get.height * 0.02),
              Text(
                title.tr,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.ebGaramond().fontFamily,
                  color: theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                description.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightTextLowColor,
                  fontFamily: GoogleFonts.manrope().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
