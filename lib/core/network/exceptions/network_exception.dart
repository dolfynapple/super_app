sealed class NetworkException implements Exception {
  const NetworkException();
}

final class RequestTimeoutException extends NetworkException {
  const RequestTimeoutException();
}

final class UnauthorizedException extends NetworkException {
  const UnauthorizedException();
}

final class ForbiddenException extends NetworkException {
  const ForbiddenException();
}

final class NotFoundException extends NetworkException {
  const NotFoundException();
}

final class ServerException extends NetworkException {
  const ServerException();
}

final class NoInternetException extends NetworkException {
  const NoInternetException();
}

final class UnknownException extends NetworkException {
  const UnknownException();
}
