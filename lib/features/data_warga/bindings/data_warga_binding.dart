import 'package:get/get.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';

class DataWargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataWargaController());
  }
}
