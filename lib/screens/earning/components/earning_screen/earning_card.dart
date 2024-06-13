import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';
import 'package:ininoutout_flutter/core/models/earning/earning.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_confirm_box.dart';
import 'package:intl/intl.dart';

class EarningCard extends StatelessWidget {
  final Earning ern;
  const EarningCard({super.key, required this.ern});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(ern.id),
        confirmDismiss: (_) async {
          showDialog(
            context: context,
            builder: (_) => EarningCondirmBox(ern: ern),
          );
        },
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icons[ern.category]),
          ),
          title: Text(ern.title),
          subtitle: Text(DateFormat('MMMM dd, yyyy').format(ern.date)),
          trailing: Text(NumberFormat.currency(locale: 'th_TH', symbol: '฿')
              .format(ern.amount)),
        ));
  }
}
