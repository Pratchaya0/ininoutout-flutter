import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';

class GetEarningCategoryType {
  final String title;
  int entries = 0;
  double totalAmount = 0.0;
  final IconData icon;

  GetEarningCategoryType({
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

  factory GetEarningCategoryType.fromString(Map<String, dynamic> value) => 
    GetEarningCategoryType(
      title: value['title'],
      entries: value['entries'],
      totalAmount: value['totalAmount'],
      icon: icons[value['title']]!,
    );
}
