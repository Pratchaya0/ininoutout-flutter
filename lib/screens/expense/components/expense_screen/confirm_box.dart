import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/expense/expanse.dart';
import 'package:provider/provider.dart';

class ConfirmBox extends StatelessWidget {
  final Expense exp;
  const ConfirmBox({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of(context, listen: false);
    return AlertDialog(
      title: Text('Delete ${exp.title} ?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Don\'t delete'),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
