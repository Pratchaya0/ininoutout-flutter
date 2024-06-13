import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarningTotalChart extends StatefulWidget {
  const EarningTotalChart({super.key});

  @override
  State<EarningTotalChart> createState() => _EarningTotalChartState();
}

class _EarningTotalChartState extends State<EarningTotalChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.earningCategories;
      var total = db.calculateTotalEarning();
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
                    'รายรับรวมทั้งหมด : ${NumberFormat.currency(locale: 'th_TH', symbol: '฿').format(total)}',
                    // ignore: deprecated_member_use
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
                          color: AppColors.earningGraphColors[list.indexOf(e)],
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          e.title,
                        ),
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
                            color:
                                AppColors.earningGraphColors[list.indexOf(e)],
                          ),
                        )
                        .toList()
                    : list
                        .map(
                          (e) => PieChartSectionData(
                            showTitle: false,
                            color:
                                AppColors.earningGraphColors[list.indexOf(e)],
                          ),
                        )
                        .toList(),
              ),
            ),
          )
        ],
      );
    });
  }
}
