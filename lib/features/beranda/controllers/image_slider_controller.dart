import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/repositories/image_slider_repository.dart';

class ImageSliderController extends GetxController {
  static ImageSliderController get to => Get.find();

  ImageSliderRepository repository = ImageSliderRepository();

  final RxInt currentIndex = 0.obs;

  void onIndexChanged(int index) {
    currentIndex.value = index;
  }

  void goToDetailScreen(List<String> imageUrls, int index) {
    Get.toNamed(Routes.detailBannerRoute,
        arguments: {'imageUrls': imageUrls, 'index': index});
  }
}
