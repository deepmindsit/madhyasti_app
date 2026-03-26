import '../../../core/exporters/app_export.dart';

class InterestCard extends StatelessWidget {
  final dynamic interest;
  const InterestCard({super.key, required this.interest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      width: 0.9.sw,
      height: Get.height * 0.19.h,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.catBgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black12,
          width: 0.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.08),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_buildImage(), _buildContent(context)],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
      child: SizedBox(
        width: 120.w,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FadeInImage(
              placeholder: AssetImage(AppAssets.appLogo),
              image: NetworkImage(
                'https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/18763/SM859820.jpg?date=Mon%20Mar%2023%202026%2017:46:49%20GMT+0530%20(India%20Standard%20Time)',
              ),
              imageErrorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                child: Image.asset(AppAssets.appLogo),
              ),
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Get message content
    final message = interest['msg'] ?? '';
    final hasMessage = message.isNotEmpty;

    // Check if there are any badges to show
    final hasVerified = interest['isVerified'] == true;
    final hasPremium = interest['isPremium'] == true;
    final hasBadges = hasVerified || hasPremium;

    // Determine button type
    final buttonType = _getButtonType();
    final isSingleButton =
        buttonType == ButtonType.chatNow ||
        buttonType == ButtonType.deleteRequest ||
        buttonType == ButtonType.undo;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Badges section - only show if badges exist
            if (hasBadges) ...[_buildBadges(), SizedBox(height: 2.h)],
            if (!hasBadges) SizedBox(height: 12.h),
            // Name row
            AppText(
              text: interest['name'] ?? '',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),

            // ID with icon
            AppText(
              text: interest['id'] ?? '',
              fontSize: 11.sp,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),

            SizedBox(height: 4.h),

            // Message section - flexible spacing based on content
            if (hasMessage) ...[
              Flexible(
                child: AppText(
                  text: message,
                  maxLines: 3,
                  fontSize: 11.sp,
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 1,
                    fontSize: 11.sp,
                    color: colorScheme.onSurface.withValues(alpha: 0.75),
                  ),
                ),
              ),
              // Dynamic spacing - less space if no badges
              SizedBox(height: hasBadges ? 2.h : 4.h),
            ] else ...[
              // Add some spacing when no message
              SizedBox(height: 8.h),
            ],

            // Buttons section with proper spacing
            if (isSingleButton) SizedBox(height: 12.h),
            if (isSingleButton)
              _buildSingleButton(buttonType)
            else
              Column(
                children: [
                  if (!isSingleButton) SizedBox(height: 4.h),
                  _buildActionButtons(),
                ],
              ),
            // Add a small bottom padding for better spacing
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBadges() {
    return Row(
      spacing: 6.w,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (interest['isVerified'] == true)
          badge(
            "Verified",
            AppColors.lightPrimary,
            HugeIcons.strokeRoundedCheckmarkBadge01,
          ),
        if (interest['isPremium'] == true)
          badge(
            "Premium",
            AppColors.lightSecondary,
            HugeIcons.strokeRoundedCrown02,
          ),
      ],
    );
  }

  ButtonType _getButtonType() {
    final status = interest['status'];

    if (status == '1') return ButtonType.chatNow;
    if (status == '2') return ButtonType.deleteRequest;
    if (status == '3') return ButtonType.undo;
    return ButtonType.pending; // Default for status null or other values
  }

  Widget _buildSingleButton(ButtonType type) {
    String text;
    Color backgroundColor;
    Color textColor;
    Color? borderColor;
    bool isPrimary = false;

    switch (type) {
      case ButtonType.chatNow:
        text = 'Chat Now';
        backgroundColor = Colors.green;
        textColor = Colors.white;
        borderColor = Colors.green.withValues(alpha: 0.3);
        isPrimary = true;
        break;
      case ButtonType.deleteRequest:
        text = 'Delete Request';
        backgroundColor = Colors.white;
        textColor = AppColors.lightTextLowColor;
        borderColor = AppColors.lightTextLowColor.withValues(alpha: 0.3);
        break;
      case ButtonType.undo:
        text = 'Undo';
        backgroundColor = Colors.white;
        textColor = AppColors.lightTextLowColor;
        borderColor = AppColors.lightTextLowColor.withValues(alpha: 0.3);
        break;
      default:
        text = 'Action';
        backgroundColor = Colors.grey;
        textColor = Colors.white;
    }

    return SizedBox(
      width: double.infinity,
      child: _button(
        text: text,
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderColor: borderColor,
        isPrimary: isPrimary,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: _button(
            text: 'Decline',
            backgroundColor: Colors.white24,
            textColor: AppColors.lightTextLowColor,
            borderColor: AppColors.lightTextLowColor.withValues(alpha: 0.3),
          ),
        ),
        Expanded(
          child: _button(
            text: 'Accept',
            backgroundColor: AppColors.lightPrimary,
            textColor: Colors.white,
            isPrimary: true,
          ),
        ),
      ],
    );
  }

  Widget _button({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.w)
              : null,
        ),
        child: AppText(
          text: text,
          color: textColor,
          fontSize: 13.sp,
          fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}

enum ButtonType { chatNow, deleteRequest, undo, pending }
