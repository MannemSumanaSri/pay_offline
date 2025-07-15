import 'package:flutter/material.dart';
import 'check_balance_screen.dart';
import 'send_payment_screen.dart';
import 'view_history_screen.dart';
import 'qr_generator_screen.dart';
import 'qr_scanner_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Offline Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SendPaymentScreen())),
              child: const Text('Send Payment'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ViewHistoryScreen())),
              child: const Text('View Payment History'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckBalanceScreen())),
              child: const Text('Check Balance (PIN Locked)'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QRGeneratorScreen())),
              child: const Text('Generate QR Code'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QRScannerScreen())),
              child: const Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
