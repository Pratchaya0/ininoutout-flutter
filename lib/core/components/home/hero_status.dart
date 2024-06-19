import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:provider/provider.dart';

class HeroStatus extends StatefulWidget {
  const HeroStatus({super.key});

  @override
  State<HeroStatus> createState() => _HeroStatusState();
}

class _HeroStatusState extends State<HeroStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var totalEarning = db.calculateTotalEarning();
      var totalExpense = db.calculateTotalExpense();
      var status = db.moneyStatus(totalEarning, totalExpense);

      if (status) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(
                "assets/images/loading.gif",
                width: 80,
                height: 80,
              ),
              const Text("Good Status"),
            ],
          ),
        );
      }

      return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(
                "assets/images/finance_1.png",
                width: 80,
                height: 80,
              ),
              const Text("Bad Status"),
            ],
          ),
        );
    });
  }
}
