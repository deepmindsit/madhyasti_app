import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API-related constants
///
/// Configuration is loaded from .env files in the `env/` directory.
/// Values can be overridden using --dart-define.
class ApiConstants {
  ApiConstants._();

  /// Base URL for the API
  ///
  /// Loaded from .env file (BASE_URL) or --dart-define
  /// Priority: --dart-define > .env file > default value
  static String get baseUrl {
    // Check --dart-define first
    const dartDefine = String.fromEnvironment('BASE_URL');
    if (dartDefine.isNotEmpty) return dartDefine;

    // Then check .env file
    return dotenv.env['BASE_URL'] ?? '';
  }

  /// Connection timeout duration in milliseconds
  static Duration get connectionTimeout {
    final timeoutMs = dotenv.env['API_TIMEOUT'];
    if (timeoutMs != null) {
      return Duration(milliseconds: int.tryParse(timeoutMs) ?? 30000);
    }
    return const Duration(seconds: 30);
  }

  /// Receive timeout duration
  static Duration get receiveTimeout => connectionTimeout;

  /// API endpoints
  static const String login = '/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String userProfile = '/user/profile';
}
