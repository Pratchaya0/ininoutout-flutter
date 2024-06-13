import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/font_size.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/all_earning.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_category_screen/earning_category_list.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_category_screen/earning_total_chart.dart';
import 'package:provider/provider.dart';

class EarningCategoryFetcher extends StatefulWidget {
  const EarningCategoryFetcher({super.key});

  @override
  State<EarningCategoryFetcher> createState() => _EarningCategoryFetcherState();
}

class _EarningCategoryFetcherState extends State<EarningCategoryFetcher> {
  late Future _categoryList;

  Future _getCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchEarningCategories();
  }

  @override
  void initState() {
    super.initState();
    _categoryList = _getCategoryList();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 250.0,
                    child: EarningTotalChart(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ประเภทรายรับ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSize.md,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AllEarning.name);
                        },
                        child: const Text(
                          "ดูทั้งหมด",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: AppFontSize.md,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: EarningCategoryList())
                ],
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
