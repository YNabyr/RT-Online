import 'package:get/get.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_edit_pungumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_tambah_pengumuman_controller.dart';

class AdminPengumumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminPengumumanController());
    Get.put(AdminTambahPengumumanController());
    Get.put(AdminEditPengumumanController());
  }
}
