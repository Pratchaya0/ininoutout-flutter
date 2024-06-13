import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TotalChart extends StatefulWidget {
  const TotalChart({super.key});

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.expenseCategories;
      var total = db.calculateTotalExpense();
      return Row(
        children: [
          Expanded(
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'รายจ่ายรวมทั้งหมด : ${NumberFormat.currency(locale: 'th_TH', symbol: '฿').format(total)}',
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                ...list.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Container(
                          width: 8.0,
                          height: 8.0,
                          color: AppColors.expenseGraphColors[list.indexOf(e)],
                        ),
                        const SizedBox(width: 5.0),
                        Text(e.title),
                        const SizedBox(width: 5.0),
                        Text(total == 0
                            ? '0%'
                            : '${((e.totalAmount / total) * 100).toStringAsFixed(2)}%'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 20.0,
                sections: total != 0
                    ? list
                        .map(
                          (e) => PieChartSectionData(
                            showTitle: false,
                            value: e.totalAmount,
                            color: AppColors.expenseGraphColors[list.indexOf(e)],
                          ),
                        )
                        .toList()
                    : list
                        .map(
                          (e) => PieChartSectionData(
                            showTitle: false,
                            color: AppColors.expenseGraphColors[list.indexOf(e)],
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
