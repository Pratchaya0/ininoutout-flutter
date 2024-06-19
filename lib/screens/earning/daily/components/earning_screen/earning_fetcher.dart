import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_chart.dart';
import 'package:ininoutout_flutter/screens/earning/components/earning_screen/earning_list.dart';
import 'package:provider/provider.dart';

class EarningFetcher extends StatefulWidget {
  final String category;
  const EarningFetcher({super.key, required this.category});

  @override
  State<EarningFetcher> createState() => _EarningFetcherState();
}

class _EarningFetcherState extends State<EarningFetcher> {
  late Future _earningList;
  Future _getEarningList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchEarning(widget.category);
  }

  @override
  void initState() {
    super.initState();
    _earningList = _getEarningList();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _earningList,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: EarningChart(category: widget.category),
                    ),
                    const Expanded(child: EarningList())
                  ],
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
