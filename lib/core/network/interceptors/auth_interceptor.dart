import 'package:dio/dio.dart';

final class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Future<String?> Function() tokenProvider,
  }) : _tokenProvider = tokenProvider;

  final Future<String?> Function() _tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenProvider();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
