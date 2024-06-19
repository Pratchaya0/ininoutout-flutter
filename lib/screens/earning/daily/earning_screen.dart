import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/earning/daily/components/earning_screen/earning_fetcher.dart';

class EarningScreen extends StatelessWidget {
  static const name = '/earning/daily/earning_screen';
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'รายรับ',
            style: TextStyle(
              color: Colors.black,
              fontSize: AppFontSize.h1,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: EarningFetcher(category: category),
    );
  }
}
