import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:provider/provider.dart';

class EarningSearch extends StatefulWidget {
  const EarningSearch({super.key});

  @override
  State<EarningSearch> createState() => _EarningSearchState();
}

class _EarningSearchState extends State<EarningSearch> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return TextField(
      onChanged: (value) {
        provider.searchText = value;
      },
      decoration: const InputDecoration(
        labelText: 'ค้นหารายรับ',
      ),
    );
  }
}
