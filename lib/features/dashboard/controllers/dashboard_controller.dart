import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/view/ui/beranda_screen.dart';
import 'package:venturo_core/features/informasi/bindings/informasi_binding.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_list_screen.dart';
import 'package:venturo_core/features/iuran_warga/bindings/iuran_warga_binding.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/iuran_warga_screen.dart';
import 'package:venturo_core/features/struktur_rt/bindings/struktur_rt_binding.dart';
import 'package:venturo_core/features/struktur_rt/view/ui/struktur_rt_screen.dart';

import '../../beranda/bindings/beranda_binding.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  var currentIndex = 0.obs;

  final main = [
    BerandaScreen(),
    TataTertibListScreen(),
    IuranWargaScreen(),
    StrukturRtScreen(),
  ];

  // final bindings = [
  //   BerandaBinding(),
  //   InformasiBinding(),
  //   IuranWargaBinding(),
  //   StrukturRtBinding(),
  // ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  List<List<String>> icon = [
    [
      'assets/outline/home.svg',
      'assets/fill/home.svg',
    ],
    [
      'assets/outline/Tertib.svg',
      'assets/fill/Tertib.svg',
    ],
    [
      'assets/outline/Iuran.svg',
      'assets/fill/Iuran.svg',
    ],
    [
      'assets/outline/Structure.svg',
      'assets/fill/Structure.svg',
    ],
  ];
}
