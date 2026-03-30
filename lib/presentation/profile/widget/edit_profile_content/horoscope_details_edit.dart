import 'package:hugeicons/styles/stroke_rounded.dart';
import 'package:madhya/core/exporters/app_export.dart';

class HoroscopeDetailsEdit extends StatelessWidget {
  HoroscopeDetailsEdit({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: 'Horoscope details Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            Row(
              spacing: 16.w,
              children: [
                Expanded(child: _buildBirthTime(theme)),
                Expanded(child: _buildBirthDate(theme)),
              ],
            ),
            _buildRashiDropdown(),
            _buildUploadDocuments(),
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

  Widget _buildBirthTime(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Birth Time",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "---:--- ---",
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

  Widget _buildBirthDate(ThemeData theme) {
    return AppTextField(
      filled: true,
      label: "Birth Date",
      showLabel: true,
      isRequired: true,
      minLines: 1,
      maxLines: 10,
      hint: "12/03/2001",
      suffixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HugeIcon(
          icon: HugeIconsStrokeRounded.calendar02,
          color: theme.colorScheme.onSurface,
          strokeWidth: 1,
        ),
      ),
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

  Widget _buildRashiDropdown() {
    return AppDropdownSearch<String>(
      title: "Star/rasi",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Star/rasi",
      showSearchBox: false,
      searchHintText: "Search Star/rasi",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildUploadDocuments() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          AppFilePicker.open(
            onPicked: (file) {
              // controller.newAttachments.add(file);
            },
          );
        },
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(12),
            dashPattern: [1, 1],
            color: AppColors.grey400,
            strokeWidth: 0.5,
            padding: EdgeInsets.all(16),
          ),

          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(16),
            child: Column(
              spacing: 8.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedCloudUpload),
                Text('Upload File'.tr),
                AppText(
                  text: 'Click here to and upload Horoscope'.tr,
                  color: AppColors.grey500,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
