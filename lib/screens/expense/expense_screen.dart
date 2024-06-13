import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/expense/components/expense_screen/expense_fetcher.dart';

class ExpenseScreen extends StatelessWidget {
  static const name = '/expense/expense_screen';
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text(
            "รายจ่าย",
            style: TextStyle(
              color: Colors.black,
              fontSize: AppFontSize.h1,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ExpenseFetcher(category: category),
    );
  }
}
