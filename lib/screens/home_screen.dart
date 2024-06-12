import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/components/in_out_button.dart';

class HomeScreen extends StatelessWidget {
  static const name = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              child: const InOutButton(),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
