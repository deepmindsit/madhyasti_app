import 'package:madhya/core/exporters/app_export.dart';

class ProfileAdd extends StatefulWidget {
  const ProfileAdd({super.key});

  @override
  State<ProfileAdd> createState() => _ProfileAddState();
}

class _ProfileAddState extends State<ProfileAdd> {
  final controller = getIt<AuthController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          spacing: 12.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.08),
            buildTitle("Add a profile image"),
            buildSubTitle("Increase partner matches by adding photos", theme),
            Obx(
              () => GestureDetector(
                onTap: () {
                  AppFilePicker.open(
                    onPicked: (v) {
                      controller.profileImage.value = v;
                    },
                  );
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        image: AssetImage(
                          isLight ? AppAssets.bgImage : AppAssets.bgImageDark,
                        ),
                      ),
                    ),
                    child: controller.profileImage.value != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              controller.profileImage.value!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedImageAdd01,
                              color: AppColors.lightPrimary,
                              size: 30.r,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Row(
              spacing: 12.w,
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedLockPassword),
                Expanded(
                  child: buildSubTitle(
                    "We'll only show this image to people you connect with on Madhyasthi",
                    theme,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
          text: 'Continue',
          onTap: () {},
          backgroundColor: AppColors.lightPrimary,
        ),
      ),
    );
  }
}
