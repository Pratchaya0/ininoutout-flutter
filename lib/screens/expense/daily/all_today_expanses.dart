import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/expense/components/all_today_expenses_screen/all_expenses_fetcher.dart';

class AllExpanses extends StatefulWidget {
  static const name = '/expanse/all_expenses';
  const AllExpanses({super.key});

  @override
  State<AllExpanses> createState() => _AllExpansesState();
}

class _AllExpansesState extends State<AllExpanses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          "รายจ่ายทั้งหมด",
          style: TextStyle(
            color: Colors.black,
            fontSize: AppFontSize.h1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const AllExpensesFetcher(),
    );
  }
}
