import '../../../core/exporters/app_export.dart';

class ContactBottomsheet extends StatelessWidget {
  final bool isUnlocked;

  const ContactBottomsheet({super.key, this.isUnlocked = false});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetLayout(child: isUnlocked ? _details() : _locked());
  }

  Widget _locked() {
    return Column(
      children: [
        BottomSheetHeader(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSquareUnlock02,
            size: 60.r,
            color: AppColors.lightPrimary,
          ),
          title: 'Unlock Contact Details',
          subtitle:
              'Upgrade your membership to view the mobile\nnumber and connect directly with this profile.',
        ),
        SizedBox(height: 20.h),
        AppButton(
          text: 'Upgrade',
          onTap: () {},
          backgroundColor: AppColors.lightPrimary,
        ),
      ],
    );
  }

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        SizedBox(height: 12.h),
        _contactCard(
          'Mobile: +91 98XXXXXX45',
          HugeIcons.strokeRoundedSmartPhone01,
        ),
        SizedBox(height: 10.h),
        _contactCard(
          'WhatsApp: +91 98XXXXXX45',
          HugeIcons.strokeRoundedWhatsapp,
        ),
        SizedBox(height: 20.h),
        AppButton(
          text: 'Got It',
          onTap: Get.back,
          backgroundColor: AppColors.lightPrimary,
        ),
      ],
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Contact Details',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        AppText(
          text: 'Connect directly using the details below.',
          fontSize: 13.sp,
          color: AppColors.lightTextLowColor,
        ),
      ],
    );
  }

  Widget _contactCard(String title, dynamic icon) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          HugeIcon(icon: icon, size: 18.r),
          SizedBox(width: 10.w),
          Expanded(
            child: AppText(
              text: title,
              fontSize: 14.sp,
              color: AppColors.lightTextMidColor,
            ),
          ),
        ],
      ),
    );
  }
}
