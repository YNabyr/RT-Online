import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/view/ui/beranda_screen.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_list_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/iuran_warga_screen.dart';
import 'package:venturo_core/features/struktur_rt/view/ui/struktur_rt_screen.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  var currentIndex = 0.obs;

  final main = [
    BerandaScreen(),
    const TataTertibListScreen(),
    IuranWargaScreen(),
    StrukturRtScreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  List<List<String>> icon = [
    [
      'assets/images/ic_home.png',
      'assets/images/ic_home_fill.png',
    ],
    [
      'assets/images/ic_tertib.png',
      'assets/images/ic_tertib_fill.png',
    ],
    [
      'assets/images/ic_iuran.png',
      'assets/images/ic_iuran_fill.png',
    ],
    [
      'assets/images/ic_struktur.png',
      'assets/images/ic_struktur_fill.png',
    ],
  ];
}
