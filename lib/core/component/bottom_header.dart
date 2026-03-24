import '../exporters/app_export.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;

  const BottomSheetHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        SizedBox(height: 12.h),
        AppText(
          text: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 6.h),
        AppText(
          text: subtitle,
          fontSize: 14.sp,
          maxLines: 5,
          textAlign: TextAlign.center,
          color: AppColors.lightTextMidColor,
        ),
      ],
    );
  }
}