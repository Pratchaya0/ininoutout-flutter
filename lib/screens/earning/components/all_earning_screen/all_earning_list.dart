import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_card.dart';
import 'package:provider/provider.dart';

class AllEarningList extends StatelessWidget {
  const AllEarningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.earnings;
      return list.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: list.length,
              itemBuilder: (_, i) => EarningCard(ern: list[i]),
            )
          : const Center(child: Text("No Entries Found"));
    });
  }
}
