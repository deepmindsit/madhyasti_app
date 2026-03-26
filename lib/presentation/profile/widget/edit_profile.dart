import 'package:flutter/cupertino.dart';
import 'package:madhya/core/exporters/app_export.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
          children: [
            _buildProfileImage(),
            SizedBox(height: 12.h),
            _buildBasicDetails(),
            _buildAboutMe()
          ],
        ),
      ),
    );
  }





  AppBar _buildAppBar(theme) {
    return AppBar(
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: theme.brightness == Brightness.light
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      centerTitle: false,
      titleSpacing: 0,
      title: AppText(
        text: 'Edit Profile',
        fontSize: 22.sp,
        color: AppColors.lightTextMidColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: CircleAvatar(
        radius: 45.r,
        backgroundColor: AppColors.grey200,
        child: Icon(CupertinoIcons.person_fill, size: 40.r),
      ),
    );
  }


  Widget _buildBasicDetails() {
    return buildSection(
      Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedProfile,
                  color: AppColors.lightPrimary,
                  size: 20.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppText(
                  text: 'Basic Details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedPencilEdit02,
                    size: 20.r,
                    color: Colors.grey,
                  ),
                  AppText(
                    text: 'Edit',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Name', value: 'Rohan'),
              buildDetailItem(label: 'Gender', value: 'Male'),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Age', value: '29'),
              buildDetailItem(label: 'Marital Status', value: 'Never Married'),
            ],
          ),
          Row(
            spacing: 16.w,
            children: [
              buildDetailItem(label: 'Height', value: '5ft 10in - 177 cms'),
              buildDetailItem(label: 'Profile Created For', value: '-'),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildAboutMe() {
    return buildSection(
      Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedProfile,
                  color: AppColors.lightPrimary,
                  size: 20.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppText(
                  text: 'About Me',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedPencilEdit02,
                    size: 20.r,
                    color: Colors.grey,
                  ),
                  AppText(
                    text: 'Edit',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          AppText(
              maxLines: 20,
              text: "Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", fontSize: 14.sp)
        ],
      ),
    );
  }
}
