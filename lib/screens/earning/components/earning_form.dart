import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';
import 'package:ininoutout_flutter/core/models/databese_provider.dart';
import 'package:ininoutout_flutter/core/models/earning/earning.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarningForm extends StatefulWidget {
  const EarningForm({super.key});

  @override
  State<EarningForm> createState() => _EarningFormState();
}

class _EarningFormState extends State<EarningForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title of earning',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount of earning',
              ),
            ),
            const SizedBox(height: 20.0),

            // Date picker
            Row(
              children: [
                Expanded(
                  child: Text(_date != null
                      ? DateFormat('MMMM dd, yyyy').format(_date!)
                      : 'Select Date'),
                ),
                IconButton(
                  onPressed: () => _pickDate(),
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),

            const SizedBox(height: 20.0),
            // Categorty
            Row(
              children: [
                const Expanded(
                  child: Text('Category'),
                ),
                Expanded(
                  child: DropdownButton(
                    items: icons.keys
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    value: _initialValue,
                    onChanged: (newValue) {
                      setState(() {
                        _initialValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                if (_title.text != '' && _amount.text != '') {
                  // create an earning
                  final file = Earning(
                    id: 0,
                    title: _title.text,
                    amount: double.parse(_amount.text),
                    date: _date != null ? _date! : DateTime.now(),
                    category: _initialValue,
                  );
                  // add it to database.
                  provider.addEarning(file);
                  // close the bottomsheet
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Earning'),
            )
          ],
        ),
      ),
    );
  }
}
