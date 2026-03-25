import 'package:flutter/cupertino.dart';
import 'package:madhya/core/exporters/app_export.dart';

class ChatUserProfile extends StatelessWidget {
  const ChatUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 12,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.grey200,
              child: ClipOval(
                child: Icon(CupertinoIcons.profile_circled, size: 100.r),
              ),
            ),
            AppText(text: 'Pooja Kulkarni', fontSize: 16.sp),
            Divider(),
            Container(
              alignment: Alignment.centerLeft,
              height: Get.height * 0.09,
              child: buildDetailItem(label: 'Phone', value: '+91 12XXX XXX90'),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () =>Get.back(),
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: AppText(
        text: 'Details',
        fontSize: 20.sp,
        color: AppColors.lightTextMidColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
