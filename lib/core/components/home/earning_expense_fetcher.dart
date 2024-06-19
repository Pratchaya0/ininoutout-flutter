import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/components/home/earning_expense_weekly_chart.dart';
import 'package:ininoutout_flutter/core/components/home/earning_total_chart.dart';
import 'package:ininoutout_flutter/core/components/home/hero_status.dart';
import 'package:ininoutout_flutter/core/components/home/total_chart.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:provider/provider.dart';

class EarningExpenseFetcher extends StatefulWidget {
  const EarningExpenseFetcher({super.key});

  @override
  State<EarningExpenseFetcher> createState() => _EarningExpenseFetcherState();
}

class _EarningExpenseFetcherState extends State<EarningExpenseFetcher> {
  // TODO: Imprement this code.
  late Future _earningList,
      _expenseList,
      _earningCategoryList,
      _expanseCategoryList;

  Future _getEarningCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchEarningCategories();
  }

  Future _getExpanseCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchExpenseCategories();
  }

  Future _getAllEarningList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllEarning();
  }

  Future _getAllExpenseList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpense();
  }

  @override
  void initState() {
    super.initState();
    _earningCategoryList = _getEarningCategoryList();
    _expanseCategoryList = _getExpanseCategoryList();
    _earningList = _getAllEarningList();
    _expenseList = _getAllExpenseList();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _expenseList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 150.0,
                    //   child: HeroStatus(),5
                    // ),
                    SizedBox(
                      height: 250.0,
                      child: EarningExpenseWeeklyChart(),
                    ),
                    SizedBox(
                      height: 250.0,
                      child: EarningTotalChart(),
                    ),
                    SizedBox(
                      height: 250.0,
                      child: TotalChart(),
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
