import '../../../core/exporters/app_export.dart';

class InterestOptionsList extends StatelessWidget {
  final int? selectedValue;
  final ValueChanged<int?> onChanged;
  final List items;
  const InterestOptionsList({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup<int>(
      groupValue: selectedValue,
      onChanged: onChanged,
      child: _buildBefore(),
      // child: _buildSuccess(),
    );
  }

  ///=======================OPTIONS===========================///
  Widget _buildBefore() {
    return Column(
      children: [
        _buildTitle(),
        _buildOptions(),
        AppButton(
          text: 'Submit',
          onTap: selectedValue == null ? null : () => Get.back(),
          backgroundColor: selectedValue == null
              ? AppColors.grey300
              : AppColors.lightPrimary,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Send Interest',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  text: 'Choose a message',
                  fontSize: 14.sp,
                  color: AppColors.lightTextLowColor,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 20.sp, color: AppColors.grey600),
            onPressed: () => Get.back(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: items.map((item) {
        final isSelected = item.id == selectedValue;

        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: GestureDetector(
            onTap: () => onChanged(item.id),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.lightPrimary
                      : AppColors.grey200,
                  width: isSelected ? 1.5 : 1,
                ),
                color: isSelected
                    ? AppColors.lightPrimary.withValues(alpha: 0.05)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  /// 🔘 NEW RADIO (NO groupValue / onChanged here)
                  Radio<int>(
                    value: item.id,
                    side: BorderSide(color: AppColors.grey400),
                  ),

                  SizedBox(width: 8.w),

                  /// 📝 TEXT
                  Expanded(
                    child: AppText(
                      text: item.text,
                      fontSize: 14.sp,
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      color: AppColors.lightTextMidColor,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  ///==========================SUCCESS==========================///
  Widget _buildSuccess() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 16.h,
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedCheckmarkBadge01,
            size: Get.width * 0.25.r,
            color: AppColors.lightPrimary,
          ),
          AppText(
            text: 'Interest Sent Successfully ❤️',
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
          AppText(
            text:
                'Your request has been delivered.\nOnce accepted, you can start chatting.️',
            fontSize: 14.sp,
            maxLines: 10,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: AppColors.lightTextMidColor,
          ),
          AppButton(
            text: 'Got It',
            onTap: () => Get.back(),
            backgroundColor: AppColors.lightPrimary,
          ),
        ],
      ),
    );
  }
}
