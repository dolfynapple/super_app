import 'dart:developer';

import 'package:dio/dio.dart';

final class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    log(
      '''
[REQUEST]
${options.method} ${options.uri}
Headers: ${options.headers}
Body: ${options.data}
''',
    );

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log(
      '''
[RESPONSE]
${response.statusCode}
${response.requestOptions.uri}
${response.data}
''',
    );

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    log(
      '''
[ERROR]
${err.requestOptions.uri}
${err.message}
''',
    );

    handler.next(err);
  }
}
