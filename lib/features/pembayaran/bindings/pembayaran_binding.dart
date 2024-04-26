import 'package:get/get.dart';
import 'package:venturo_core/features/pembayaran/controllers/pembayaran_controller.dart';

class PembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PembayaranController());
  }
}
