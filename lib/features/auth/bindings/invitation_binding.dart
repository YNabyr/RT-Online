import 'package:get/get.dart';
import 'package:venturo_core/features/auth/controllers/invitation_controller.dart';

class InvitationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InvitationController());
  }
}
