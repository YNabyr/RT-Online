import 'package:get/get.dart';
import 'package:venturo_core/features/admin_uang_keluar/controllers/admin_tambah_uang_keluar_controller.dart';
import 'package:venturo_core/features/admin_uang_keluar/controllers/admin_uang_keluar_controller.dart';

class AdminUangKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminUangKeluarController());
    Get.put(AdminTambahUangKeluarController());
  }
}
