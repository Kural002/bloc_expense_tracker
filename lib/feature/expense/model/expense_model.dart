class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  factory ExpenseModel.fromMap(String id, Map<String, dynamic> data) {
    return ExpenseModel(
      id: id,
      title: data['title'],
      amount: (data['amount'] as num).toDouble(),
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'amount': amount, 'date': date.toIso8601String()};
  }
}
