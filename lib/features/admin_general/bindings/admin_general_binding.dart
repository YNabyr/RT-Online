import 'package:get/get.dart';
import 'package:venturo_core/features/admin_general/controllers/admin_general_controller.dart';

class AdminGeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminGeneralController());
  }
}
