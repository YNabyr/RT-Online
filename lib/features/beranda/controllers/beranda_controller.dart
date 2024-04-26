import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

class BerandaController extends GetxController {
  static BerandaController get to => Get.find();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void onInit() async {
    super.onInit();
    print("INI BERANDA CONTROLLER : ");
    await getUserInfo();
  }

  var userInfo = {}.obs;

  // Get Badge
  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await _prefs;
    userInfo.value = await jsonDecode(prefs.getString('userInfo')!);
    print("USER INFO : ");
    print(userInfo);
  }
}
