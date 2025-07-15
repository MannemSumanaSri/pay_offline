import 'package:flutter/material.dart';
import '../services/db_service.dart';
import 'dashboard_screen.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final pinController = TextEditingController();
  final db = DBService();

  void savePIN() async {
    if (pinController.text.length < 4) return;
    await db.savePIN(pinController.text);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set PIN')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text('Set a 4-digit PIN for balance protection'),
          TextField(controller: pinController, keyboardType: TextInputType.number, obscureText: true, maxLength: 4),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: savePIN, child: const Text('Set PIN')),
        ]),
      ),
    );
  }
}
