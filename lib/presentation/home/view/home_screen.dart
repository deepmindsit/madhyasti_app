import 'package:madhya/core/exporters/app_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12.h,
          children: [
            _buildSlider(),
            _buildCompletionCard(),
            _buildStatsGrid(Theme.of(context)),
            _buildTodayMatch(),
            _buildTopMatch(),
            _buildDiscoverMatch(Theme.of(context)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // titleSpacing: 0,
      centerTitle: false,
      title: Image.asset(AppAssets.appLogoHorizontal, width: 0.4.sw),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.searchScreen),
          child: Container(
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: Colors.grey,
              size: 20.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.all(8.w).copyWith(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification02,
              color: Colors.grey,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider() {
    return AppCarouselSlider(
      margin: const EdgeInsets.only(bottom: 8),
      activeIndicatorColor: AppColors.lightPrimary,
      imageUrls: controller.sliderList,
      height: Get.height * 0.23,
    );
  }

  Widget _buildCompletionCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBorderPink),
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        spacing: 12.w,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Complete Your Profile",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightPrimary,
                ),
                SizedBox(height: 6.h),

                AppText(
                  text: "Add more details to find better matches.",
                  fontSize: 12.sp,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  color: AppColors.lightTextLowColor,
                ),
                SizedBox(height: 10.h),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 0.65),
                  duration: const Duration(milliseconds: 600),
                  builder: (_, value, __) {
                    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10.r),
                      value: value,
                      minHeight: 8.h,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.lightSecondary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: AppText(
                    text: 'Complete',
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                AppText(
                  text: '65% Profile Completed',
                  fontSize: 12.sp,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  color: AppColors.lightTextLowColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(ThemeData theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.statsData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        final item = controller.statsData[index];

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12.w,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: HugeIcon(
                      icon: item["icon"] as List<List<dynamic>>,
                      color: theme.primaryColor,
                      size: 20.r,
                    ),
                  ),
                  AppText(
                    text: item["value"]?.toString() ?? '',
                    fontSize: 12.sp,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.lightTextLowColor,
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AppText(
                      text: item["title"]?.toString() ?? '',
                      fontSize: 16.sp,
                      maxLines: 2,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.lightTextMidColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowUpRight03,
                      color: AppColors.lightTextLowColor,
                      size: 20.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTodayMatch() {
    return Column(
      spacing: 12.h,
      children: [
        buildHeadingWithButton(
          title: "Today's Matches",
          rightText: 'View All',
          onTap: () {},
        ),
        AppCustomSlider(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          activeIndicatorColor: AppColors.lightPrimary,
          imageUrls: controller.todayMatchList,
          height: Get.height * 0.4.h,
        ),
      ],
    );
  }

  Widget _buildTopMatch() {
    return Column(
      spacing: 12.h,
      children: [
        buildHeadingWithButton(
          title: "Top Matches",
          rightText: 'View All',
          onTap: () {},
        ),
        SizedBox(
          height: Get.height * 0.35.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.topMatchList.length,
            itemBuilder: (_, index) {
              final match = controller.topMatchList[index]['details'] ?? {};
              return CompactCard(
                details: {
                  'name': match['name'] ?? '',
                  'id': match['id'] ?? '',
                  'age': match['age'] ?? '',
                  'address': match['address'] ?? '',
                  'image': match['image']?.toString() ?? '',
                  'isVerified': match['isVerified'] ?? false,
                  'isPremium': match['isPremium'] ?? false,
                },
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDiscoverMatch(ThemeData theme) {
    return Column(
      spacing: 12.h,
      children: [
        buildHeadingWithButton(
          title: "Discover Matches",
          rightText: 'View All',
          onTap: () {},
          showRight: false,
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.discStatData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            final item = controller.discStatData[index];

            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.lightCardPink,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 12.w,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: HugeIcon(
                          icon: item["icon"] as List<List<dynamic>>,
                          color: theme.primaryColor,
                          size: 20.r,
                        ),
                      ),
                      AppText(
                        text: item["value"]?.toString() ?? '',
                        fontSize: 12.sp,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.lightTextMidColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AppText(
                          text: item["title"]?.toString() ?? '',
                          fontSize: 14.sp,
                          maxLines: 2,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.lightTextLowColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowUpRight03,
                          color: AppColors.lightTextLowColor,
                          size: 20.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
