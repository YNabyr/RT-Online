import 'package:get/get.dart';
import 'package:venturo_core/features/admin_uang_masuk/controllers/admin_uang_masuk_controller.dart';

class AdminUangMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminUangMasukController());
  }
}
