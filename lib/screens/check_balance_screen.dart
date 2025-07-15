import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CheckBalanceScreen extends StatelessWidget {
  const CheckBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pinBox = Hive.box('pin');
    final pinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Check Balance (PIN Protected)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: pinController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Enter PIN'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String savedPin = pinBox.get('user_pin', defaultValue: '');
                if (pinController.text.trim() == savedPin) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Balance'),
                      content: const Text('Balance: ₹50,000 (Demo Amount)'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect PIN')),
                  );
                }
              },
              child: const Text('Check Balance'),
            ),
          ],
        ),
      ),
    );
  }
}


