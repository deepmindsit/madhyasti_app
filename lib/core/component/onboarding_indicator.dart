
import '../exporters/app_export.dart';

class OnboardingIndicator extends StatelessWidget {
  final AuthController controller;

  const OnboardingIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.onboardingData.length, (index) {
          bool isActive = controller.currentPage.value == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            // margin: const EdgeInsets.symmetric(horizontal: 4),
            width: Get.width * 0.28.w,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isActive ? AppColors.lightPrimary : Colors.grey.shade400,
            ),
          );
        }),
      );
    });
  }
}
