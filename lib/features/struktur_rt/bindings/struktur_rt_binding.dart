import 'package:get/get.dart';
import 'package:venturo_core/features/struktur_rt/controllers/struktur_rt_controller.dart';

class StrukturRtBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StrukturRtController());
  }
}
