import 'package:madhya/core/exporters/app_export.dart';

class PartnerPreference extends StatelessWidget {
  const PartnerPreference({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                text:
                    'At times, we may recommend matches that go slightly beyond your preferences based on Acceptable matches criteria.',
                fontSize: 14.sp,
                maxLines: 5,
                color: AppColors.lightTextLowColor,
              ),
            ),
            _buildBasicDetails(),
            _buildProfessionalDetails(),
            _buildReligionDetails(),
            _buildLocationDetails(),
          ],
        ),
      ),
    );
  }

  CustomAppbar _buildAppBar(theme) {
    return CustomAppbar(
      title: 'Partner Preference',
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
    );
  }

  Widget _buildBasicDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Marital Status',
                value: 'Never Married',
                isFill: false,
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Partner Age From',
                value: '-',
                isFill: false,
              ),
              buildDetailItem(
                label: 'Partner Age To',
                value: '-',
                isFill: false,
              ),
            ],
          ),

          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Partner Height From',
                value: '-',
                isFill: false,
              ),
              buildDetailItem(
                label: 'Partner Height To',
                value: '-',
                isFill: false,
              ),
            ],
          ),
        ],
      ),
      'Basic Details',
      HugeIcons.strokeRoundedUserAccount,
      () => Get.toNamed(Routes.partnerBasicDetailsEdit),
    );
  }

  Widget _buildProfessionalDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Education Category',
                value: '-',
                isFill: false,
              ),
              buildDetailItem(
                label: 'Education Detail',
                value: '-',
                isFill: false,
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Job Category', value: '-', isFill: false),
              buildDetailItem(label: 'Job Detail', value: '-', isFill: false),
            ],
          ),
        ],
      ),
      'Professional Info',
      HugeIcons.strokeRoundedProfile02,
      () => Get.toNamed(Routes.partnerProfessionalDetailsEdit),
    );
  }

  Widget _buildReligionDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Religion', value: 'Hindu', isFill: false),
              buildDetailItem(
                label: 'Caste / Community',
                value: 'other',
                isFill: false,
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Sub Caste', value: '-', isFill: false),
            ],
          ),
        ],
      ),
      'Religion Info',
      HugeIcons.strokeRoundedWavingHand01,
      () => Get.toNamed(Routes.partnerReligionDetailsEdit),
    );
  }

  Widget _buildLocationDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Country', value: 'India', isFill: false),
              buildDetailItem(
                label: 'State',
                value: 'Maharashtra',
                isFill: false,
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'City', value: '-', isFill: false),
            ],
          ),
        ],
      ),
      'Location',
      HugeIcons.strokeRoundedLocation05,
      () => Get.toNamed(Routes.partnerLocationDetailsEdit),
    );
  }
}
