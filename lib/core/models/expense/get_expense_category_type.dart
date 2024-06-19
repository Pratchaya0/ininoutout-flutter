import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';

class GetExpenseCategoryType {
  final String title;
  int entries = 0;
  double totalAmount = 0.0;
  final IconData icon;

  GetExpenseCategoryType({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount.toString(),
      };

  factory GetExpenseCategoryType.fromString(Map<String, dynamic> value) =>
      GetExpenseCategoryType(
        title: value['title'],
        entries: value['entries'],
        totalAmount: value['totalAmount'],
        icon: icons[value['title']]!,
      );
}
