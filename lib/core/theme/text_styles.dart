import '../exporters/app_export.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    FontWeight weight = FontWeight.w400,
    double? letterSpacing,
  }) {
    return GoogleFonts.manrope(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
    );
  }

  // Display styles
  static final displayLarge = _base(size: 57, letterSpacing: -0.25);
  static final displayMedium = _base(size: 45);
  static final displaySmall = _base(size: 36);

  // Headline styles
  static final headlineLarge = _base(size: 32);
  static final headlineMedium = _base(size: 28);
  static final headlineSmall = _base(size: 24);

  // Title styles
  static final titleLarge = _base(size: 22, weight: FontWeight.w500);
  static final titleMedium = _base(
    size: 16,
    weight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static final titleSmall = _base(
    size: 14,
    weight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // Body styles
  static final bodyLarge = _base(size: 16, letterSpacing: 0.5);
  static final bodyMedium = _base(size: 14, letterSpacing: 0.25);
  static final bodySmall = _base(size: 12, letterSpacing: 0.4);

  // Label styles
  static final labelLarge = _base(
    size: 14,
    weight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  static final labelMedium = _base(
    size: 12,
    weight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  static final labelSmall = _base(
    size: 11,
    weight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
