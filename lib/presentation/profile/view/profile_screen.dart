import 'package:flutter/cupertino.dart';
import 'package:madhya/core/exporters/app_export.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            _buildProfileHeader(),
            _buildCompletionCard(),
            _buildSectionCard(controller.menuList),
            _buildSectionCard(controller.otherMenu),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(theme) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      centerTitle: false,
      title: Image.asset(AppAssets.appLogoHorizontal, height: 28.h),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundColor: AppColors.grey200,
            child: Icon(CupertinoIcons.person_fill, size: 40.r),
          ),
          SizedBox(height: 10.h),
          AppText(
            text: 'Pooja Kulkarni',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 4.h),
          AppText(
            text: 'MDYST0250M',
            fontSize: 12.sp,
            color: AppColors.lightTextLowColor,
          ),
        ],
      ),
    );
  }

  Widget _buildCompletionCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightPrimary.withValues(alpha: 0.1),
            Colors.white24,
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Column(
            spacing: 6.h,
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
            spacing: 10.w,
            children: [
              AppText(
                text: '65%',
                fontSize: 12.sp,
                color: AppColors.lightTextMidColor,
              ),
              Expanded(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 0.65),
                  duration: const Duration(milliseconds: 800),
                  builder: (_, value, __) {
                    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10.r),
                      value: value,
                      minHeight: 6.h,
                      backgroundColor: Colors.grey.shade200,
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
                color: AppColors.lightTextMidColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(dynamic menu) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: menu['onTap'],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.lightPrimary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: HugeIcon(
                icon: menu['icon'],
                color: AppColors.lightPrimary,
                size: 20.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppText(
                text: menu['title'] ?? '',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 20.r,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(List<dynamic> list) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(list.length, (index) {
          final menu = list[index];
          return Column(
            children: [
              _menuItem(menu),
              if (index != list.length - 1)
                Divider(
                  height: 0,
                  thickness: 0.6,
                  indent: 50.w,
                  endIndent: 12.w,
                  color: Colors.grey.shade300,
                ),
            ],
          );
        }),
      ),
    );
  }
}
