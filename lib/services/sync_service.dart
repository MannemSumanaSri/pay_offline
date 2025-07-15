import 'package:connectivity_plus/connectivity_plus.dart';
import 'db_service.dart';

class SyncService {
  static final SyncService _instance = SyncService._internal();
  factory SyncService() => _instance;
  SyncService._internal();

  final DBService db = DBService();

  Future<void> syncTransactions() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      List<Map> transactions = db.getTransactions();

      // Simulated Sync Process (Replace this with actual API call in production)
      for (var tx in transactions) {
        print('Syncing transaction: ${tx['type']} ₹${tx['amount']}');
        await Future.delayed(const Duration(milliseconds: 200));
        // After successful sync, you can choose to mark or clear transactions.
      }

      print('All transactions synced.');
    } else {
      print('No internet connection. Sync postponed.');
    }
  }
}
