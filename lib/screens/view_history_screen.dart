import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ViewHistoryScreen extends StatelessWidget {
  const ViewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsBox = Hive.box('transactions');

    return Scaffold(
      appBar: AppBar(title: const Text('Payment History')),
      body: ListView.builder(
        itemCount: transactionsBox.length,
        itemBuilder: (context, index) {
          final txn = transactionsBox.getAt(index);
          return ListTile(
            title: Text('₹${txn['amount']} to ${txn['recipient']}'),
            subtitle: Text(txn['timestamp']),
          );
        },
      ),
    );
  }
}

