// pengumuman_controller.dart
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/repositories/pengumuman_repository.dart';

class PengumumanController extends GetxController {
  static PengumumanController get to => Get.find();
  final PengumumanRepository _repository = PengumumanRepository();
  late RxList<Map<String, String>> pengumumanList;

  @override
  void onInit() {
    pengumumanList = _repository.getPengumumanList().obs;
    super.onInit();
  }

  void navigateToDetailPage(int index) {
    final Map<String, String> pengumuman = pengumumanList[index];

    Get.toNamed(Routes.detailPengumumanRoute, arguments: pengumuman);
  }
}
