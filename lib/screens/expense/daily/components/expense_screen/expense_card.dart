import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';
import 'package:ininoutout_flutter/core/models/expense/expanse.dart';
import 'package:ininoutout_flutter/screens/expense/components/expense_screen/confirm_box.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(
          context: context,
          builder: (_) => ConfirmBox(exp: exp),
        );
        return null;
      },
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icons[exp.category]),
        ),
        title: Text(exp.title),
        subtitle: Text(DateFormat('dd MMMM yyyy', 'th').format(exp.date)),
        trailing: Text(NumberFormat.currency(locale: 'th_TH', symbol: '฿')
            .format(exp.amount)),
      ),
    );
  }
}
