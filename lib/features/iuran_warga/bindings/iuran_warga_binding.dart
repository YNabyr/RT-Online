import 'package:get/get.dart';
import 'package:venturo_core/features/iuran_warga/controllers/iuran_warga_controller.dart';

class IuranWargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IuranWargaController());
  }
}
