import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_today_category_screen/earning_category_fetcher.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_form.dart';

class EarningCategoryScreen extends StatelessWidget {
  static const name = '/earning/earning_category_screen';
  const EarningCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'รายรับวันนี้',
          style: TextStyle(
            color: Colors.black,
            fontSize: AppFontSize.h1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(child: EarningCategoryFetcher()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const EarningForm(),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
