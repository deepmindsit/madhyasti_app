import '../../../core/exporters/app_export.dart';

class ShortlistBottomsheet extends StatelessWidget {
  final bool isUnlocked;

  const ShortlistBottomsheet({super.key, this.isUnlocked = false});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetLayout(child: isUnlocked ? _success() : _locked());
  }

  Widget _locked() {
    return Column(
      children: [
        BottomSheetHeader(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSquareUnlock02,
            size: 60.r,
            color: AppColors.lightSecondary,
          ),
          title: 'Unlock Shortlist Feature',
          subtitle:
              'Upgrade your membership to save and\naccess shortlisted profiles anytime.',
        ),
        SizedBox(height: 20.h),

        AppButton(
          text: 'Upgrade Now',
          onTap: () {},
          backgroundColor: AppColors.lightPrimary,
        ),
        SizedBox(height: 10.h),
        AppButton(
          text: 'Maybe Later',
          onTap: Get.back,
          type: AppButtonType.secondary,
          textColor: AppColors.lightTextLowColor,
        ),
      ],
    );
  }

  Widget _success() {
    return Column(
      children: [
        BottomSheetHeader(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedStar,
            size: 60.r,
            color: AppColors.lightSecondary,
          ),
          title: 'Added to Shortlist ⭐',
          subtitle: 'You can view this profile anytime\nfrom your shortlist.',
        ),
        SizedBox(height: 20.h),
        AppButton(
          text: 'View Shortlist',
          onTap: () {},
          backgroundColor: AppColors.lightPrimary,
        ),
      ],
    );
  }
}
