import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_category_screen/earning_category_fetcher.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_form.dart';

class EarningCategoryScreen extends StatelessWidget {
  static const name = '/earning/earning_category_screen';
  const EarningCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'ประเภทรายรับ',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: const SafeArea(child: EarningCategoryFetcher()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const EarningForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
