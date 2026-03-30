import 'package:madhya/core/exporters/app_export.dart';

class AboutMeEdit extends StatelessWidget {
  const AboutMeEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final about =
        "Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.";
    return Scaffold(
      appBar: CustomAppbar(title: 'About Me Edit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 16.h,
          children: [
            AppTextField(
              filled: true,
              label: 'About me',
              initialValue: about,
              showLabel: false,
              maxLines: 500,
              minLines: 1,
              hint: 'About me',
              contentPadding: const EdgeInsets.all(8),
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              enabledBorder: theme.inputDecorationTheme.enabledBorder,

              textStyle: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 14.sp,
              ),
              validator: AppValidators.required,
              labelStyle: theme.textTheme.labelMedium,
              controller: TextEditingController(),
              fillColor: theme.cardColor,
              keyboardType: TextInputType.multiline,
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
}
