import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_edit_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_kategori_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_edit_informasi.dart';

import '../controllers/admin_informasi_controller.dart';

class AdminInformasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminInformasiController());
    Get.put(AdminTambahInformasiController());
    Get.put(AdminEditInformasiController());

    Get.put(AdminTambahKategoriInformasiController());
  }
}
