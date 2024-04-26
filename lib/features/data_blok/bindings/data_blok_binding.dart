import 'package:get/get.dart';
import 'package:venturo_core/features/data_blok/controllers/admin_tambah_blok.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';

import '../controllers/data_blok_controller.dart';

class DataBlokBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataBlokController());
    Get.put(AdminTambahBlok());
  }
}
