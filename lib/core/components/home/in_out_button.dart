import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/screens/earning/earning_category_screen.dart';
import 'package:ininoutout_flutter/screens/earning/earning_screen.dart';
import 'package:ininoutout_flutter/screens/expense/expense_category_screen.dart';
import 'package:ininoutout_flutter/screens/expense/expense_screen.dart';

class InOutButton extends StatelessWidget {
  const InOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EarningCategoryScreen.name);
              },
              style: FilledButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: AppColors.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'รับ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontSize: AppFontSize.h1,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ExpenseCategoryScreen.name);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: AppColors.orange),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: AppColors.orange,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'จ่าย',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontSize: AppFontSize.h1,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
