import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/beranda_controller.dart';

class BerandaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BerandaController());
  }
}
