import '../exporters/app_export.dart';

class MatchCardOverlay extends StatelessWidget {
  final dynamic details;
  final bool isDetails;
  const MatchCardOverlay({
    super.key,
    required this.details,
    this.isDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: FadeInImage(
              placeholder: AssetImage(AppAssets.appLogo),
              image: NetworkImage(details['image'] ?? ''),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade100,
                  child: Center(
                    child: Image.asset(AppAssets.appLogo, height: 40.h),
                  ),
                );
              },
            ),

            // CachedNetworkImage(
            //   imageUrl: details['image'],
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   placeholder: (_, __) =>
            //       const Center(child: CircularProgressIndicator()),
            //   errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
            // ),
          ),
          _buildGradientOverlay(),
          _buildContentOverlay(details['details'] ?? {}),
        ],
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              AppColors.lightMidPrimary,
            ],
            stops: const [0.0, 0.2, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildContentOverlay(dynamic details) {
    final isVerified = details['isVerified'] == true;
    return Positioned(
      left: 12.w,
      right: 12.w,
      bottom: isDetails ? 50.h: 12.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isVerified)
            SizedBox(
              width: Get.width * 0.2,
              child: badge(
                "Verified",
                AppColors.lightPrimary,
                HugeIcons.strokeRoundedCheckmarkBadge01,
              ),
            ),

          AppText(
            text: details['name'] ?? '',
            fontSize: 16.sp,
            maxLines: 2,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          if (details['id'].toString().isNotEmpty)
            AppText(
              text: details['id'] ?? '',
              fontSize: 12.sp,
              maxLines: 2,
              textAlign: TextAlign.start,
              color: Colors.white,
            ),
          if (details['age'].toString().isNotEmpty)
            AppText(
              text: details['age'] ?? '',
              fontSize: 12.sp,
              maxLines: 2,
              textAlign: TextAlign.start,
              color: Colors.white,
            ),
          if (details['address'].toString().isNotEmpty)
            AppText(
              text: details['address'] ?? '',
              fontSize: 12.sp,
              maxLines: 2,
              textAlign: TextAlign.start,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
