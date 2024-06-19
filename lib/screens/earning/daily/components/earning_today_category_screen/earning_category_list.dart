import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_today_category_screen/earning_category_card.dart';
import 'package:provider/provider.dart';

class EarningCategoryList extends StatelessWidget {
  const EarningCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.getTodayEarningCategory();
      return ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: list.length,
        itemBuilder: (_, i) => EarningCategoryCard(category: list[i]),
      );
    });
  }
}
