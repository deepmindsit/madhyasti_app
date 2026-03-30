import 'package:madhya/core/exporters/app_export.dart';

class FamilyDetailsEdit extends StatelessWidget {
  const FamilyDetailsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: 'Family Details Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            _buildFatherName(theme),
            _buildFatherJob(theme),
            _buildMotherName(theme),
            _buildMotherJob(theme),
            _buildSiblingsDetails(theme),
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

  Widget _buildFatherName(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Father's Name",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "Father's Name",
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

  Widget _buildFatherJob(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Father's Job",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "Father's Job",
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

  Widget _buildMotherName(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Mother's Name",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "Mother's Name",
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

  Widget _buildMotherJob(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Mother's Job",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "Mother's Job",
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

  Widget _buildSiblingsDetails(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Siblings Details",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "Siblings Details",
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
}
