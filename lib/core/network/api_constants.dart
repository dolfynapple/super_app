import 'package:flutter_dotenv/flutter_dotenv.dart';

final class ApiConstants {
  ApiConstants._();

  static String developmentBaseUrl =
      dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';
  static String stagingBaseUrl =
      dotenv.env['STAGING_API_BASE_URL'] ?? 'https://staging-api.com';
  static String productionBaseUrl =
      dotenv.env['PRODUCTION_API_BASE_URL'] ?? 'https://api.com';

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
}
