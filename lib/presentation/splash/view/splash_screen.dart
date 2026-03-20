import 'package:madhya/core/exporters/app_export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  final controller = getIt<SplashController>();

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
    controller.checkLogin();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? theme.colorScheme.surface
          : theme.colorScheme.primary.withValues(alpha: 0.05),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: _buildLogo(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AppAssets.splashLogo,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
    );

    // return Container(
    //   width: double.infinity,
    //   height:  double.infinity,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(24),
    //     boxShadow: [
    //       BoxShadow(
    //         color: theme.colorScheme.primary.withOpacity(0.2),
    //         blurRadius: 20,
    //         offset: const Offset(0, 10),
    //       ),
    //     ],
    //   ),
    //   child: Center(
    //     child: Icon(
    //       Icons.rocket_launch_rounded,
    //       size: 64,
    //       color: theme.colorScheme.primary,
    //     ),
    //   ),
    // );

    // NOTE: To use your custom logo asset, replace the above Container with:
    //
    // return Image.asset(
    //   AppAssets.splashLogo,
    //   width: 120,
    //   height: 120,
    //   fit: BoxFit.contain,
    // );
    //
    // Make sure to replace assets/images/splash_logo.png with your actual logo!
  }
}
