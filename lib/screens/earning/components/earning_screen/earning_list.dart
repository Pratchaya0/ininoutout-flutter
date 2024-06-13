import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_card.dart';
import 'package:provider/provider.dart';

class EarningList extends StatelessWidget {
  const EarningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var enList = db.earnings;
        return enList.isNotEmpty
            ? ListView.builder(
                itemCount: enList.length,
                itemBuilder: (_, i) => EarningCard(ern: enList[i]),
              )
            : const Center(
                child: Text('No Expenses Added'),
              );
      },
    );
  }
}
