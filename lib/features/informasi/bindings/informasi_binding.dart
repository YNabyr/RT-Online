import 'package:get/get.dart';
import 'package:venturo_core/features/informasi/controllers/informasi_controller.dart';

class InformasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InformasiController());
  }
}
