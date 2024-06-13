import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/screens/earning/components/all_earning_screen/all_earning_fetcher.dart';

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
        title: const Text(
          "รายรับทั้งหมด",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const AllEarningFetcher(),
    );
  }
}
