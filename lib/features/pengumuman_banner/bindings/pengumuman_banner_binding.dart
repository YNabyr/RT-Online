import 'package:get/get.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/pengumuman_banner_controller.dart';

class PengumumanBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PengumumanBannerController());
  }
}
