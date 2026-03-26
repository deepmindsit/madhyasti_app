import '../exporters/app_export.dart';

class CustomToggle extends StatelessWidget {
  CustomToggle({super.key});

  final RxInt selectedIndex = 0.obs;

  final List<String> labels = [
    'All',
    'Received',
    'Sent',
    'Accepted',
    'Declined',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.catBgColor, // 🔥 full grey background
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(labels.length, (index) {
            final isSelected = selectedIndex.value == index;

            return GestureDetector(
              onTap: () => selectedIndex.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ), // 🔥 compact spacing
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: AppColors.catBgColor, // same bg (flat look)
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected
                        ? AppColors.lightPrimary
                        : AppColors.lightTextLowColor,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
