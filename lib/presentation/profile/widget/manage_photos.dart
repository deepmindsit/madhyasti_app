import 'package:madhya/core/exporters/app_export.dart';

class ManagePhotos extends StatefulWidget {
  const ManagePhotos({super.key});

  @override
  State<ManagePhotos> createState() => _ManagePhotosState();
}

class _ManagePhotosState extends State<ManagePhotos> {
  final controller = getIt<ManagePhotosController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Scaffold(
      appBar: CustomAppbar(title: 'Manage Photos'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildToggle(),
            Obx(() {
              if (controller.selectedType.value == 0) {
                return _myPhoto(theme, isLight);
              } else {
                return _verifiedProfile(theme, isLight);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildToggle() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(6.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            toggleItem(
              title: 'My Photos',
              isSelected: controller.selectedType.value == 0,
              onTap: () => controller.selectedType.value = 0,
            ),
            SizedBox(width: 8.w),
            toggleItem(
              title: 'Verified Profile',
              isSelected: controller.selectedType.value == 1,
              onTap: () => controller.selectedType.value = 1,
            ),
          ],
        ),
      ),
    );
  }

  ////////////////////////////////MY Photos/////////////////////////////

  Widget _myPhoto(ThemeData theme, bool isLight) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12.h,
        children: [
          AppText(
            text:
                'Photo will be visible to other users only after the admins approval.',
            fontSize: 12.sp,
            maxLines: 2,
            color: AppColors.lightTextMidColor,
          ),
          _buildProfileImage(theme, isLight),
          _buildAdditionalImages(theme),
          AppButton(
            text: 'Submit',
            onTap: () {},
            backgroundColor: AppColors.lightPrimary,
          ),
          _hidePhoto(),
        ],
      ),
    );
  }

  Widget _buildProfileImage(ThemeData theme, bool isLight) {
    return Obx(
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
              border: Border.all(width: 0.5, color: AppColors.grey400),
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
    );
  }

  Widget _buildAdditionalImages(ThemeData theme) {
    return Obx(() {
      final images = controller.profileImages;
      final int minSlots = 3;

      final int totalItems = images.length < minSlots
          ? minSlots
          : images.length + 1;

      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: totalItems,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          // ✅ Show Image if exists
          if (index < images.length) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      controller.profileImages.removeAt(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // ✅ Show Add Button (for remaining slots)
          return GestureDetector(
            onTap: () {
              AppFilePicker.open(
                config: const AppFilePickerConfig(
                  allowMultiImage: true,
                  allowVideo: false,
                ),
                onMultiPicked: (files) {
                  if (files.isNotEmpty) {
                    controller.profileImages.addAll(files);
                  }
                },
                onPicked: (file) {
                  if (file.path.isNotEmpty) {
                    controller.profileImages.add(file);
                  }
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 0.5,
                  color: AppColors.lightPrimary.withValues(alpha: 0.3),
                ),
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedImageAdd01,
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _hidePhoto() {
    return ListTile(
      tileColor: Color(0xffFFF3E6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: AppColors.lightSecondary, width: 0.5.w),
      ),

      title: AppText(
        text: 'Hide photos',
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextMidColor,
      ),
      subtitle: AppText(
        text: 'Hide your photos from other users',
        fontSize: 12.sp,
        color: AppColors.lightTextLowColor,
      ),
      trailing: Switch(
        activeTrackColor: Colors.grey,
        trackOutlineColor: WidgetStatePropertyAll(Colors.grey),
        inactiveThumbColor: Colors.grey,
        activeThumbColor: AppColors.lightSecondary,
        trackColor: WidgetStatePropertyAll(AppColors.grey100),
        value: true,
        onChanged: (v) {},
      ),
    );
  }

  ////////////////////////////////VERIFIED PROFILE/////////////////////////////

  Widget _verifiedProfile(ThemeData theme, bool isLight) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12.h,
        children: [
          AppText(
            text:
                'Upload a valid ID (Aadhaar Card, Passport, or Driving License). After verification, your profile will receive a Verified Badge. ✔️',
            fontSize: 12.sp,
            maxLines: 5,
            color: AppColors.lightTextMidColor,
          ),
          _buildUploadDocuments(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: 'Supported formats: PDF', fontSize: 12.sp),
              AppText(text: 'Maximum size: 2MB', fontSize: 12.sp),
            ],
          ),
          AppButton(
            text: 'Submit',
            onTap: () {},
            backgroundColor: AppColors.lightPrimary,
          ),
          _documentList(),
        ],
      ),
    );
  }

  Widget _buildUploadDocuments() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffF4F4F4),
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
            dashPattern: [5, 1],
            color: AppColors.lightTextMidColor,
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
                HugeIcon(
                  icon: HugeIcons.strokeRoundedCloudUpload,
                  color: AppColors.grey700,
                ),
                Text(
                  'Upload Documents'.tr,
                  style: TextStyle(color: AppColors.grey700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _documentList() {
    return ListTile(
      tileColor: Color(0xffFFF3E6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: AppColors.lightSecondary, width: 0.5.w),
      ),
      leading: HugeIcon(
        icon: HugeIcons.strokeRoundedFile01,
        size: 20.r,
        color: AppColors.lightPrimary,
      ),
      title: AppText(
        text: 'Aadhaar Card.pdf',
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextMidColor,
      ),
      trailing: HugeIcon(
        icon: HugeIcons.strokeRoundedDownload01,
        size: 20.r,
        color: AppColors.lightPrimary,
      ),
    );
  }
}
