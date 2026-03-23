import '../exporters/app_export.dart';

class AppCustomSlider extends StatefulWidget {
  final List imageUrls;

  final double? height;
  final double borderRadius;
  final EdgeInsets? margin;

  final bool autoPlay;
  final Duration autoPlayInterval;

  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;

  final Widget? placeholder;
  final Widget? errorWidget;

  const AppCustomSlider({
    super.key,
    required this.imageUrls,
    required this.height,
    this.borderRadius = 12,
    this.margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.activeIndicatorColor = Colors.blue,
    this.inactiveIndicatorColor = Colors.grey,
    this.placeholder,
    this.errorWidget,
  });

  @override
  State<AppCustomSlider> createState() => _AppCustomSliderState();
}

class _AppCustomSliderState extends State<AppCustomSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height?.h ?? 200.h,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, _) => _currentIndex.value = index,
          ),
          items: widget.imageUrls.map<Widget>((v) => _buildImage(v)).toList(),
        ),
      ],
    );
  }

  Widget _buildImage(dynamic data) {
    return Container(
      margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: CachedNetworkImage(
              imageUrl: data['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (_, __) =>
                  widget.placeholder ??
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) =>
                  widget.errorWidget ?? const Icon(Icons.broken_image),
            ),
          ),
          _buildGradientOverlay(),
          _buildContentOverlay(data['details'] ?? {}),
        ],
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
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
    return Positioned(
      left: 12.w,
      right: 12.w,
      bottom: 12.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: details['name'] ?? '',
            fontSize: 16.sp,
            maxLines: 2,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

          AppText(
            text: details['id'] ?? '',
            fontSize: 12.sp,
            maxLines: 2,
            textAlign: TextAlign.start,
            color: Colors.white,
          ),
          AppText(
            text: details['age'] ?? '',
            fontSize: 12.sp,
            maxLines: 2,
            textAlign: TextAlign.start,
            color: Colors.white,
          ),
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
