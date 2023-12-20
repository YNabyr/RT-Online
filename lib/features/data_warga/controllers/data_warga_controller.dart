import 'package:get/get.dart';

class DataWargaController extends GetxController {
  static DataWargaController get to => Get.find();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
