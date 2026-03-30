import 'package:madhya/core/exporters/app_export.dart';

class PartnerReligionDetailsEdit extends StatelessWidget {
  PartnerReligionDetailsEdit({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: 'Religious Preferences'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            Row(
              spacing: 16.w,
              children: [
                buildDetailItem(label: 'Religion', value: 'Hindu'),
                Expanded(child: _buildCasteDropdown()),
              ],
            ),
            _buildSubCasteDropdown(),
            AppButton(
              text: 'Submit',
              onTap: () {},
              backgroundColor: AppColors.lightPrimary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCasteDropdown() {
    return AppDropdownSearch<String>(
      title: "Caste / Community",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Select",
      showSearchBox: false,
      searchHintText: "Search Caste / Community",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildSubCasteDropdown() {
    return AppDropdownSearch<String>(
      title: "Sub Caste",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Select",
      showSearchBox: false,
      searchHintText: "Search Sub Caste",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }
}
