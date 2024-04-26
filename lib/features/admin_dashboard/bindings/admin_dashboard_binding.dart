import 'package:get/get.dart';
import 'package:venturo_core/features/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:venturo_core/features/beranda/controllers/beranda_controller.dart';
import 'package:venturo_core/features/beranda/controllers/image_slider_controller.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminDashboardController());
    Get.put(ImageSliderController());
    Get.put(PengumumanController());
    Get.put(DataBlokController());
    Get.put(BerandaController());
  }
}
