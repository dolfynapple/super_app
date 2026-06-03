import 'package:dio/dio.dart';

import 'package:portfolio_super_app/core/network/exceptions/network_exception.dart';

extension DioExceptionExtension on DioException {
  NetworkException toNetworkException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const RequestTimeoutException();

      case DioExceptionType.connectionError:
        return const NoInternetException();

      case DioExceptionType.badResponse:
        final statusCode = response?.statusCode;

        switch (statusCode) {
          case 401:
            return const UnauthorizedException();

          case 403:
            return const ForbiddenException();

          case 404:
            return const NotFoundException();

          case 500:
            return const ServerException();

          default:
            return const UnknownException();
        }
      default:
        return const UnknownException();
    }
  }
}
