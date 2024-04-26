import 'package:get/get.dart';

class RekapTahunanController extends GetxController {
  static RekapTahunanController get to => Get.find();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
