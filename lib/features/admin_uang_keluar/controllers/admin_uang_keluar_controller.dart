// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// Format hari
String formatHari(String dateString) {
  initializeDateFormatting('id');
  DateTime date = DateTime.parse(dateString);
  var formatter = DateFormat('EEEE', 'id');
  return formatter.format(date);
}

// Format Tanggal bulan
String formatTanggalBulan(String dateString) {
  initializeDateFormatting('id');
  var date = DateTime.parse(dateString);
  var formatter = DateFormat('dd MMMM', 'id');
  return formatter.format(date);
}

class AdminUangKeluarController extends GetxController {
  static AdminUangKeluarController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    ever(dateTapped, (_) => updateListUangKeluar());
    ever(selectedDate, (_) => updateListUang());

    // init calendar Controller
    calendarController.selectedDate = DateTime.now();
    calendarController.displayDate = selectedDate.value;

    selectedDate.value = DateTime.now();
    dateTapped.value = formatDateTapped(DateTime.now().toString());
  }

  // isFilter
  var isFilter = false.obs;

  // Controller
  var controller = TextEditingController();
  var calendarController = CalendarController();

  var listDate = [
    {
      "keterangan_pengeluaran": "Renovasi Masjid",
      "total": 100000,
      "date": "2024-03-17",
      "detail_pengeluaran": [
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        },
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        },
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        }
      ],
    },
    {
      "keterangan_pengeluaran": "Renovasi Masjid",
      "total": 100000,
      "date": "2024-03-18",
      "detail_pengeluaran": [
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        },
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        }
      ],
    },
    {
      "keterangan_pengeluaran": "Renovasi Masjid",
      "total": 100000,
      "date": "2024-03-19",
      "detail_pengeluaran": [
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        },
        {
          "keterangan": "Semen",
          "banyak": 10,
          "nominal": 1000000,
          "bukti": "image.jpg",
        }
      ],
    },
  ].obs;

  // Nav
  var indexOnScope = 0.obs;
  RxList<bool> onScope = [false, false, false].obs;

  bool isIndexOnScope(int index) {
    return indexOnScope.value == index && onScope[index];
  }

  // Date
  var dateNow = DateTime.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedYear = DateTime.now().year.obs;
  var selectedMonth = DateTime.now().month.obs;
  var selectedDay = DateTime.now().day.obs;
  var monthName = ''.obs;
  var dateTapped = ''.obs;

  var listUangKeluar = <Map<String, dynamic>>[].obs;

  void updateListUangKeluar() {
    listUangKeluar.assignAll(listDate
        .where((element) => element['date'] == dateTapped.value)
        .toList());
  }

  void updateListUang() {
    listUangKeluar.assignAll(listDate
        .where((element) =>
            element['date'] == formatDateTapped(selectedDate.value.toString()))
        .toList());
  }

  String formatDateTapped(String dateString) {
    DateTime date = DateTime.parse(dateString);
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  // Format tanggal
  String formatTanggal(String dateString) {
    initializeDateFormatting('id');
    DateTime date = DateTime.parse(dateString);
    var formatter = DateFormat('EEEE, d MMMM yyyy', 'id');
    return formatter.format(date);
  }

  // Tambah
  Future<void> selectDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      controller.text = formatDateTapped(picked.toString());
      dateTapped.value = formatDateTapped(picked.toString());
    }
  }
}
