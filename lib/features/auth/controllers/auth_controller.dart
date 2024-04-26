import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/features/auth/models/profile.dart';

import '../../../configs/routes/route.dart';
import '../../../utils/services/local_db_services.dart';
import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() async {
    super.onInit();

    print("INI AUTH CONTROLLER :");
    await checkLoginStatus();
  }

  @override
  void dispose() {
    // Dispose TextEditingController to avoid memory leaks
    super.dispose();
  }

  final RxBool isLoggedIn = false.obs;

  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await _prefs;
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn.value == true) {
      // If the user is already logged in, you may perform additional actions
      isLoading.value = true;

      try {
        await AuthRepository.getUser(prefs.getString('userPhoneNumber')!,
            prefs.getString('userPassword')!);
        print(prefs.getString('userPhoneNumber')!);
        print(prefs.getString('userPassword')!);
      } catch (e) {
        // Handle jika terjadi kesalahan selama permintaan
        print("Error during request: $e");
      }

      isLoading.value = false;
    }
  }

  // Variabel
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  var isLoading = false.obs;
  var isObscure = true.obs;
  var suffixIcon = "assets/outline/eye-off.svg".obs;

  // setObscure
  changeIcon() {
    isObscure.value = !isObscure.value;
    if (isObscure.value == true) {
      suffixIcon.value = "assets/outline/eye-off.svg";
    } else {
      suffixIcon.value = "assets/outline/eye.svg";
    }
  }

  // Login User
  loginUser({required String phoneNumber, required String password}) async {
    await AuthRepository.getUser(phoneNumber, password);
  }

  void toInvitation() {
    Get.toNamed(Routes.invitationRoute);
  }

  void toLogin() {
    Get.toNamed(Routes.loginRoute);
  }

  void toLupaPassword() {
    Get.toNamed(Routes.lupaPasswordRoute);
  }

  void toLupaPasswordVerification() {
    Get.toNamed(Routes.lupaPasswordVerificationRoute);
  }

  toPasswordBaru() {
    Get.toNamed(Routes.passwordBaruRoute);
  }

  void toDashboard() {
    Get.offAllNamed(Routes.adminDashboardRoute);
  }
}
