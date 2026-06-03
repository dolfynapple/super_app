// // lib/cashier/domain/repository/i_cashier_repository.dart

// import 'package:portfolio_super_app/cashier/domain/entities/pos_transaction.dart';
// import 'package:portfolio_super_app/cashier/domain/entities/product_item.dart';

// /// The contract defining all business actions available for the POS Cashier feature.
// /// 
// /// Because this lives in the pure Domain layer, it has zero knowledge of Hive,
// /// databases, or network protocols. It only speaks in pure Entities.
// abstract class ICashierRepository {
  
//   // === 📦 Product Management ===
  
//   /// Fetches all products available for the cashier to sell.
//   Future<List<ProductItem>> getProducts();

//   /// Updates the local stock level of a product when an item is added or returned.
//   Future<void> updateProductStock(String productId, int newQuantity);

//   // === 💳 Transaction Management ===

//   /// Saves a newly completed checkout transaction to storage.
//   Future<void> saveTransaction(PosTransaction transaction);

//   /// Retrieves all cached transactions that haven't been synchronized to the cloud yet.
//   Future<List<PosTransaction>> getUnsyncedTransactions();

//   /// Marks a batch of transactions as successfully uploaded to the server.
//   Future<void> markTransactionsAsSynced(List<String> transactionIds);
// }