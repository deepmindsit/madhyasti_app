import 'package:madhya/core/exporters/app_export.dart';

class ProfessionalDetailsEdit extends StatelessWidget {
  ProfessionalDetailsEdit({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: 'Professional Info Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            _buildEduCategoryDropdown(),
            _buildEducationDetail(theme),
            _buildJobCatDropdown(),
            _buildJobDetail(theme),
            _buildAnnualIncomeDropdown(),

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

  Widget _buildEduCategoryDropdown() {
    return AppDropdownSearch<String>(
      title: "Education Category",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Choose category",
      showSearchBox: false,
      searchHintText: "Search category",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildEducationDetail(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: 'Education Detail',
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: 'Education Detail',
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      textStyle: TextStyle(color: theme.colorScheme.onSurface),
      validator: AppValidators.required,
      labelStyle: theme.textTheme.labelMedium,
      controller: TextEditingController(),
      fillColor: theme.cardColor,
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildJobCatDropdown() {
    return AppDropdownSearch<String>(
      title: "Job Category",
      isRequired: true,
      value: controller.selectedMStatus.value,
      items: controller.mStatusList,
      hintText: "Job Category",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedMStatus.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildJobDetail(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: 'Job Detail',
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: 'Job Detail',
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      textStyle: TextStyle(color: theme.colorScheme.onSurface),
      validator: AppValidators.required,
      labelStyle: theme.textTheme.labelMedium,
      controller: TextEditingController(),
      fillColor: theme.cardColor,
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildAnnualIncomeDropdown() {
    return AppDropdownSearch<String>(
      title: "Annual Income",
      isRequired: true,
      value: controller.selectedHeight.value,
      items: controller.heightList,
      hintText: "Annual Income",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedHeight.value = val,
      validator: AppValidators.required,
    );
  }
}
