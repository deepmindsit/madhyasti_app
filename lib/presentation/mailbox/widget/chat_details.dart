import 'package:madhya/core/exporters/app_export.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final controller = getIt<ChatController>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(children: [_buildAllChat(), _buildTextField(theme)]),
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
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: AppText(
        text: 'Pooja Kulkarni',
        fontSize: 20.sp,
        color: AppColors.lightTextMidColor,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        AppIconButton(
          onPressed: () => Get.toNamed(Routes.chatProfileDetails),
          icon: HugeIcons.strokeRoundedUser,
          iconColor: Colors.grey,
          backgroundColor: AppColors.grey200,
        ),
      ],
    );
  }

  Widget _buildAllChat() {
    return Expanded(
      child: RefreshIndicator(
        backgroundColor: Colors.black,
        strokeWidth: 1,
        color: AppColors.lightPrimary,
        onRefresh: () async {
          // await controller.getSingleChat(widget.chatId, isRefresh: true);
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            // 🔥 reverse list → load more when reaching TOP
            // if (scrollInfo.metrics.pixels ==
            //     scrollInfo.metrics.maxScrollExtent &&
            //     controller.hasSingleMore &&
            //     !controller.isSingleLoadMore.value) {
            //   controller.getSingleChat(widget.chatId, showLoading: false);
            // }
            return false;
          },
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(12),
            itemCount: controller.allMessages.length,
            itemBuilder: (context, index) {
              final message = controller.allMessages[index];
              final isMe = message['self'] == true;

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.75),
                  child: IntrinsicWidth(
                    child: Card(
                      elevation: isMe ? 0 : 1,
                      color: isMe
                          ? AppColors.grey100
                          : Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Get.theme.cardColor,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: AppText(
                                text: message['message']?.toString() ?? '',
                                fontSize: 13.sp,
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            AppText(
                              text: TimestampFormatter().format(
                                message['created_at']?.toString() ?? '',
                              ),
                              fontSize: 10.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.grey300, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              showLabel: false,
              controller: controller.msgController,
              label: 'label',
              contentPadding: const EdgeInsets.all(15),
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              enabledBorder: theme.inputDecorationTheme.enabledBorder,
              textStyle: TextStyle(color: theme.colorScheme.onSurface),
              fillColor: Colors.white,
              hint: 'Message',
            ),
          ),
          SizedBox(width: 12.w),
          AppIconButton(
            icon: HugeIcons.strokeRoundedAttachment01,
            backgroundColor: AppColors.grey200,
            iconColor: AppColors.lightPrimary,
          ),
          AppIconButton(
            icon: HugeIcons.strokeRoundedSent,
            backgroundColor: AppColors.grey200,
            iconColor: AppColors.lightPrimary,
          ),
        ],
      ),
    );
  }
}
