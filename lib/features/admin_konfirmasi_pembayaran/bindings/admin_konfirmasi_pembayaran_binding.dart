import 'package:get/get.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/controllers/admin_konfirmasi_pembayaran_controller.dart';

class AdminKonfirmasiPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminKonfirmasiPembayaranController());
  }
}
