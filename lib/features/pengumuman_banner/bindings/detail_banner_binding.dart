import 'package:get/get.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/detail_banner_controller.dart';

class DetailBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailBannerController());
  }
}
