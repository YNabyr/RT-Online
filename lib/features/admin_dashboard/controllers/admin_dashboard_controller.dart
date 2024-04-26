import 'package:get/get.dart';
import 'package:venturo_core/features/admin_area/controllers/admin_area_controller.dart';
import 'package:venturo_core/features/admin_area/view/ui/admin_area_screen.dart';
import 'package:venturo_core/features/beranda/view/ui/beranda_screen.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_list_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/iuran_warga_screen.dart';
import 'package:venturo_core/features/struktur_rt/view/ui/struktur_rt_screen.dart';

class AdminDashboardController extends GetxController {
  static AdminDashboardController get to => Get.find();

  var currentIndex = 0.obs;

  final main = [
    BerandaScreen(),
    TataTertibListScreen(),
    IuranWargaScreen(),
    StrukturRtScreen(),
    AdminAreaScreen(),
  ];

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
