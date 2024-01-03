import 'package:get/get.dart';
import 'package:venturo_core/features/pengumuman_banner/repositories/detail_banner_repository.dart';

class DetailBannerController extends GetxController {
  static DetailBannerController get to => Get.find();

  final DetailBannerRepository _repository = DetailBannerRepository();
  DetailBannerRepository get repository {
    return _repository;
  }

  var jumlahBaca = [].obs;

  RxList<String> imageUrls = <String>[].obs;

  @override
  void onInit() {
    // Inisialisasi imageUrls dengan data dari repository
    imageUrls.assignAll(_repository.getImageUrls().reversed.take(4));
    jumlahBaca.assignAll(_repository.getImageUrls());

    super.onInit();
  }
}
