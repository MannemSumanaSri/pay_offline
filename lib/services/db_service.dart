import 'package:hive/hive.dart';

class DBService {
  final Box usersBox = Hive.box('users');
  final Box transactionsBox = Hive.box('transactions');

  String getUsernameByPhone(String phone) {
    for (var key in usersBox.keys) {
      final user = usersBox.get(key);
      if (user['phone'] == phone) {
        return user['username'];
      }
    }
    return 'Number Not Registered';
  }

  void saveTransaction(String type, String amount, String recipientPhone) {
    final transaction = {
      'type': type,
      'amount': amount,
      'recipient': recipientPhone,
      'timestamp': DateTime.now().toString(),
    };
    transactionsBox.add(transaction);
  }
}


