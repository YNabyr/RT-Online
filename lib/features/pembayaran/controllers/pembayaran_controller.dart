import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/pembayaran/repositories/pembayaran_repository.dart';

class PembayaranController extends GetxController {
  static PembayaranController get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    // Initialize the repository and get the listPembayaran
    PembayaranRepository pembayaranRepository = PembayaranRepository();
    listPembayaran.assignAll(pembayaranRepository.getListPembayaran());

    // Sorting the listPembayaran based on 'terbayar'
    listPembayaran.sort((a, b) {
      if (a['terbayar'] == true && b['terbayar'] == false) {
        return -1; // true comes first
      } else if (a['terbayar'] == false && b['terbayar'] == true) {
        return 1; // false comes after true
      } else {
        return 0; // no change in order
      }
    });

    // Initialize other variables
    listCheck.value = [];
    listNominal.value = [];
    listBulan.value = [];
    for (var i = 0; i < listPembayaran.length; i++) {
      if (listPembayaran[i]['terbayar'] == true) {
        listCheck.add(true);
      }

      if (listPembayaran[i]['terbayar'] == false) {
        listCheck.add(false);
      }

      listNominal.add(listPembayaran[i]['nominal']);
      listBulan.add(listPembayaran[i]['bulan']);
    }

    // init list Check
    listFalseCheck.value = [];
    for (var i = 0;
        i < listPembayaran.where((e) => e.containsValue(false)).length;
        i++) {
      listFalseCheck.add(false);
    }

    listTrueCheck.value = [];
    for (var i = 0;
        i < listPembayaran.where((e) => e.containsValue(true)).length;
        i++) {
      listTrueCheck.add(true);
    }

    totalJumlah.value = 0;
    listBayar.value = [];
  }

  // List Pembayaran
  RxList<Map<String, dynamic>> listPembayaran = <Map<String, dynamic>>[].obs;
  var listBulan = [].obs;

  // Date
  var currentDate = DateTime.now().obs;

  // Checkbox
  RxList<bool> listCheck = <bool>[].obs;
  RxList<bool> listFalseCheck = <bool>[].obs;
  RxList<bool> listTrueCheck = <bool>[].obs;

  var isChecked = false.obs;
  var isCheckedAll = false.obs;

  // Pembayaran
  var bulan = [].obs;
  var listNominal = <int>[].obs;
  var totalPembayaran = 0.obs;
  var totalJumlah = 0.obs;
  var listBayar = [].obs;

  getJumlahTotal(int index) {
    if (listCheck[index] == true) {
      totalJumlah.value += 1;
    } else if (listCheck
        .sublist(listTrueCheck.length, listCheck.length)
        .every((element) => element == false)) {
      totalJumlah.value = 0;
    } else if (listCheck[index] == false) {
      totalJumlah.value -= 1;
    }

    return totalJumlah.value;
  }

  getJumlahPembayaran(int index) {
    if (listCheck[index] == true) {
      totalPembayaran.value += listNominal[index];
    } else if (listCheck
        .sublist(listTrueCheck.length, listCheck.length)
        .every((element) => element == false)) {
      totalPembayaran.value = 0;
    } else if (listCheck[index] == false) {
      totalPembayaran.value -= listNominal[index];
    }

    return totalPembayaran.value;
  }

  getListBayar(int index) {
    if (listCheck[index] == true) {
      listBayar.add(listNominal[index]);
    } else {
      if (listBayar.isNotEmpty) {
        listBayar.remove(listNominal[index]);
      }
    }
  }

  getBulan(int index) {
    if (listCheck[index] == true) {
      bulan.add(listBulan[index]);
    } else {
      if (listBulan.isNotEmpty) {
        bulan.remove(listBulan[index]);
      }
    }
  }

  formatTanggal(String date) {
    String dateTimeString = date;
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format tanggal
    String formattedDate = DateFormat('d MMMM yyyy  HH:mm').format(dateTime);

    return formattedDate;
  }
}
