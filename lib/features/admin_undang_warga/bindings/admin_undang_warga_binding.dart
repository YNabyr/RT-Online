import 'package:get/get.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_undang_warga/controllers/admin_undang_warga_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

class AdminUndangWargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminUndangWargaController());
    Get.put(AdminHakAksesController());
    Get.put(AdminIuranController());
    Get.put(DataBlokController());
  }
}
