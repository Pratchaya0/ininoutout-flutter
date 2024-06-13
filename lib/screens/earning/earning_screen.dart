import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_fetcher.dart';

class EarningScreen extends StatelessWidget {
  static const name = '/earning/earning_screen';
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('รายรับ')),
      body: EarningFetcher(category: category),
    );
  }
}
