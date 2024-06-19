import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/earning/components/all_today_earning_screen/all_earning_fetcher.dart';

class AllEarning extends StatefulWidget {
  static const name = '/earning/all_earning';
  const AllEarning({super.key});

  @override
  State<AllEarning> createState() => _AllEarningState();
}

class _AllEarningState extends State<AllEarning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "รายรับทั้งหมด",
          style: TextStyle(
            color: Colors.black,
            fontSize: AppFontSize.h1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const AllEarningFetcher(),
    );
  }
}
