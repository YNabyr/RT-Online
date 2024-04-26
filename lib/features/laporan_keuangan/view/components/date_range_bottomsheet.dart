import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerBottomSheet extends StatefulWidget {
  const DateRangePickerBottomSheet({super.key});

  @override
  _DateRangePickerBottomSheetState createState() =>
      _DateRangePickerBottomSheetState();
}

class _DateRangePickerBottomSheetState
    extends State<DateRangePickerBottomSheet> {
  late DateTime _startDate;
  late DateTime _endDate;
  final DateFormat _dateFormat = DateFormat('dd MMMM yyyy');

  @override
  void initState() {
    super.initState();
    // Set default dates
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Pilih Tanggal Awal:'),
              Text(_dateFormat.format(_startDate)),
              ElevatedButton(
                onPressed: () => _selectDate(context, true),
                child: const Text('Pilih'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Pilih Tanggal Akhir:'),
              Text(_dateFormat.format(_endDate)),
              ElevatedButton(
                onPressed: () => _selectDate(context, false),
                child: const Text('Pilih'),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup bottom sheet
                },
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lakukan sesuatu dengan rentang tanggal
                  String dateRange =
                      '${_dateFormat.format(_startDate)} - ${_dateFormat.format(_endDate)}';
                  print('Rentang Tanggal: $dateRange');

                  Navigator.pop(context); // Tutup bottom sheet
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
