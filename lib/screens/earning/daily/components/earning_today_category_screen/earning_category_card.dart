import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/earning/earning_category.dart';
import 'package:ininoutout_flutter/core/models/earning/get_earning_category_type.dart';
import 'package:ininoutout_flutter/screens/earning/earning_screen.dart';
import 'package:intl/intl.dart';

class EarningCategoryCard extends StatelessWidget {
  final GetEarningCategoryType category;
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
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('จำนวน: ${category.entries} รายการ'),
      trailing: Text(NumberFormat.currency(locale: 'th_TH', symbol: '฿')
          .format(category.totalAmount)),
    );
  }
}
