import 'package:madhya/core/exporters/app_export.dart';

class Interest extends StatelessWidget {
  Interest({super.key});
  final controller = getIt<InterestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(children: [CustomToggle(), _buildInterestList()]),
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
        text: 'Interests',
        fontSize: 22.sp,
        color: AppColors.lightTextMidColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInterestList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(12.r),
        itemCount: controller.interestList.length,
        itemBuilder: (context, index) {
          final interest = controller.interestList[index];
          return InterestCard(interest: interest);
        },
      ),
    );
  }
}
