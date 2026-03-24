import 'package:madhya/core/exporters/app_export.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  final controller = getIt<MatchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16.h,
          children: [_buildTopCategory(), _buildTopMatchList()],
        ),
      ),
    );
  }

  Widget _buildTopCategory() {
    return SizedBox(
      height: Get.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.category.length,
        itemBuilder: (context, index) {
          return categoryTile(
            index: index,
            name: controller.category[index]['name']?.toString() ?? '',
            icon: controller.category[index]['icon'],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: AppText(
        text: 'Matches',
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        GestureDetector(
          onTap: _matchFilter,
          child: Container(
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.all(8.w).copyWith(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedFilter,
              color: Colors.grey,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _matchFilter() {
    return AppBottomSheet.show(
      context: context,
      showCloseButton: true,
      title: 'Filter',
      height: Get.height * 0.38.h,
      child: Column(
        spacing: 12.h,
        children: [
          AppButton(
            text: 'Not Viewed',
            type: AppButtonType.outline,
            backgroundColor: Colors.white,
            onTap: () {},
            textColor: AppColors.lightTextMidColor,
            borderColor: AppColors.grey200,
          ),
          AppButton(
            text: 'Viewed',
            onTap: () {},
            type: AppButtonType.outline,
            backgroundColor: Colors.white,
            textColor: AppColors.lightTextMidColor,
            borderColor: AppColors.grey200,
          ),
          AppButton(
            text: 'Apply',
            onTap: () {},
            type: AppButtonType.secondary,
            backgroundColor: AppColors.lightPrimary,
            textColor: Colors.white,
            borderColor: AppColors.grey200,
          ),
        ],
      ),
    );
  }

  Widget _buildTopMatchList() {
    return Column(
      spacing: 12.h,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.topMatchList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 4,
            childAspectRatio: 0.58,
          ),
          itemBuilder: (context, index) {
            final match = controller.topMatchList[index];

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
              onTap: () => Get.toNamed(Routes.othersProfile),
            );
          },
        ),
      ],
    );
  }

  Widget categoryTile({
    required String name,
    required int index,
    required dynamic icon,
  }) {
    return GestureDetector(
      onTap: () {
        controller.selectedCategory.value = index.toString();
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: controller.selectedCategory.value == index.toString()
                ? AppColors.lightSecondary
                : AppColors.catBgColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Row(
              spacing: 4.w,
              children: [
                HugeIcon(
                  icon: icon,
                  size: 16.r,
                  color: controller.selectedCategory.value == index.toString()
                      ? Colors.white
                      : AppColors.lightTextLowColor,
                ),
                AppText(
                  text: name,
                  textAlign: TextAlign.center,
                  fontSize: 12.sp,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: controller.selectedCategory.value == index.toString()
                        ? Colors.white
                        : AppColors.lightTextLowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
