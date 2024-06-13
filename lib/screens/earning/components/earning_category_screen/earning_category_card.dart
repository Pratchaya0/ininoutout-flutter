import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/earning/earning_category.dart';
import 'package:ininoutout_flutter/screens/earning/earning_screen.dart';
import 'package:ininoutout_flutter/screens/expense/expense_screen.dart';
import 'package:intl/intl.dart';

class EarningCategoryCard extends StatelessWidget {
  final EarningCategory category;
  const EarningCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          EarningScreen.name,
          arguments: category.title,
        );
      },
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('entries: ${category.entries}'),
      trailing: Text(NumberFormat.currency(locale: 'th_TH', symbol: '฿')
          .format(category.totalAmount)),
    );
  }
}
