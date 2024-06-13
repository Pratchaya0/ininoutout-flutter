import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarningExpenseWeeklyChart extends StatefulWidget {
  const EarningExpenseWeeklyChart({super.key});

  @override
  State<EarningExpenseWeeklyChart> createState() =>
      _EarningExpenseWeeklyChartState();
}

class _EarningExpenseWeeklyChartState extends State<EarningExpenseWeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var maxY = db.calculateEntriesAndAmountEarningAndExpanse()['maxAmount'];
      var list = db.calculateWeekEarningAndExpense().reversed.toList();

      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: BarChart(
          BarChartData(
            minY: 0,
            maxY: maxY,
            barGroups: [
              ...list.map(
                (e) => BarChartGroupData(
                  x: list.indexOf(e),
                  barRods: [
                    BarChartRodData(
                      toY: e['earningAmount'],
                      width: 20.0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.primary,
                    ),
                    BarChartRodData(
                      toY: e['expenseAmount'],
                      width: 20.0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.orange,
                    ),
                  ],
                ),
              ),
            ],
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              leftTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              rightTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) => Text(
                    DateFormat.E().format(list[value.toInt()]['day']),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
