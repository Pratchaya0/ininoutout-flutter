import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/constants/icons.dart';

class EarningCategory {
  final String title; // the title of the category
  int entries =
      0; // how many Earnings are in this category. it will change overtime
  double totalAmount = 0.0; // total amount of Earnings in this category
  final IconData icon; // we will define some constant icons.

  EarningCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  // we need a method to convert this 'model' to a 'Map'.
  // so that we can insert it into a database
  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount
            .toString(), // our database won't be able to store double values so we convert it to a string
        // not gonna store the icons in database. that's too much work.
      };

  // when we retrieve the data from the database it will be a 'Map'.
  // for our app to understand the data, we need to convert it back to a 'Earning Category'
  factory EarningCategory.fromString(Map<String, dynamic> value) =>
      EarningCategory(
        title: value['title'],
        entries: value['entries'],
        totalAmount: double.parse(value['totalAmount']),
        // it will search the 'icons' map and find the value related to the title.
        icon:
            icons[value['title']]!, // Hard code for mapping data in ..constants
      );
}