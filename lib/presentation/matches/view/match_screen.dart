import 'package:madhya/core/exporters/app_export.dart';
import 'package:madhya/presentation/matches/controller/match_controller.dart';

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
          children: [
            SizedBox(
              height: Get.height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.category.length,
                itemBuilder: (context, index) {
                  return categoryTile(
                    index: index,
                    catId: '',
                    name: controller.category[index],
                    image: '',
                  );
                },
              ),
            ),
            _buildTopMatch(),
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
      centerTitle: false,
      title: AppText(
        text: 'Matches',
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
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
              icon: HugeIcons.strokeRoundedFilter,
              color: Colors.grey,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopMatch() {
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
              onTap: () {},
            );
          },
        ),
      ],
    );
  }

  Widget categoryTile({
    required String image,
    required String name,
    required String catId,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(3),
        width: Get.width * 0.23,
        decoration: BoxDecoration(
          color: AppColors.grey200.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lightCardPink,
            // color: offerController.selected.value == index
            //     ?
            //     : Colors.transparent
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
            image: CachedNetworkImageProvider(image),
          ),
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.lightTextMidColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
