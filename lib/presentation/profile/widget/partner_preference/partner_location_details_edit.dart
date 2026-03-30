import '../../../../core/exporters/app_export.dart';

class PartnerLocationDetailsEdit extends StatelessWidget {
  PartnerLocationDetailsEdit({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Location Details Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            Row(
              spacing: 16.w,
              children: [
                Expanded(child: _buildCountryDropdown()),
                Expanded(child: _buildStateDropdown()),
              ],
            ),
            Row(
              spacing: 16.w,
              children: [
                Expanded(child: _buildDistrictDropdown()),
                Expanded(child: _buildCityDropdown()),
              ],
            ),
            SizedBox(height: 16.h),
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

  Widget _buildCountryDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Country",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Country",
      showSearchBox: false,
      searchHintText: "Search Country",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildStateDropdown() {
    return AppDropdownSearch<String>(
      title: "Select State",
      isRequired: true,
      value: controller.selectedMStatus.value,
      items: controller.mStatusList,
      hintText: "State",
      showSearchBox: true,
      searchHintText: "",
      onChanged: (val) => controller.selectedMStatus.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildDistrictDropdown() {
    return AppDropdownSearch<String>(
      title: "Select District",
      isRequired: true,
      value: controller.selectedHeight.value,
      items: controller.heightList,
      hintText: "District",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedHeight.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildCityDropdown() {
    return AppDropdownSearch<String>(
      title: "Select City",
      isRequired: true,
      value: controller.selectedCreatedFor.value,
      items: controller.createdForList,
      hintText: "City",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedCreatedFor.value = val,
      validator: AppValidators.required,
    );
  }
}
