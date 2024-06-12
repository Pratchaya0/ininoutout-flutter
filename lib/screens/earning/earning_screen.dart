import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningScreen extends StatelessWidget {
  static const name = '/earning/earning_screen';
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TextStyle(
      //   fontFamily: 'Noto Sans Thai',
      //   fontSize: 18,
      //   fontVariations: [
      //     FontVariation('ital', 0),
      //     FontVariation('wdth', 100),
      //     FontVariation('wght', <weight>)
      //   ],
      // ),
      appBar: AppBar(title: Text('รายรับ')),
      // body:,
    );
  }
}
