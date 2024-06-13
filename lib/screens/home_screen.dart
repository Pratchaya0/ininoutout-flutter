import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ininoutout_flutter/core/components/home/earning_expense_fetcher.dart';
import 'package:ininoutout_flutter/core/components/home/in_out_button.dart';

class HomeScreen extends StatelessWidget {
  static const name = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: EarningExpenseFetcher(),
            ),
            SizedBox(
              height: 100,
              child: InOutButton(),
            ),
          ],
        ),
      ),
    );
  }
}
