import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/core/models/earning/earning.dart';
import 'package:provider/provider.dart';

class EarningCondirmBox extends StatelessWidget {
  final Earning ern;
  const EarningCondirmBox({super.key, required this.ern});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Text('Delete ${ern.title} ?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Dont delete"),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              provider.deleteEarning(ern.id, ern.category, ern.amount);
            },
            child: const Text('Delete'),
          )
        ],
      ),
    );
  }
}
