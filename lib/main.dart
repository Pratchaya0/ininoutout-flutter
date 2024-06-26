import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ininoutout_flutter/core/constants/colors.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/all_today_earning.dart';
import 'package:ininoutout_flutter/screens/earning/earning_today_category_screen.dart';
import 'package:ininoutout_flutter/screens/earning/earning_screen.dart';
import 'package:ininoutout_flutter/screens/expense/all_today_expanses.dart';
import 'package:ininoutout_flutter/screens/expense/expense_today_category_screen.dart';
import 'package:ininoutout_flutter/screens/expense/expense_screen.dart';
import 'package:ininoutout_flutter/screens/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('th', null); // Initialize Thai locale
  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabaseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IninOutout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansThaiTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const HomeScreen(),
      initialRoute: HomeScreen.name,
      routes: {
        HomeScreen.name: (_) => const HomeScreen(),
        // Earning
        EarningCategoryScreen.name: (_) => const EarningCategoryScreen(),
        AllEarning.name: (_) => const AllEarning(),
        EarningScreen.name: (_) => const EarningScreen(),

        // Expense
        ExpenseCategoryScreen.name: (_) => const ExpenseCategoryScreen(),
        AllExpanses.name: (_) => const AllExpanses(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
      },
    );
  }
}
