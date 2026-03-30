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
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HugeIcon(icon: icon, size: 12.sp, color: color),
        SizedBox(width: 4.w),
        AppText(
          text: text,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ],
    ),
  );

  //   Container(
  //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
  //   decoration: BoxDecoration(
  //     color: Colors.white,
  //     borderRadius: BorderRadius.circular(20.r),
  //   ),
  //   child: Row(
  //     spacing: 4.w,
  //     children: [
  //       HugeIcon(icon: icon, size: 12.r, color: color),
  //       AppText(
  //         text: text,
  //         fontSize: 9.sp,
  //         color: color,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ],
  //   ),
  // );
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

Widget buildDetailItem({
  required String label,
  required String value,
  bool isFill = true,
}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: isFill ? AppColors.grey100 : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: !isFill ? AppColors.grey300 : Colors.transparent,
          width: 0.5.w,
        ),
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

Widget buildSection(
  dynamic child,
  String title,
  dynamic icon,
  dynamic onTap, {
  bool showEdit = true,
}) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.lightPrimary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: HugeIcon(
                icon: icon,
                color: AppColors.lightPrimary,
                size: 20.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (showEdit)
              GestureDetector(
                onTap: onTap,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedEdit02,
                  size: 20.r,
                  color: AppColors.lightTextMidColor,
                ),
              ),
          ],
        ),
        child,
      ],
    ),
  );
}


Widget toggleItem({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : AppColors.grey100,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.lightPrimary : Colors.grey,
            ),
            child: Text(title, textAlign: TextAlign.center),
          ),
        ),
      ),
    ),
  );
}