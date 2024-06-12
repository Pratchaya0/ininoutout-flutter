import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/expense/components/expense_screen/expense_card.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var exList = db.expenses;
      return exList.isNotEmpty
          ? ListView.builder(
              itemCount: exList.length,
              itemBuilder: (_, i) => ExpenseCard(exp: exList[i]),
            )
          : const Center(
              child: Text('ยังไม่มีรายจ่าย'),
            );
    });
  }
}
