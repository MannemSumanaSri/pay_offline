class TransactionModel {
  final String type;
  final String amount;
  final String time;

  TransactionModel({
    required this.type,
    required this.amount,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'amount': amount,
      'time': time,
    };
  }

  factory TransactionModel.fromMap(Map map) {
    return TransactionModel(
      type: map['type'],
      amount: map['amount'],
      time: map['time'],
