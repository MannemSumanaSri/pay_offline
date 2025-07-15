import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('users');
  await Hive.openBox('transactions');
  await Hive.openBox('pin');
  await Hive.openBox('balance');

  // Set default PIN if not set
  final pinBox = Hive.box('pin');
  if (!pinBox.containsKey('user_pin')) {
    pinBox.put('user_pin', '1234');  // Default PIN
  }

  // Set default balance if not set
  final balanceBox = Hive.box('balance');
  if (!balanceBox.containsKey('amount')) {
    balanceBox.put('amount', 5000);  // Default ₹5000 balance
  }

  runApp(const PayOfflineApp());
}

class PayOfflineApp extends StatelessWidget {
  const PayOfflineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Offline',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginScreen(),
    );
  }
}


