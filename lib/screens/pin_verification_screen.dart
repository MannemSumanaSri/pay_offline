import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'payment_success_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  final String recipientPhone;
  final int amount;

  const PinVerificationScreen({
    super.key,
    required this.recipientPhone,
    required this.amount,
  });

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final pinController = TextEditingController();

  void verifyPIN() {
    final pinBox = Hive.box('pin');
    final savedPIN = pinBox.get('user_pin', defaultValue: '');

    if (pinController.text.trim() == savedPIN) {
      final balanceBox = Hive.box('balance');
      int currentBalance = balanceBox.get('amount', defaultValue: 5000);
      int newBalance = currentBalance - widget.amount;
      balanceBox.put('amount', newBalance);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentSuccessScreen(
            recipientPhone: widget.recipientPhone,
            amount: widget.amount,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter PIN')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter PIN'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyPIN,
              child: const Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}



