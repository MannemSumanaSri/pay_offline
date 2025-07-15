import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String recipientName;
  final String amount;

  const PaymentSuccessScreen({
    super.key,
    required this.recipientName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 100),
            const SizedBox(height: 20),
            Text('₹$amount sent to $recipientName!',
                style: const TextStyle(color: Colors.white, fontSize: 22)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Back to Dashboard', style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}


