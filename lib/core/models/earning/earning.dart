class Earning {
  final int id; // unique id for every Earning
  final String title; // what are we spending on
  final double amount; // how much are we spending
  final DateTime date; // when are we spending
  final String category; // which category on we spending

  // constructor
  Earning({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  // 'Earning' to 'Map'
  Map<String, dynamic> toMap() => {
        // id will generate automatically
        'title': title,
        'amount': amount.toString(),
        'date': date.toString(),
        'category': category,
      };

  // 'Map' to 'Earning'
  factory Earning.fromString(Map<String, dynamic> value) => Earning(
      id: value['id'],
      title: value['title'],
      amount: double.parse(value['amount']),
      date: DateTime.parse(value['date']),
      category: value['category']);
}
