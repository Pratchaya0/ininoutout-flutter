import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/core/models/expense/expanse.dart';
import 'package:provider/provider.dart';

class ConfirmBox extends StatelessWidget {
  final Expense exp;
  const ConfirmBox({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('ต้องการจะลบ \"${exp.title}\" ใช่หรือไม่?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'ไม่ต้องการ',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              provider.deleteExpense(exp.id, exp.category, exp.amount);
            },
            child: const Text(
              'ลบ',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
