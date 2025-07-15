import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'pin_verification_screen.dart';

class SendPaymentScreen extends StatefulWidget {
  const SendPaymentScreen({super.key});

  @override
  State<SendPaymentScreen> createState() => _SendPaymentScreenState();
}

class _SendPaymentScreenState extends State<SendPaymentScreen> {
  final phoneController = TextEditingController();
  final amountController = TextEditingController();

  int currentBalance = 0;

  @override
  void initState() {
    super.initState();
    loadBalance();
  }

  void loadBalance() {
    final balanceBox = Hive.box('balance');
    setState(() {
      currentBalance = balanceBox.get('amount', defaultValue: 5000); // ₹5000 default
    });
  }

  void proceedPayment() {
    int amount = int.tryParse(amountController.text.trim()) ?? 0;

    if (phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter recipient phone number')),
      );
      return;
    }

    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    if (amount > currentBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot send money. Insufficient balance.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PinVerificationScreen(
          recipientPhone: phoneController.text.trim(),
          amount: amount,
        ),
      ),
    ).then((_) => loadBalance());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Payment')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Balance: ₹$currentBalance',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Recipient Phone Number:'),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            const Text('Amount:'),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Amount in ₹'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: proceedPayment,
              child: const Text('Send Payment'),
            ),
          ],
        ),
      ),
    );
  }
}











