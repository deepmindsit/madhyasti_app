import '../exporters/app_export.dart';

Widget buildBackgroundImage(ThemeData theme) {
  final isDark = theme.brightness == Brightness.dark;
  return IgnorePointer(
    child: Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.1),
        child: Image.asset(
          isDark ? AppAssets.bgImageDark : AppAssets.bgImage,
          height: Get.height * 0.35,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildTitle(String title) {
  return AppText(
    text: title,
    fontSize: 32.sp,
    textAlign: TextAlign.start,
    maxLines: 2,
    style: TextStyle(
      fontFamily: GoogleFonts.ebGaramond().fontFamily,
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      height: 1,
    ),
  );
}

Widget buildSubTitle(String subTitle, ThemeData theme) {
  return AppText(
    text: subTitle,
    fontSize: 14.sp,
    maxLines: 4,
    textAlign: TextAlign.start,
    style: theme.textTheme.bodyMedium?.copyWith(
      color: AppColors.lightTextLowColor,
    ),
  );
}

Widget buildGenderCard(
  bool isSelected,
  String gender,
  dynamic icon,
  ThemeData theme,
) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: theme.cardColor,
      border: Border.all(
        color: isSelected ? AppColors.lightPrimary : theme.cardColor,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HugeIcon(
          icon: icon,
          color: isSelected ? AppColors.lightPrimary : Colors.grey,
        ),
        Text(
          gender,
          style: TextStyle(
            color: isSelected ? AppColors.lightPrimary : Colors.grey,
          ),
        ),
      ],
    ),
  );
}

void showError(String message) {
  Get.snackbar(
    "Error",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red.shade50,
    colorText: Colors.red,
    margin: EdgeInsets.all(12),
    borderRadius: 8,
  );
}
