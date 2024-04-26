import 'package:get/get.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';

class AdminHakAksesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminHakAksesController());
  }
}
