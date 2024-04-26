import 'package:get/get.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';

class AdminIuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminIuranController());
    Get.put(DataWargaController());
    Get.put(DataBlokController());
  }
}
