import 'package:flutter/material.dart';
import '../services/db_service.dart';

class PayBillsScreen extends StatefulWidget {
  const PayBillsScreen({Key? key}) : super(key: key);

  @override
  State<PayBillsScreen> createState() => _PayBillsScreenState();
}

class _PayBillsScreenState extends State<PayBillsScreen> {
  final amountController = TextEditingController();
  final db = DBService();

  void payBill() {
    db.saveTransaction({
      'type': 'Bill Payment',
      'amount': amountController.text,
      'time': DateTime.now().toString()
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Bill Payment Recorded')));
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pay Bills')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            TextField(controller: amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Bill Amount')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: payBill, child: const Text('Pay Bill'))
          ]),
        ));
  }
}
