import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  // Define constants for box names to prevent typos across the app
  static const String productBoxName = 'products_box';
  static const String transactionBoxName = 'transactions_box';

  /// Initializes Hive and opens the required boxes for our offline-first POS
  Future<void> init() async {
    // 1. Initialize Hive with Flutter-specific paths automatically
    await Hive.initFlutter();

    // 2. Open our NoSQL primitive boxes.
    // We open them as standard untyped boxes so we can read/write maps
    // directly without needing code-generation adapters!
    await Hive.openBox<Map<dynamic, dynamic>>(productBoxName);
    await Hive.openBox<Map<dynamic, dynamic>>(transactionBoxName);
  }

  /// Helper getters to easily grab the opened boxes anywhere
  Box<Map<dynamic, dynamic>> get productBox =>
      Hive.box<Map<dynamic, dynamic>>(productBoxName);

  Box<Map<dynamic, dynamic>> get transactionBox =>
      Hive.box<Map<dynamic, dynamic>>(transactionBoxName);
}
