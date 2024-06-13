import 'package:flutter/material.dart';
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
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EarningCategoryScreen.name);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'รายรับ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
              child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ExpenseCategoryScreen.name);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'รายจ่าย',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
