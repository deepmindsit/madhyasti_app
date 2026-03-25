import 'package:madhya/core/exporters/app_export.dart';

class MailboxScreen extends StatefulWidget {
  const MailboxScreen({super.key});

  @override
  State<MailboxScreen> createState() => _MailboxScreenState();
}

class _MailboxScreenState extends State<MailboxScreen> {
  final controller = getIt<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          spacing: 12.h,
          children: [_buildSearchField(), _buildChatList()],
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
        text: 'Mailbox',
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        AppIconButton(
          onPressed: () => Get.back(),
          icon: HugeIcons.strokeRoundedUserLove02,
          iconColor: Colors.grey,
          backgroundColor: AppColors.grey200,
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return AppTextField(
      label: 'Search',
      showLabel: false,
      hint: 'Search',
      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
      fillColor: AppColors.grey100,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 6.w),
        child: Icon(Icons.search, color: Colors.grey, size: 20.sp),
      ),
    );
  }

  Widget _buildChatList() {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) =>
            Divider(height: 20.h, thickness: 0.6, color: AppColors.grey200),
        itemCount: controller.chatList.length,
        itemBuilder: (_, index) {
          final chat = controller.chatList[index];
          return _buildChatCard(chat);
        },
      ),
    );
  }

  Widget _buildChatCard(dynamic chat) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () => Get.toNamed(Routes.chatDetails),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            _buildAvatar(chat),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text: chat['name'] ?? '',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        TimestampFormatter().format(chat['time'] ?? ''),
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: chat['msg'] ?? '',
                    fontSize: 12.sp,
                    color: Colors.grey.shade700,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(dynamic chat) {
    return CircleAvatar(
      backgroundColor: AppColors.grey300,
      radius: 25.r,
      child: CircleAvatar(
        radius: 24.r,
        child: ClipOval(
          child: CachedNetworkImage(
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            imageUrl: chat['image'] ?? '',
            placeholder: (_, __) => Image.asset(AppAssets.appLogo),
            errorWidget: (_, __, ___) => Image.asset(AppAssets.appLogo),
          ),
        ),
      ),
    );
  }
}
