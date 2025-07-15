import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hive/hive.dart';

class QRGeneratorScreen extends StatelessWidget {
  const QRGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usersBox = Hive.box('users');
    final keys = usersBox.keys.toList();
    String qrData = '';

    if (keys.isNotEmpty) {
      final user = usersBox.get(keys.first);
      qrData = 'Name: ${user['username']}, Phone: ${user['phone']}';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Your QR Code')),
      body: Center(
        child: qrData.isNotEmpty
            ? QrImageView(data: qrData, size: 250)
            : const Text('No QR Data Found. Please Sign Up First.'),
      ),
    );
  }
}

