import 'package:flutter/cupertino.dart';
import 'package:madhya/core/exporters/app_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(children: [_buildTopImage(), _buildCompletionCard(),
          _buildMenu()]),
      ),
    );
  }

  AppBar _buildAppBar(theme) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      centerTitle: false,
      title: Image.asset(AppAssets.appLogoHorizontal, width: 0.4.sw),
    );
  }

  Widget _buildTopImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.grey200,
            child: ClipOval(
              child: Icon(CupertinoIcons.profile_circled, size: 100.r),
            ),
          ),
        ),
        const SizedBox(height: 12),
        AppText(
          text: 'Pooja Kulkarni',
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        AppText(
          text: 'MDYST0250M',
          fontSize: 14.sp,
          color: AppColors.lightTextLowColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _buildCompletionCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBorderPink),
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Column(
            spacing: 4.h,
            children: [
              AppText(
                text: "Complete Your Profile",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.lightPrimary,
              ),
              AppText(
                text:
                    "Add more details to increase your chances\nof finding the perfect match.",
                fontSize: 12.sp,
                maxLines: 3,
                textAlign: TextAlign.center,
                color: AppColors.lightTextMidColor,
              ),
            ],
          ),
          Row(
            spacing: 12.w,
            children: [
              AppText(
                text: '65%',
                fontSize: 12.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.lightTextMidColor,
              ),
              Expanded(
                child: TweenAnimationBuilder<double>(
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
              ),
              AppText(
                text: 'Profile Completed',
                fontSize: 12.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.lightTextMidColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
