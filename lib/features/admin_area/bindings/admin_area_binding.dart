import 'package:get/get.dart';
import 'package:venturo_core/features/admin_area/controllers/admin_area_controller.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';

class AdminAreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminAreaController());
  }
}
