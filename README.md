📱 Pay Offline – Flutter Offline Payment App
Pay Offline is a simple offline payments app built using Flutter. The app allows users to:

Register and login without internet.

Set and use a secure 4-digit PIN.

Send payments via phone number (offline).

Manage balance locally using Hive database.

View transaction history offline.

All transactions are stored locally and work entirely offline.

🚀 Features
🔐 Secure offline login/signup (Hive storage)

📱 Phone number-based payments (offline)

🔑 PIN-protected transaction confirmation

🏦 Balance management stored offline

🚫 Prevents payment if insufficient balance

📊 Offline transaction history tracking

📷 QR generation & scanner planned (optional)

📴 Fully offline operation (works without internet)

📲 Tech Stack
Flutter (Cross-platform framework)

Hive (Lightweight key-value database)

Mobile Scanner / QR (Optional)

🛠️ Getting Started
Prerequisites:
Flutter SDK installed

Android Studio / VSCode

Android emulator or real device

Setup Instructions:
bash
Copy
Edit
git clone https://github.com/MannemSumanaSri/pay_offline.git
cd pay_offline
flutter pub get
flutter run
📂 Project Structure
css
Copy
Edit
lib/
 ├── main.dart
 ├── services/
 │    └── db_service.dart
 └── screens/
      ├── login_screen.dart
      ├── signup_screen.dart
      ├── dashboard_screen.dart
      ├── send_payment_screen.dart
      ├── pin_verification_screen.dart
      ├── payment_success_screen.dart
      ├── view_history_screen.dart
      ├── check_balance_screen.dart
      ├── qr_generator_screen.dart
      └── qr_scanner_screen.dart
📈 Future Enhancements
🔄 Data sync when online

📤 Export transaction history

📷 QR payments and receipts

🛡️ Recipient verification before payment

💳 Balance top-up feature

🤝 Contributions
Contributions are welcome! Fork the repo and submit a pull request.

📄 License
This project is licensed under the MIT License.
See the LICENSE file for details.

📢 Author
Created by Mannem Sumana Sri.
