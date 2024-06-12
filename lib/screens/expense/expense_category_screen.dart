import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/screens/expense/components/category_screen/category_fetcher.dart';
import 'package:ininoutout_flutter/screens/expense/components/expense_form.dart';

class ExpenseCategoryScreen extends StatelessWidget {
  static const name = '/expense/category_screen';
  const ExpenseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: const SafeArea(child: CategoryFetcher()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const ExpenseForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
