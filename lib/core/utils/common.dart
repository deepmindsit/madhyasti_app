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

Widget buildHeadingWithButton({
  required String title,
  required String rightText,
  required var onTap,
  bool showRight = true,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(text: title, fontSize: 16.sp, fontWeight: FontWeight.bold),
      if (showRight)
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.lightLowPrimary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: AppText(
              text: rightText,
              fontSize: 12.sp,
              color: AppColors.lightTextLowColor,
            ),
          ),
        ),
    ],
  );
}

Widget badge(String text, Color color, dynamic icon) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      spacing: 4.w,
      children: [
        HugeIcon(icon: icon, size: 12.r, color: color),
        AppText(
          text: text,
          fontSize: 9.sp,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}

Widget headlineWithIcon(String title, dynamic icon) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      /// 🔹 FIXED ICON SIZE
      SizedBox(
        width: 20.w,
        height: 20.h,
        child: Center(
          child: HugeIcon(
            icon: icon,
            size: 18.r,
            color: AppColors.lightPrimary,
          ),
        ),
      ),

      SizedBox(width: 6.w),

      /// 🔹 TEXT
      AppText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextMidColor,
      ),
    ],
  );
}

Widget buildDetailItem({required String label, required String value}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: label,
            textAlign: TextAlign.start,
            fontSize: 12.sp,
            maxLines: 2,
            color: Colors.grey.shade600,
          ),
          SizedBox(height: 2.h),
          AppText(
            text: value.isEmpty ? "-" : value,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );
}
