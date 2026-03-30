import 'package:madhya/core/exporters/app_export.dart';

class Viewed extends StatelessWidget {
  Viewed({super.key});

  final controller = getIt<ViewedController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(children: [_buildToggle(), _buildShortList()]),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      centerTitle: false,
      titleSpacing: 0,
      title: AppText(
        text: 'Viewed',
        fontSize: 22.sp,
        color: AppColors.lightTextMidColor,
        fontWeight: FontWeight.bold,
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
              title: 'Who viewed me',
              isSelected: controller.selectedType.value == 0,
              onTap: () => controller.selectedType.value = 0,
            ),
            SizedBox(width: 8.w),
            toggleItem(
              title: 'Viewed by me',
              isSelected: controller.selectedType.value == 1,
              onTap: () => controller.selectedType.value = 1,
            ),
          ],
        ),
      ),
    );
  }



  // ---------------- GRID ----------------

  Widget _buildShortList() {
    return Obx(() {
      final list = controller.viewedListData;
      if (list.isEmpty) {
        return _emptyState();
      }

      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 6.w,
            childAspectRatio: 0.59.h,
          ),
          itemBuilder: (context, index) {
            final match = list[index];

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
      );
    });
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 50.r, color: Colors.grey),
          SizedBox(height: 10.h),
          AppText(
            text: 'No profiles yet',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 4.h),
          AppText(
            text: 'Start exploring and shortlist profiles',
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
