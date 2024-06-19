import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarningChart extends StatefulWidget {
  final String category;
  const EarningChart({super.key, required this.category});

  @override
  State<EarningChart> createState() => _EarningChartState();
}

class _EarningChartState extends State<EarningChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var maxY =
          db.calculateEntriesAndAmountEarning(widget.category)['totalAmount'];
      var list = db.calculateWeekEarning().reversed.toList();
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
                      toY: e['amount'],
                      width: 20.0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.primary,
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
