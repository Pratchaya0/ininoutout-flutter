import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/expense/expense_category.dart';
import 'package:ininoutout_flutter/screens/expense/expense_screen.dart';
import 'package:intl/intl.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExpenseScreen.name,
          arguments: category.title,
        );
      },
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      trailing: Text(NumberFormat.currency(locale: 'th_TH', symbol: '฿')
          .format(category.totalAmount)),
    );
  }
}
