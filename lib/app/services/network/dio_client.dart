// lib/app/network/dio_client.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient() {
    _dio = Dio(
      BaseOptions(
        // Replace with your base URL later or load via environment variables
        baseUrl: 'https://api.example.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 13),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Attach interceptors (Loggers, Auth inject tokens, etc.)
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  late final Dio _dio;

  // Expose the raw instance so repositories can seamlessly perform standard tasks
  Dio get instance => _dio;
}
