import 'package:get/get.dart';

class RekapBulananController extends GetxController {
  static RekapBulananController get to => Get.find();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
