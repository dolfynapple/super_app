import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio_super_app/core/network/api_constants.dart';
import 'package:portfolio_super_app/core/network/interceptors/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient({required this.tokenProvider})
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.developmentBaseUrl,
          connectTimeout: ApiConstants.connectTimeout,
          receiveTimeout: ApiConstants.receiveTimeout,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    _dio.interceptors.add(AuthInterceptor(tokenProvider: tokenProvider));
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  final Future<String?> Function() tokenProvider;
  final Dio _dio;
  Dio get instance => _dio;
}
