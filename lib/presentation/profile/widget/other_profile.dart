import 'package:madhya/core/exporters/app_export.dart';

class OtherProfile extends StatefulWidget {
  const OtherProfile({super.key});

  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  final controller = getIt<OtherProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                /// 🔥 TOP IMAGE SECTION
                _buildTopImageList(),
                SizedBox(height: 50.h),

                /// 🔹 DATA CHIPS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 12.h,
                    children: [
                      _buildDataChips(),
                      _buildDivider(),
                      _buildAboutMe(),
                      _buildBasicDetails(),
                      _buildProfessionalDetails(),
                      _buildReligionDetails(),
                      _buildLocationDetails(),
                      _buildFamilyDetails(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildAppbar(),
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topPadding + 10,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 50.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🔹 LEFT BACK BUTTON
            Positioned(
              left: 16.w,
              child: AppIconButton(
                onPressed: () => Get.back(),
                icon: HugeIcons.strokeRoundedArrowLeft01,
                iconColor: Colors.white,
                backgroundColor: AppColors.grey900.withValues(alpha: 0.2),
              ),
            ),

            /// 🔹 RIGHT MENU BUTTON
            Positioned(
              right: 0.w,
              child: PopupMenuButton<String>(
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                onSelected: (value) {},
                icon: Container(
                  padding: EdgeInsets.all(8.w),
                  margin: EdgeInsets.only(right: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.grey900.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedMoreVerticalSquare01,
                    size: 16.r,
                    color: Colors.white,
                  ),
                ),
                itemBuilder: (context) => [
                  _buildPopupMenu(
                    'Share Profile',
                    HugeIcons.strokeRoundedShare01,
                    'share',
                  ),
                  _buildPopupMenu(
                    'Block/Ignore Profile',
                    HugeIcons.strokeRoundedUnavailable,
                    'block',
                  ),
                  _buildPopupMenu(
                    'Report Profile',
                    HugeIcons.strokeRoundedInformationCircle,
                    'report',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenu(
    String name,
    dynamic icon,
    String value,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.w,
        children: [
          HugeIcon(icon: icon, size: 16.r),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildTopImageList() {
    return SizedBox(
      height: Get.height * 0.55.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.images.length,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
            itemBuilder: (_, index) {
              return MatchCardOverlay(
                isDetails: true,
                details: {
                  'image': controller.images[index],
                  'details': {
                    'name': 'Sneha Patil',
                    'id': 'MDYST0123M',
                    'age': '25',
                    'address': 'Pune, Maharashtra',
                    'isVerified': true,
                  },
                },
              );
            },
          ),
          _buildIndicators(),

          /// 🔥 APP BAR
          // _buildAppbar(),
          _buildBottomMenu(),
        ],
      ),
    );
  }

  /// 🔹 INDICATORS
  Widget _buildIndicators() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ).copyWith(top: MediaQuery.of(context).padding.top + 30),
      child: ValueListenableBuilder<int>(
        valueListenable: controller.currentIndex,
        builder: (_, index, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              final isActive = index == i;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isActive ? 30 : 10,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: isActive ? Colors.white : Colors.grey,
                ),
              );
            }),
          );
        },
      ),
    );
  }

  /// 🔹 APPBAR
  // Widget _buildAppbar() {
  //   return Positioned(
  //     left: 12.w,
  //     right: 0.w,
  //     top: MediaQuery.of(context).padding.top + 10,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         AppIconButton(
  //           onPressed: () => Get.back(),
  //           icon: HugeIcons.strokeRoundedArrowLeft01,
  //           iconColor: Colors.white,
  //           backgroundColor: AppColors.grey50.withValues(alpha: 0.2),
  //         ),
  //         _buildIndicators(),
  //         AppIconButton(
  //           icon: HugeIcons.strokeRoundedMoreVerticalSquare01,
  //           iconColor: Colors.white,
  //           backgroundColor: AppColors.grey50.withValues(alpha: 0.2),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// 🔥 BOTTOM MENU
  Widget _buildBottomMenu() {
    return Positioned(
      bottom: -35,
      left: 16,
      right: 16,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          spacing: 16.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuCard(
              'Send\nInterest',
              HugeIcons.strokeRoundedFavouriteCircle,
              () {
                AppBottomSheet.show(
                  context: context,
                  showCloseButton: false,
                  height: Get.height * 0.6.h,
                  child: Obx(
                    () => InterestOptionsList(
                      items: controller.interestOptions,
                      selectedValue: controller.selectedId.value,
                      onChanged: (val) {
                        controller.selectedId.value = val;
                      },
                    ),
                  ),
                );
              },
            ),
            _buildMenuCard('Shortlist', HugeIcons.strokeRoundedStar, () {
              AppBottomSheet.show(
                context: context,
                showCloseButton: false,
                height: Get.height * 0.4.h,
                child: ShortlistBottomsheet(isUnlocked: true),
              );
            }),
            _buildMenuCard('Contact', HugeIcons.strokeRoundedCall02, () {
              AppBottomSheet.show(
                context: context,
                showCloseButton: false,
                height: Get.height * 0.4.h,
                child: ContactBottomsheet(isUnlocked: true),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 🔹 MENU CARD
  Widget _buildMenuCard(String title, dynamic icon, dynamic onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.1.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          spacing: 6.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: icon, color: AppColors.lightPrimary, size: 24.r),
            SizedBox(
              height: 30.h, // same for all cards
              child: Center(
                child: AppText(
                  text: title,
                  fontSize: 13.sp,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 DATA CHIPS
  Widget _buildDataChips() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: controller.menuList.map<Widget>((i) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.catBgColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🔹 FIXED ICON SIZE
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Center(
                    child: HugeIcon(
                      icon: i['icon'] as List<List<dynamic>>,
                      size: 18.r,
                      color: AppColors.lightTextLowColor,
                    ),
                  ),
                ),

                SizedBox(width: 6.w),

                /// 🔹 TEXT
                AppText(
                  text: i['title']?.toString() ?? '',
                  fontSize: 14.sp,
                  color: AppColors.lightTextMidColor,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// 🔹 DIVIDER
  Widget _buildDivider() {
    return Divider(height: 1, color: AppColors.lightPink);
  }

  /// 🔹 ABOUT ME
  Widget _buildAboutMe() {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon('About Me', HugeIcons.strokeRoundedUser03),

        AppText(
          text:
              'Sneha Patil is a caring and dedicated doctor based in Pune, Maharashtra, with strong family values. She believes in building a relationship based on trust, respect, and understanding.',
          fontSize: 14.sp,
          maxLines: 100,
          textAlign: TextAlign.start,
          color: AppColors.lightTextLowColor,
        ),
        _buildDivider(),
      ],
    );
  }

  /// 🔹 BASIC DETAILS
  Widget _buildBasicDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon('Basic Details', HugeIcons.strokeRoundedProfile),

        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Gender', value: 'Female'),
            buildDetailItem(label: 'Marital Status', value: 'Never Married'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Height', value: '5 ft 0 in – 152 cms'),
            buildDetailItem(label: 'Profile Created For', value: 'Self'),
          ],
        ),
        _buildDivider(),
      ],
    );
  }

  /// 🔹 PROFESSIONAL DETAILS
  Widget _buildProfessionalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon(
          'Professional Info',
          HugeIcons.strokeRoundedAssignments,
        ),

        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Education Category', value: 'Doctor'),
            buildDetailItem(label: 'Education Detail', value: 'MBBS'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Job Category', value: 'Doctor'),
            buildDetailItem(label: 'Job Detail', value: 'Job Detail'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [buildDetailItem(label: 'Annual Income', value: '')],
        ),
        _buildDivider(),
      ],
    );
  }

  /// 🔹 RELIGION DETAILS
  Widget _buildReligionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon('Religion Info', HugeIcons.strokeRoundedWavingHand01),

        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Religion', value: 'Hindu'),
            buildDetailItem(label: 'Caste / Community', value: 'Maratha'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [buildDetailItem(label: 'Sub Caste', value: '')],
        ),
        _buildDivider(),
      ],
    );
  }

  /// 🔹 LOCATION DETAILS
  Widget _buildLocationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon('Location', HugeIcons.strokeRoundedLocation05),

        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'Country', value: 'India'),
            buildDetailItem(label: 'State', value: 'Maharashtra'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: 'District', value: 'Pune'),
            buildDetailItem(label: 'City', value: 'Pune'),
          ],
        ),
        _buildDivider(),
      ],
    );
  }

  /// 🔹 FAMILY DETAILS
  Widget _buildFamilyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headlineWithIcon('Family Details', HugeIcons.strokeRoundedUserGroup02),

        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: "Father's Name", value: 'Sunil Patil'),
            buildDetailItem(label: "Father's Job", value: 'Business Owner'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(label: "Mother's Name", value: 'Meena Patil'),
            buildDetailItem(label: "Mother's Job", value: 'Homemaker'),
          ],
        ),
        Row(
          spacing: 16.w,
          children: [
            buildDetailItem(
              label: "Siblings Details",
              value: '1 Brother – Software Engineer',
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
