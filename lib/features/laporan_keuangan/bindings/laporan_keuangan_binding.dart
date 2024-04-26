import 'package:get/get.dart';
import 'package:venturo_core/features/laporan_keuangan/controllers/laporan_keuangan_controller.dart';

class LaporanKeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LaporanKeuanganController());
  }
}
