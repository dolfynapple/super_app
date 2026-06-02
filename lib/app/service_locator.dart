import 'package:get_it/get_it.dart';
import 'package:portfolio_super_app/app/services/dio_client.dart';

/// Global alias to cleanly pull dependencies anywhere in the app:
/// e.g., `sl<DioClient>()`
final GetIt sl = GetIt.instance;

/// Pre-flight registration blueprint for global singletons and services
Future<void> initServiceLocator() async {
  logDI('Initializing Service Locator...');

  // register DioClient as a lazy singleton,
  // meaning it will be created on first use and shared across the app
  sl.registerLazySingleton<DioClient>(DioClient.new);

  // ==========================================================================
  // 2. Global Services / Repositories
  // ==========================================================================
  // We will register your WebSocket, AI Client, and Encryption layers here.

  logDI('Service Locator Successfully Ready!');
}

/// Helper logger just for dependency debugging
void logDI(String message) {
  // Use simple print or log function for explicit DI tracking
  // ignore: avoid_print
  print('⚙️ [Dependency Injection]: $message');
}
