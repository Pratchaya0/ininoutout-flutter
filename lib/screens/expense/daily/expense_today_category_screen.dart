import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/expense/components/today_category_screen/category_fetcher.dart';
import 'package:ininoutout_flutter/screens/expense/components/expense_form.dart';

class ExpenseCategoryScreen extends StatelessWidget {
  static const name = '/expense/category_screen';
  const ExpenseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          'รายจ่ายวันนี้',
          style: TextStyle(
            color: Colors.black,
            fontSize: AppFontSize.h1,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black,
      ),
      body: const SafeArea(child: CategoryFetcher()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const ExpenseForm(),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: AppColors.orange,
      ),
    );
  }
}
