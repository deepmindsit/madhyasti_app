import 'package:madhya/core/exporters/app_export.dart';

class BasicDetailsEdit extends StatelessWidget {
  BasicDetailsEdit({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: 'Basic Details Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            Row(
              spacing: 16.w,
              children: [
                buildDetailItem(label: 'Name', value: 'Rohan'),
                buildDetailItem(label: 'Gender', value: 'Male'),
              ],
            ),
            _buildNumberField(theme),
            _buildWhatsAppField(theme),
            _buildAlternateNumberField(theme),
            Row(
              spacing: 16.w,
              children: [
                Expanded(child: _buildAgeDropdown()),
                Expanded(child: _buildStatusDropdown()),
              ],
            ),
            Row(
              spacing: 16.w,
              children: [
                Expanded(child: _buildHeightDropdown()),
                Expanded(child: _buildCreatedForDropdown()),
              ],
            ),
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

  Widget _buildNumberField(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: 'Enter Number',
      showLabel: true,
      hint: 'Enter Number',
      enabled: false,
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      textStyle: TextStyle(color: theme.colorScheme.onSurface),
      validator: AppValidators.phone,
      labelStyle: theme.textTheme.labelMedium,
      controller: TextEditingController(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.w,
          children: [
            Image.asset(AppAssets.flag, width: 25.0, height: 25.0),
            AppText(text: '+91', fontSize: 14.sp),
          ],
        ),
      ),
      fillColor: theme.cardColor,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  Widget _buildWhatsAppField(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: 'WhatsApp Number',
      showLabel: true,
      hint: 'WhatsApp Number',
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      textStyle: TextStyle(color: theme.colorScheme.onSurface),
      validator: AppValidators.phone,
      labelStyle: theme.textTheme.labelMedium,
      controller: TextEditingController(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.w,
          children: [
            Image.asset(AppAssets.flag, width: 25.0, height: 25.0),
            AppText(text: '+91', fontSize: 14.sp),
          ],
        ),
      ),
      fillColor: theme.cardColor,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  Widget _buildAlternateNumberField(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: 'Alternative number (optional)',
      showLabel: true,
      hint: 'Mobile Number',
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      textStyle: TextStyle(color: theme.colorScheme.onSurface),
      validator: AppValidators.phone,
      labelStyle: theme.textTheme.labelMedium,
      controller: TextEditingController(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.w,
          children: [
            Image.asset(AppAssets.flag, width: 25.0, height: 25.0),
            AppText(text: '+91', fontSize: 14.sp),
          ],
        ),
      ),
      fillColor: theme.cardColor,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  Widget _buildAgeDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Your Age",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Choose Age",
      showSearchBox: false,
      searchHintText: "Search Age",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildStatusDropdown() {
    return AppDropdownSearch<String>(
      title: "Marital Status",
      isRequired: true,
      value: controller.selectedMStatus.value,
      items: controller.mStatusList,
      hintText: "Marital Status",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedMStatus.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildHeightDropdown() {
    return AppDropdownSearch<String>(
      title: "Height",
      isRequired: true,
      value: controller.selectedHeight.value,
      items: controller.heightList,
      hintText: "Height",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedHeight.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildCreatedForDropdown() {
    return AppDropdownSearch<String>(
      title: "Profile Created For",
      isRequired: true,
      value: controller.selectedCreatedFor.value,
      items: controller.createdForList,
      hintText: "Select",
      showSearchBox: false,
      searchHintText: "",
      onChanged: (val) => controller.selectedCreatedFor.value = val,
      validator: AppValidators.required,
    );
  }
}
