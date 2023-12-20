import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  void toInvitation() {
    Get.toNamed(Routes.invitationRoute);
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
    Get.offAllNamed(Routes.dashboardRoute);
  }
}
