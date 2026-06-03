import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio_super_app/core/network/dio_client.dart';
import 'package:portfolio_super_app/core/storage/hive_service.dart';
import 'package:portfolio_super_app/core/storage/secure_storage.dart';

/// Global alias to cleanly pull dependencies anywhere in the app:
/// e.g., `sl<DioClient>()`
final GetIt sl = GetIt.instance;

/// Pre-flight registration blueprint for global singletons and services
Future<void> initServiceLocator() async {
  logDI('Initializing Service Locator...');

  // initializing Hive.
  final hiveService = HiveService();
  await hiveService.init();

  // == registering services in the locator ==

  // core services
  sl
    ..registerSingleton<HiveService>(hiveService)
    ..registerLazySingleton(FlutterSecureStorage.new)
    ..registerLazySingleton(() => SecureStorageService(sl()))
    ..registerLazySingleton<DioClient>(
      () => DioClient(tokenProvider: sl<SecureStorageService>().getAccessToken),
    );
  // == end of registrations ==

  logDI('Service Locator Successfully Ready!');
}

/// Helper logger just for dependency debugging
void logDI(String message) {
  // Use simple print or log function for explicit DI tracking
  // ignore: avoid_print
  print('⚙️ [Dependency Injection]: $message');
}
