import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/screens/earning/components/all_today_earning_screen/all_earning_list.dart';
import 'package:ininoutout_flutter/screens/earning/components/all_today_earning_screen/earning_search.dart';
import 'package:provider/provider.dart';

class AllEarningFetcher extends StatefulWidget {
  const AllEarningFetcher({super.key});

  @override
  State<AllEarningFetcher> createState() => _AllEarningFetcherState();
}

class _AllEarningFetcherState extends State<AllEarningFetcher> {
  late Future _allEarningList;

  Future _getAllEarnings() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllEarning();
  }

  @override
  void initState() {
    super.initState();
    _allEarningList = _getAllEarnings();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allEarningList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  EarningSearch(),
                  Expanded(
                    child: AllEarningList(),
                  ),
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
