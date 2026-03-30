import 'package:madhya/core/exporters/app_export.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final controller = getIt<ProfileController>();
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
            _buildProfileImage(),
            _buildBasicDetails(),
            _buildAboutMe(),
            _buildProfessionalDetails(),
            _buildReligionDetails(),
            _buildLocationDetails(),
            _buildFamilyDetails(),
            _buildHoroscopeDetails(),
            _buildPhotosDetails(),
          ],
        ),
      ),
    );
  }

  CustomAppbar _buildAppBar(theme) {
    return CustomAppbar(
      title: 'Edit Profile',
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
    );

    // AppBar(
    //   surfaceTintColor: Colors.white,
    //   foregroundColor: Colors.black,
    //   backgroundColor: theme.brightness == Brightness.light
    //       ? AppColors.bgColor
    //       : theme.scaffoldBackgroundColor,
    //   centerTitle: false,
    //   titleSpacing: 0,
    //   title: AppText(
    //     text: 'Edit Profile',
    //     fontSize: 22.sp,
    //     color: AppColors.lightTextMidColor,
    //     fontWeight: FontWeight.bold,
    //   ),
    // );
  }

  Widget _buildProfileImage() {
    final image =
        'https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/19805/SM964729.jpg?date=Mon%20Mar%2023%202026%2017:48:41%20GMT+0530%20(India%20Standard%20Time)';
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(() {
            final imageFile = controller.profileImage.value;

            final ImageProvider<Object> imageProvider = imageFile != null
                ? FileImage(imageFile)
                : NetworkImage(image);

            return CircleAvatar(
              radius: 51.r,
              backgroundColor: Colors.grey.shade200,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.grey100,
                child: ClipOval(
                  child: FadeInImage(
                    placeholder: const AssetImage(AppAssets.appLogo),
                    image: imageProvider,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    fadeInDuration: const Duration(milliseconds: 300),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.appLogo,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                  ),
                ),
              ),
            );
          }),
          Positioned(
            bottom: 8,
            right: -5,
            child: GestureDetector(
              onTap: () {
                AppFilePicker.open(
                  onPicked: (file) {
                    controller.profileImage.value = file;
                  },
                );
              },
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  size: 16.sp,
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ),
        ],
      ),

      // CircleAvatar(
      //   radius: 45.r,
      //   backgroundColor: AppColors.grey200,
      //   child: Icon(CupertinoIcons.person_fill, size: 40.r),
      // ),
    );
  }

  Widget _buildBasicDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Name', value: 'Rohan', isFill: false),
              buildDetailItem(label: 'Gender', value: 'Male', isFill: false),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Age', value: '29', isFill: false),
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
                label: 'Height',
                value: '5ft 10in - 177 cms',
                isFill: false,
              ),
              buildDetailItem(
                label: 'Profile Created For',
                value: '-',
                isFill: false,
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Mobile Number',
                value: '+91 777 XXX XX03',
                isFill: false,
              ),
            ],
          ),
        ],
      ),
      'Basic Details',
      HugeIcons.strokeRoundedUserAccount,
      () => Get.toNamed(Routes.basicDetailsEdit),
    );
  }

  Widget _buildAboutMe() {
    return buildSection(
      Container(
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.symmetric(vertical: 8.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey300, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: AppText(
          maxLines: 20,
          text:
              "Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          fontSize: 14.sp,
          color: AppColors.lightTextMidColor,
        ),
      ),
      'About Me',
      HugeIcons.strokeRoundedProfile,
      () => Get.toNamed(Routes.aboutMeEdit),
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
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Annual Income',
                value: '-',
                isFill: false,
              ),
            ],
          ),
        ],
      ),
      'Professional Info',
      HugeIcons.strokeRoundedProfile02,
      () => Get.toNamed(Routes.professionalDetailsEdit),
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
      () => Get.toNamed(Routes.religionDetailsEdit),
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
      () => Get.toNamed(Routes.locationDetailsEdit),
    );
  }

  Widget _buildFamilyDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: "Father's Name",
                value: '-',
                isFill: false,
              ),
              buildDetailItem(label: "Father's Job", value: '-', isFill: false),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: "Mother's Name",
                value: '-',
                isFill: false,
              ),
              buildDetailItem(label: "Mother's Job", value: '-', isFill: false),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(
                label: 'Siblings Details',
                value: '-',
                isFill: false,
              ),
            ],
          ),
        ],
      ),
      'Family Details',
      HugeIcons.strokeRoundedUserMultiple02,
      () => Get.toNamed(Routes.familyDetailsEdit),
    );
  }

  Widget _buildHoroscopeDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Birth Time', value: '-', isFill: false),
              buildDetailItem(label: 'Birth Date', value: '-', isFill: false),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Star/rasi', value: '-', isFill: false),
            ],
          ),
        ],
      ),
      'Horoscope Details',
      HugeIcons.strokeRoundedStar,
      () => Get.toNamed(Routes.horoscopeDetailsEdit),
    );
  }

  Widget _buildPhotosDetails() {
    return buildSection(
      showEdit: false,
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AttachmentPreviewList(
          attachments: [
            'https://images.pexels.com/photos/1456669/pexels-photo-1456669.jpeg',
            'https://images.pexels.com/photos/5043313/pexels-photo-5043313.jpeg',
          ],
          isDownload: false,
          onDownload: (v) {},
        ),
      ),
      'Images',
      HugeIcons.strokeRoundedAlbum02,
      () {},
    );
  }
}
